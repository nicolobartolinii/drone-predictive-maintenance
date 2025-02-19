function dataOut = syncAndPrepare(matFile, FsRef, syncMode)

    load(matFile);

    PWM = RCOU(:,11:16);  
    dataRaw.PWM = PWM;

    [IMU_0, IMU_1, IMU_2] = mergeSignals(IMU_0, IMU_1, IMU_2);
    [VIBE_0, VIBE_1, VIBE_2] = mergeSignals(VIBE_0, VIBE_1, VIBE_2);

    nRow = min([size(IMU_0,1), size(IMU_1,1), size(IMU_2,1)]);
    GYRX = (IMU_0(1:nRow,4) + IMU_1(1:nRow,4) + IMU_2(1:nRow,4))/3;
    GYRY = (IMU_0(1:nRow,5) + IMU_1(1:nRow,5) + IMU_2(1:nRow,5))/3;
    GYRZ = (IMU_0(1:nRow,6) + IMU_1(1:nRow,6) + IMU_2(1:nRow,6))/3;

    ACCX = (IMU_0(1:nRow,7) + IMU_1(1:nRow,7) + IMU_2(1:nRow,7))/3;
    ACCY = (IMU_0(1:nRow,8) + IMU_1(1:nRow,8) + IMU_2(1:nRow,8))/3;
    ACCZ = (IMU_0(1:nRow,9) + IMU_1(1:nRow,9) + IMU_2(1:nRow,9))/3;

    dataRaw.ACC = [ACCX ACCY ACCZ];
    dataRaw.GYR = [GYRX GYRY GYRZ];

    PWM = RCOU(:,11:16);
    dataRaw.PWM = PWM;

    numMotors = 6;
    ESCtemp = zeros(max(cellfun(@(x) size(x,1), {ESC_0,ESC_1,ESC_2,ESC_3,ESC_4,ESC_5})),numMotors);
    CURRtemp = zeros(max(cellfun(@(x) size(x,1), {ESC_0,ESC_1,ESC_2,ESC_3,ESC_4,ESC_5})),numMotors);
    for k = 1:numMotors
        tmpName  = eval(['ESC_' num2str(k-1)]);
        ESCtemp(1:size(tmpName,1),k) = tmpName(:,4);
        CURRtemp(1:size(tmpName,1),k) = tmpName(:,7);
    end
    dataRaw.ESC = ESCtemp;
    dataRaw.CURR = CURRtemp;

    dataRaw.DES_ROLL = ATT(:,3);
    dataRaw.ROLL = ATT(:,4);
    dataRaw.DES_PITCH = ATT(:,5);
    dataRaw.PITCH = ATT(:,6);
    dataRaw.DES_YAW = ATT(:,7);
    dataRaw.YAW = ATT(:,8);

    nRowVibe = min([size(VIBE_0,1), size(VIBE_1,1), size(VIBE_2,1)]);

    vibeX = (VIBE_0(1:nRowVibe,4) + VIBE_1(1:nRowVibe,4) + VIBE_2(1:nRowVibe,4)) / 3;
    vibeY = (VIBE_0(1:nRowVibe,5) + VIBE_1(1:nRowVibe,5) + VIBE_2(1:nRowVibe,5)) / 3;
    vibeZ = (VIBE_0(1:nRowVibe,6) + VIBE_1(1:nRowVibe,6) + VIBE_2(1:nRowVibe,6)) / 3;
    dataRaw.VIBE = [vibeX, vibeY, vibeZ];

    dataRaw.RATE = RATE(:, 3:end);
    Time.RATE = seconds(RATE(:,2)/1e6);

    Time.IMU = seconds(IMU_0(1:nRow,2)/1e6);
    Time.PWM = seconds(RCOU(:,2)/1e6);
    Time.ESC = cell(numMotors,1);
    Time.CURR = cell(numMotors,1);
    for k=1:numMotors
        tmpName = eval(['ESC_' num2str(k-1)]);
        Time.ESC{k} = seconds(tmpName(:,2)/1e6);
        Time.CURR{k} = seconds(tmpName(:,2)/1e6);
    end

    Time.ATT = seconds(ATT(:,2)/1e6);
    Time.VIBE = seconds(VIBE_0(1:nRowVibe,2)/1e6);

    t_candidates = [Time.IMU(1), Time.PWM(1), Time.ATT(1), Time.VIBE(1)];
    for k = 1:numMotors
        t_candidates(end+1) = Time.ESC{k}(1);
        t_candidates(end+1) = Time.CURR{k}(1);
    end
    t_candidates(end+1) = Time.RATE(1);
    t0 = min(t_candidates);

    Time.IMU = Time.IMU - t0;
    Time.PWM = Time.PWM - t0;
    Time.ATT = Time.ATT - t0;
    Time.VIBE = Time.VIBE - t0;
    for k = 1:numMotors
        Time.ESC{k} = Time.ESC{k} - t0;
        Time.CURR{k} = Time.CURR{k} - t0;
    end
    Time.RATE = Time.RATE - t0;

    t_candidates_end = [Time.IMU(end), Time.PWM(end), Time.ATT(end), Time.VIBE(end)];
    for k = 1:numMotors
        t_candidates_end(end+1) = Time.ESC{k}(end);
        t_candidates_end(end+1) = Time.CURR{k}(end);
    end
    t_candidates_end(end+1) = Time.RATE(end);
    tEnd = max(t_candidates_end);
    timeUniform = (0:1/FsRef:seconds(tEnd))';

    switch lower(syncMode) % switch per la predisposizione a un eventuale altro metodo di sync
        case 'zoh'
            dataOut.ACC_sync = zoh(dataRaw.ACC, seconds(Time.IMU), timeUniform);
            dataOut.GYR_sync = zoh(dataRaw.GYR, seconds(Time.IMU), timeUniform);
            dataOut.PWM_sync = zoh(dataRaw.PWM, seconds(Time.PWM), timeUniform);
            dataOut.ESC_sync = zeros(length(timeUniform), numMotors);
            dataOut.CURR_sync = zeros(length(timeUniform), numMotors);
            for k=1:numMotors
                dataOut.ESC_sync(:,k) = zoh(ESCtemp(:,k), seconds(Time.ESC{k}), timeUniform);
                dataOut.CURR_sync(:,k) = zoh(CURRtemp(:,k), seconds(Time.CURR{k}), timeUniform);
            end
            dataOut.VIBE_sync = zoh(dataRaw.VIBE, seconds(Time.VIBE), timeUniform);
            dataOut.ATT_sync.DES_ROLL = zoh(dataRaw.DES_ROLL, seconds(Time.ATT), timeUniform);
            dataOut.ATT_sync.ROLL     = zoh(dataRaw.ROLL, seconds(Time.ATT), timeUniform);
            dataOut.ATT_sync.DES_PITCH= zoh(dataRaw.DES_PITCH, seconds(Time.ATT), timeUniform);
            dataOut.ATT_sync.PITCH    = zoh(dataRaw.PITCH, seconds(Time.ATT), timeUniform);
            dataOut.ATT_sync.DES_YAW  = zoh(dataRaw.DES_YAW, seconds(Time.ATT), timeUniform);
            dataOut.ATT_sync.YAW      = zoh(dataRaw.YAW, seconds(Time.ATT), timeUniform);
            dataOut.RATE_sync = zoh(dataRaw.RATE, seconds(Time.RATE), timeUniform);
        otherwise
            error("Metodo non ancora implementato");
    end
    dataOut.timeUniform = timeUniform;
end