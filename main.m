clear all
clc

fileList = [ ...
 "NO_FAULT1.mat","NO_FAULT2.mat","NO_FAULT3.mat","NO_FAULT4.mat","NO_FAULT5.mat","NO_FAULT6.mat", ...
 "FAULT_M1_5.mat","FAULT_M2_5.mat","FAULT_M3_5.mat","FAULT_M4_5.mat","FAULT_M5_5.mat","FAULT_M6_5.mat", ...
 "FAULT_M1_10.mat","FAULT_M2_10.mat","FAULT_M3_10.mat","FAULT_M4_10.mat","FAULT_M5_10.mat","FAULT_M6_10.mat" ...
];
nFiles = numel(fileList);

FsTarget = 350; 

syncMethod = "zoh";

dataAll = cell(nFiles,1);

for i = 1:nFiles
    disp("Elaboro il file: " + fileList(i));
    dataAll{i} = syncAndPrepare(fileList(i), FsTarget, syncMethod);
end

dataTable = table('Size',[nFiles 0]);

for i = 1:nFiles
    dat = dataAll{i};   

    idxcut = sum(dat.PWM_sync, 2) < 1500 * size(dat.PWM_sync, 2);
    dat.ACC_sync(idxcut,:) = [];
    dat.GYR_sync(idxcut,:) = [];
    dat.PWM_sync(idxcut,:) = [];
    dat.ESC_sync(idxcut,:) = [];
    dat.CURR_sync(idxcut,:) = [];
    dat.ATT_sync.DES_PITCH(idxcut,:) = [];
    dat.ATT_sync.PITCH(idxcut,:) = [];
    dat.ATT_sync.DES_ROLL(idxcut,:) = [];
    dat.ATT_sync.ROLL(idxcut,:) = [];
    dat.ATT_sync.DES_YAW(idxcut,:) = [];
    dat.ATT_sync.YAW(idxcut,:) = [];
    dat.VIBE_sync(idxcut,:) = [];
    dat.RATE_sync(idxcut,:) = [];
    if isfield(dat, 'timeUniform')
        dat.timeUniform(idxcut,:) = [];
    end

    TT_accX = array2timetable(dat.ACC_sync(:,1), 'SampleRate', FsTarget);
    TT_accY = array2timetable(dat.ACC_sync(:,2), 'SampleRate', FsTarget);
    TT_accZ = array2timetable(dat.ACC_sync(:,3), 'SampleRate', FsTarget);

    TT_gyrX = array2timetable(dat.GYR_sync(:,1), 'SampleRate', FsTarget);
    TT_gyrY = array2timetable(dat.GYR_sync(:,2), 'SampleRate', FsTarget);
    TT_gyrZ = array2timetable(dat.GYR_sync(:,3), 'SampleRate', FsTarget);

    TT_pwm1 = array2timetable(dat.PWM_sync(:,1),'SampleRate',FsTarget);
    TT_pwm2 = array2timetable(dat.PWM_sync(:,2),'SampleRate',FsTarget);
    TT_pwm3 = array2timetable(dat.PWM_sync(:,3),'SampleRate',FsTarget);
    TT_pwm4 = array2timetable(dat.PWM_sync(:,4),'SampleRate',FsTarget);
    TT_pwm5 = array2timetable(dat.PWM_sync(:,2),'SampleRate',FsTarget);
    TT_pwm6 = array2timetable(dat.PWM_sync(:,6),'SampleRate',FsTarget);

    TT_esc1 = array2timetable(dat.ESC_sync(:,1),'SampleRate',FsTarget);
    TT_esc2 = array2timetable(dat.ESC_sync(:,2),'SampleRate',FsTarget);
    TT_esc3 = array2timetable(dat.ESC_sync(:,3),'SampleRate',FsTarget);
    TT_esc4 = array2timetable(dat.ESC_sync(:,4),'SampleRate',FsTarget);
    TT_esc5 = array2timetable(dat.ESC_sync(:,5),'SampleRate',FsTarget);
    TT_esc6 = array2timetable(dat.ESC_sync(:,6),'SampleRate',FsTarget);

    TT_curr1 = array2timetable(dat.CURR_sync(:, 1), 'SampleRate', FsTarget);
    TT_curr2 = array2timetable(dat.CURR_sync(:, 2), 'SampleRate', FsTarget);
    TT_curr3 = array2timetable(dat.CURR_sync(:, 3), 'SampleRate', FsTarget);
    TT_curr4 = array2timetable(dat.CURR_sync(:, 4), 'SampleRate', FsTarget);
    TT_curr5 = array2timetable(dat.CURR_sync(:, 5), 'SampleRate', FsTarget);
    TT_curr6 = array2timetable(dat.CURR_sync(:, 6), 'SampleRate', FsTarget);

    TT_des_pitch = array2timetable(dat.ATT_sync.DES_PITCH, 'SampleRate', FsTarget);
    TT_pitch = array2timetable(dat.ATT_sync.PITCH, 'SampleRate', FsTarget);
    TT_des_roll = array2timetable(dat.ATT_sync.DES_ROLL, 'SampleRate', FsTarget);
    TT_roll = array2timetable(dat.ATT_sync.ROLL, 'SampleRate', FsTarget);
    TT_des_yaw = array2timetable(dat.ATT_sync.DES_YAW, 'SampleRate', FsTarget);
    TT_yaw = array2timetable(dat.ATT_sync.YAW, 'SampleRate', FsTarget);

    TT_vibe_x = array2timetable(dat.VIBE_sync(:,1), 'SampleRate', FsTarget);
    TT_vibe_y = array2timetable(dat.VIBE_sync(:,2), 'SampleRate', FsTarget);
    TT_vibe_z = array2timetable(dat.VIBE_sync(:,3), 'SampleRate', FsTarget);

    TT_rate = array2timetable(dat.RATE_sync, 'SampleRate', FsTarget);
    
    dataTable.accX(i) = {TT_accX};
    dataTable.accY(i) = {TT_accY};
    dataTable.accZ(i) = {TT_accZ};
    dataTable.gyrX(i) = {TT_gyrX};
    dataTable.gyrY(i) = {TT_gyrY};
    dataTable.gyrZ(i) = {TT_gyrZ};
    dataTable.pwm1(i) = {TT_pwm1};
    dataTable.pwm2(i) = {TT_pwm2};
    dataTable.pwm3(i) = {TT_pwm3};
    dataTable.pwm4(i) = {TT_pwm4};
    dataTable.pwm5(i) = {TT_pwm5};
    dataTable.pwm6(i) = {TT_pwm6};
    dataTable.esc1(i) = {TT_esc1};
    dataTable.esc2(i) = {TT_esc2};
    dataTable.esc3(i) = {TT_esc3};
    dataTable.esc4(i) = {TT_esc4};
    dataTable.esc5(i) = {TT_esc5};
    dataTable.esc6(i) = {TT_esc6};
    dataTable.curr1(i) = {TT_curr1};
    dataTable.curr2(i) = {TT_curr2};
    dataTable.curr3(i) = {TT_curr3};
    dataTable.curr4(i) = {TT_curr4};
    dataTable.curr5(i) = {TT_curr5};
    dataTable.curr6(i) = {TT_curr6};
    dataTable.desRoll(i) = {TT_des_roll};
    dataTable.roll(i) = {TT_roll};
    dataTable.desPitch(i) = {TT_des_pitch};
    dataTable.pitch(i) = {TT_pitch};
    dataTable.desYaw(i) = {TT_des_yaw};
    dataTable.yaw(i) = {TT_yaw};
    dataTable.vibeX(i) = {TT_vibe_x};
    dataTable.vibeY(i) = {TT_vibe_y};
    dataTable.vibeZ(i) = {TT_vibe_z};
    dataTable.rate(i) = {TT_rate};

    % IMPOSTAZIONE FAULT CODES MULTI-CLASSE (noguasto/5-10%)
    %if i <= 6
    %    faultVal = 0;
    %elseif i <= 12
    %    faultVal = 5;
    %else
    %    faultVal = 10;
    %end

    % IMPOSTAZIONE FAULT CODES BINARIO (guasto/noguasto)
    if i <= 6
        faultVal = 0;
    else
        faultVal = 1;
    end

    % IMPOSTAZIONE FAULT CODES MULTI-CLASSE (noguasto/motore i-esimo)
    %if i <= 6
    %    faultVal = 0;
    %elseif i == 7 || i == 13
    %    faultVal = 1;
    %elseif i == 8 || i == 14
    %    faultVal = 2;
    %elseif i == 9 || i == 15
    %    faultVal = 3;
    %elseif i == 10 || i == 16
    %    faultVal = 4;
    %elseif i == 11 || i == 17
    %    faultVal = 5;
    %elseif i == 12
    %    faultVal = 6;
    %end

    % IMPOSTAZIONE FAULT CODES MULTI-CLASSE (noguasto/motore i-esimo con
    % 5%/10%)
    %if i <= 6
    %    faultVal = 0;
    %else
    %    faultVal = i-6;
    %end

    dataTable.faultCode(i) = categorical(faultVal);
end
for i = 1:nFiles
    t = dataAll{i}.timeUniform;
    
    idx = (t >= 2) & (t <= t(end)-2);
    
    dataAll{i}.ACC_sync = dataAll{i}.ACC_sync(idx,:);
    dataAll{i}.GYR_sync = dataAll{i}.GYR_sync(idx,:);
    dataAll{i}.PWM_sync = dataAll{i}.PWM_sync(idx,:);
    dataAll{i}.ESC_sync = dataAll{i}.ESC_sync(idx,:);
    dataAll{i}.CURR_sync = dataAll{i}.CURR_sync(idx,:);
    
    dataAll{i}.timeUniform = t(idx);
end

save("dataForDFD.mat", "dataTable");

disp("Dati pronti per il DFD!");