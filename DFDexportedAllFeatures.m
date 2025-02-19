function [featureTable,outputTable] = diagnosticFeatures(inputData)
%DIAGNOSTICFEATURES recreates results in Diagnostic Feature Designer.
%
% Input:
%  inputData: A table or a cell array of tables/matrices containing the
%  data as those imported into the app.
%
% Output:
%  featureTable: A table containing all features and condition variables.
%  outputTable: A table containing the computation results.
%
% This function computes spectra:
%  accX_ps/SpectrumData
%  accY_ps/SpectrumData
%  accZ_ps/SpectrumData
%  gyrX_ps/SpectrumData
%  gyrY_ps/SpectrumData
%  gyrZ_ps/SpectrumData
%  pwm1_ps/SpectrumData
%  pwm2_ps/SpectrumData
%  pwm3_ps/SpectrumData
%  pwm4_ps/SpectrumData
%  pwm5_ps/SpectrumData
%  pwm6_ps/SpectrumData
%  esc1_ps/SpectrumData
%  esc2_ps/SpectrumData
%  esc3_ps/SpectrumData
%  esc4_ps/SpectrumData
%  esc5_ps/SpectrumData
%  esc6_ps/SpectrumData
%  curr1_ps/SpectrumData
%  curr2_ps/SpectrumData
%  curr3_ps/SpectrumData
%  curr4_ps/SpectrumData
%  curr5_ps/SpectrumData
%  curr6_ps/SpectrumData
%  desRoll_ps/SpectrumData
%  roll_ps/SpectrumData
%  desPitch_ps/SpectrumData
%  pitch_ps/SpectrumData
%  desYaw_ps/SpectrumData
%  yaw_ps/SpectrumData
%  vibeX_ps/SpectrumData
%  vibeY_ps/SpectrumData
%  vibeZ_ps/SpectrumData
%  rate_ps/SpectrumData
%  rate_ps_1/SpectrumData
%  rate_ps_2/SpectrumData
%  rate_ps_3/SpectrumData
%  rate_ps_4/SpectrumData
%  rate_ps_5/SpectrumData
%  rate_ps_6/SpectrumData
%  rate_ps_7/SpectrumData
%  rate_ps_8/SpectrumData
%  rate_ps_9/SpectrumData
%  rate_ps_10/SpectrumData
%  rate_ps_11/SpectrumData
%
% This function computes features:
%  accX_sigstats/CrestFactor
%  accX_sigstats/Kurtosis
%  accX_sigstats/Mean
%  accX_sigstats/PeakValue
%  accX_sigstats/RMS
%  accX_sigstats/Skewness
%  accX_sigstats/Std
%  accY_sigstats/CrestFactor
%  accY_sigstats/Kurtosis
%  accY_sigstats/Mean
%  accY_sigstats/PeakValue
%  accY_sigstats/RMS
%  accY_sigstats/Skewness
%  accY_sigstats/Std
%  accZ_sigstats/CrestFactor
%  accZ_sigstats/Kurtosis
%  accZ_sigstats/Mean
%  accZ_sigstats/PeakValue
%  accZ_sigstats/RMS
%  accZ_sigstats/Skewness
%  accZ_sigstats/Std
%  gyrX_sigstats/CrestFactor
%  gyrX_sigstats/Kurtosis
%  gyrX_sigstats/Mean
%  gyrX_sigstats/PeakValue
%  gyrX_sigstats/RMS
%  gyrX_sigstats/Skewness
%  gyrX_sigstats/Std
%  gyrY_sigstats/CrestFactor
%  gyrY_sigstats/Kurtosis
%  gyrY_sigstats/Mean
%  gyrY_sigstats/PeakValue
%  gyrY_sigstats/RMS
%  gyrY_sigstats/Skewness
%  gyrY_sigstats/Std
%  gyrZ_sigstats/CrestFactor
%  gyrZ_sigstats/Kurtosis
%  gyrZ_sigstats/Mean
%  gyrZ_sigstats/PeakValue
%  gyrZ_sigstats/RMS
%  gyrZ_sigstats/Skewness
%  gyrZ_sigstats/Std
%  pwm1_sigstats/CrestFactor
%  pwm1_sigstats/Kurtosis
%  pwm1_sigstats/Mean
%  pwm1_sigstats/PeakValue
%  pwm1_sigstats/RMS
%  pwm1_sigstats/Skewness
%  pwm1_sigstats/Std
%  pwm2_sigstats/CrestFactor
%  pwm2_sigstats/Kurtosis
%  pwm2_sigstats/Mean
%  pwm2_sigstats/PeakValue
%  pwm2_sigstats/RMS
%  pwm2_sigstats/Skewness
%  pwm2_sigstats/Std
%  pwm3_sigstats/CrestFactor
%  pwm3_sigstats/Kurtosis
%  pwm3_sigstats/Mean
%  pwm3_sigstats/PeakValue
%  pwm3_sigstats/RMS
%  pwm3_sigstats/Skewness
%  pwm3_sigstats/Std
%  pwm4_sigstats/CrestFactor
%  pwm4_sigstats/Kurtosis
%  pwm4_sigstats/Mean
%  pwm4_sigstats/PeakValue
%  pwm4_sigstats/RMS
%  pwm4_sigstats/Skewness
%  pwm4_sigstats/Std
%  pwm5_sigstats/CrestFactor
%  pwm5_sigstats/Kurtosis
%  pwm5_sigstats/Mean
%  pwm5_sigstats/PeakValue
%  pwm5_sigstats/RMS
%  pwm5_sigstats/Skewness
%  pwm5_sigstats/Std
%  pwm6_sigstats/CrestFactor
%  pwm6_sigstats/Kurtosis
%  pwm6_sigstats/Mean
%  pwm6_sigstats/PeakValue
%  pwm6_sigstats/RMS
%  pwm6_sigstats/Skewness
%  pwm6_sigstats/Std
%  esc1_sigstats/CrestFactor
%  esc1_sigstats/Kurtosis
%  esc1_sigstats/Mean
%  esc1_sigstats/PeakValue
%  esc1_sigstats/RMS
%  esc1_sigstats/Skewness
%  esc1_sigstats/Std
%  esc2_sigstats/CrestFactor
%  esc2_sigstats/Kurtosis
%  esc2_sigstats/Mean
%  esc2_sigstats/PeakValue
%  esc2_sigstats/RMS
%  esc2_sigstats/Skewness
%  esc2_sigstats/Std
%  esc3_sigstats/CrestFactor
%  esc3_sigstats/Kurtosis
%  esc3_sigstats/Mean
%  esc3_sigstats/PeakValue
%  esc3_sigstats/RMS
%  esc3_sigstats/Skewness
%  esc3_sigstats/Std
%  esc4_sigstats/CrestFactor
%  esc4_sigstats/Kurtosis
%  esc4_sigstats/Mean
%  esc4_sigstats/PeakValue
%  esc4_sigstats/RMS
%  esc4_sigstats/Skewness
%  esc4_sigstats/Std
%  esc5_sigstats/CrestFactor
%  esc5_sigstats/Kurtosis
%  esc5_sigstats/Mean
%  esc5_sigstats/PeakValue
%  esc5_sigstats/RMS
%  esc5_sigstats/Skewness
%  esc5_sigstats/Std
%  esc6_sigstats/CrestFactor
%  esc6_sigstats/Kurtosis
%  esc6_sigstats/Mean
%  esc6_sigstats/PeakValue
%  esc6_sigstats/RMS
%  esc6_sigstats/Skewness
%  esc6_sigstats/Std
%  curr1_sigstats/CrestFactor
%  curr1_sigstats/Kurtosis
%  curr1_sigstats/Mean
%  curr1_sigstats/PeakValue
%  curr1_sigstats/RMS
%  curr1_sigstats/Skewness
%  curr1_sigstats/Std
%  curr2_sigstats/CrestFactor
%  curr2_sigstats/Kurtosis
%  curr2_sigstats/Mean
%  curr2_sigstats/PeakValue
%  curr2_sigstats/RMS
%  curr2_sigstats/Skewness
%  curr2_sigstats/Std
%  curr3_sigstats/CrestFactor
%  curr3_sigstats/Kurtosis
%  curr3_sigstats/Mean
%  curr3_sigstats/PeakValue
%  curr3_sigstats/RMS
%  curr3_sigstats/Skewness
%  curr3_sigstats/Std
%  curr4_sigstats/CrestFactor
%  curr4_sigstats/Kurtosis
%  curr4_sigstats/Mean
%  curr4_sigstats/PeakValue
%  curr4_sigstats/RMS
%  curr4_sigstats/Skewness
%  curr4_sigstats/Std
%  curr5_sigstats/CrestFactor
%  curr5_sigstats/Kurtosis
%  curr5_sigstats/Mean
%  curr5_sigstats/PeakValue
%  curr5_sigstats/RMS
%  curr5_sigstats/Skewness
%  curr5_sigstats/Std
%  curr6_sigstats/CrestFactor
%  curr6_sigstats/Kurtosis
%  curr6_sigstats/Mean
%  curr6_sigstats/PeakValue
%  curr6_sigstats/RMS
%  curr6_sigstats/Skewness
%  curr6_sigstats/Std
%  desRoll_sigstats/CrestFactor
%  desRoll_sigstats/Kurtosis
%  desRoll_sigstats/Mean
%  desRoll_sigstats/PeakValue
%  desRoll_sigstats/RMS
%  desRoll_sigstats/Skewness
%  desRoll_sigstats/Std
%  roll_sigstats/CrestFactor
%  roll_sigstats/Kurtosis
%  roll_sigstats/Mean
%  roll_sigstats/PeakValue
%  roll_sigstats/RMS
%  roll_sigstats/Skewness
%  roll_sigstats/Std
%  desPitch_sigstats/CrestFactor
%  desPitch_sigstats/Kurtosis
%  desPitch_sigstats/Mean
%  desPitch_sigstats/PeakValue
%  desPitch_sigstats/RMS
%  desPitch_sigstats/Skewness
%  desPitch_sigstats/Std
%  pitch_sigstats/CrestFactor
%  pitch_sigstats/Kurtosis
%  pitch_sigstats/Mean
%  pitch_sigstats/PeakValue
%  pitch_sigstats/RMS
%  pitch_sigstats/Skewness
%  pitch_sigstats/Std
%  desYaw_sigstats/CrestFactor
%  desYaw_sigstats/Kurtosis
%  desYaw_sigstats/Mean
%  desYaw_sigstats/PeakValue
%  desYaw_sigstats/RMS
%  desYaw_sigstats/Skewness
%  desYaw_sigstats/Std
%  yaw_sigstats/CrestFactor
%  yaw_sigstats/Kurtosis
%  yaw_sigstats/Mean
%  yaw_sigstats/PeakValue
%  yaw_sigstats/RMS
%  yaw_sigstats/Skewness
%  yaw_sigstats/Std
%  vibeX_sigstats/CrestFactor
%  vibeX_sigstats/Kurtosis
%  vibeX_sigstats/Mean
%  vibeX_sigstats/PeakValue
%  vibeX_sigstats/RMS
%  vibeX_sigstats/Skewness
%  vibeX_sigstats/Std
%  vibeY_sigstats/CrestFactor
%  vibeY_sigstats/Kurtosis
%  vibeY_sigstats/Mean
%  vibeY_sigstats/PeakValue
%  vibeY_sigstats/RMS
%  vibeY_sigstats/Skewness
%  vibeY_sigstats/Std
%  vibeZ_sigstats/CrestFactor
%  vibeZ_sigstats/Kurtosis
%  vibeZ_sigstats/Mean
%  vibeZ_sigstats/PeakValue
%  vibeZ_sigstats/RMS
%  vibeZ_sigstats/Skewness
%  vibeZ_sigstats/Std
%  rate_sigstats/CrestFactor
%  rate_sigstats/Kurtosis
%  rate_sigstats/Mean
%  rate_sigstats/PeakValue
%  rate_sigstats/RMS
%  rate_sigstats/Skewness
%  rate_sigstats/Std
%  rate_sigstats_1/CrestFactor
%  rate_sigstats_1/Kurtosis
%  rate_sigstats_1/Mean
%  rate_sigstats_1/PeakValue
%  rate_sigstats_1/RMS
%  rate_sigstats_1/Skewness
%  rate_sigstats_1/Std
%  rate_sigstats_2/CrestFactor
%  rate_sigstats_2/Kurtosis
%  rate_sigstats_2/Mean
%  rate_sigstats_2/PeakValue
%  rate_sigstats_2/RMS
%  rate_sigstats_2/Skewness
%  rate_sigstats_2/Std
%  rate_sigstats_3/CrestFactor
%  rate_sigstats_3/Kurtosis
%  rate_sigstats_3/Mean
%  rate_sigstats_3/PeakValue
%  rate_sigstats_3/RMS
%  rate_sigstats_3/Skewness
%  rate_sigstats_3/Std
%  rate_sigstats_4/CrestFactor
%  rate_sigstats_4/Kurtosis
%  rate_sigstats_4/Mean
%  rate_sigstats_4/PeakValue
%  rate_sigstats_4/RMS
%  rate_sigstats_4/Skewness
%  rate_sigstats_4/Std
%  rate_sigstats_5/CrestFactor
%  rate_sigstats_5/Kurtosis
%  rate_sigstats_5/Mean
%  rate_sigstats_5/PeakValue
%  rate_sigstats_5/RMS
%  rate_sigstats_5/Skewness
%  rate_sigstats_5/Std
%  rate_sigstats_6/CrestFactor
%  rate_sigstats_6/Kurtosis
%  rate_sigstats_6/Mean
%  rate_sigstats_6/PeakValue
%  rate_sigstats_6/RMS
%  rate_sigstats_6/Skewness
%  rate_sigstats_6/Std
%  rate_sigstats_7/CrestFactor
%  rate_sigstats_7/Kurtosis
%  rate_sigstats_7/Mean
%  rate_sigstats_7/PeakValue
%  rate_sigstats_7/RMS
%  rate_sigstats_7/Skewness
%  rate_sigstats_7/Std
%  rate_sigstats_8/CrestFactor
%  rate_sigstats_8/Kurtosis
%  rate_sigstats_8/Mean
%  rate_sigstats_8/PeakValue
%  rate_sigstats_8/RMS
%  rate_sigstats_8/Skewness
%  rate_sigstats_8/Std
%  rate_sigstats_9/CrestFactor
%  rate_sigstats_9/Kurtosis
%  rate_sigstats_9/Mean
%  rate_sigstats_9/PeakValue
%  rate_sigstats_9/RMS
%  rate_sigstats_9/Skewness
%  rate_sigstats_9/Std
%  rate_sigstats_10/CrestFactor
%  rate_sigstats_10/Kurtosis
%  rate_sigstats_10/Mean
%  rate_sigstats_10/PeakValue
%  rate_sigstats_10/RMS
%  rate_sigstats_10/Skewness
%  rate_sigstats_10/Std
%  rate_sigstats_11/CrestFactor
%  rate_sigstats_11/Kurtosis
%  rate_sigstats_11/Mean
%  rate_sigstats_11/PeakValue
%  rate_sigstats_11/RMS
%  rate_sigstats_11/Skewness
%  rate_sigstats_11/Std
%  accX_ps_spec/PeakFreq1
%  accX_ps_spec/BandPower
%  accY_ps_spec/PeakFreq1
%  accY_ps_spec/BandPower
%  accZ_ps_spec/PeakFreq1
%  accZ_ps_spec/BandPower
%  gyrX_ps_spec/PeakFreq1
%  gyrX_ps_spec/BandPower
%  gyrY_ps_spec/PeakFreq1
%  gyrY_ps_spec/BandPower
%  gyrZ_ps_spec/PeakFreq1
%  gyrZ_ps_spec/BandPower
%  pwm1_ps_spec/PeakFreq1
%  pwm1_ps_spec/BandPower
%  pwm2_ps_spec/PeakFreq1
%  pwm2_ps_spec/BandPower
%  pwm3_ps_spec/PeakFreq1
%  pwm3_ps_spec/BandPower
%  pwm4_ps_spec/PeakFreq1
%  pwm4_ps_spec/BandPower
%  pwm5_ps_spec/PeakFreq1
%  pwm5_ps_spec/BandPower
%  pwm6_ps_spec/PeakFreq1
%  pwm6_ps_spec/BandPower
%  esc1_ps_spec/PeakFreq1
%  esc1_ps_spec/BandPower
%  esc2_ps_spec/PeakFreq1
%  esc2_ps_spec/BandPower
%  esc3_ps_spec/PeakFreq1
%  esc3_ps_spec/BandPower
%  esc4_ps_spec/PeakFreq1
%  esc4_ps_spec/BandPower
%  esc5_ps_spec/PeakFreq1
%  esc5_ps_spec/BandPower
%  esc6_ps_spec/PeakFreq1
%  esc6_ps_spec/BandPower
%  curr1_ps_spec/PeakFreq1
%  curr1_ps_spec/BandPower
%  curr2_ps_spec/PeakFreq1
%  curr2_ps_spec/BandPower
%  curr3_ps_spec/PeakFreq1
%  curr3_ps_spec/BandPower
%  curr4_ps_spec/PeakFreq1
%  curr4_ps_spec/BandPower
%  curr5_ps_spec/PeakFreq1
%  curr5_ps_spec/BandPower
%  curr6_ps_spec/PeakFreq1
%  curr6_ps_spec/BandPower
%  desRoll_ps_spec/PeakFreq1
%  desRoll_ps_spec/BandPower
%  roll_ps_spec/PeakFreq1
%  roll_ps_spec/BandPower
%  desPitch_ps_spec/PeakFreq1
%  desPitch_ps_spec/BandPower
%  pitch_ps_spec/PeakFreq1
%  pitch_ps_spec/BandPower
%  desYaw_ps_spec/PeakFreq1
%  desYaw_ps_spec/BandPower
%  yaw_ps_spec/PeakFreq1
%  yaw_ps_spec/BandPower
%  vibeX_ps_spec/PeakFreq1
%  vibeX_ps_spec/BandPower
%  vibeY_ps_spec/PeakFreq1
%  vibeY_ps_spec/BandPower
%  vibeZ_ps_spec/PeakFreq1
%  vibeZ_ps_spec/BandPower
%  rate_ps_spec/PeakFreq1
%  rate_ps_spec/BandPower
%  rate_ps_1_spec/PeakFreq1
%  rate_ps_1_spec/BandPower
%  rate_ps_2_spec/PeakFreq1
%  rate_ps_2_spec/BandPower
%  rate_ps_3_spec/PeakFreq1
%  rate_ps_3_spec/BandPower
%  rate_ps_4_spec/PeakFreq1
%  rate_ps_4_spec/BandPower
%  rate_ps_5_spec/PeakFreq1
%  rate_ps_5_spec/BandPower
%  rate_ps_6_spec/PeakFreq1
%  rate_ps_6_spec/BandPower
%  rate_ps_7_spec/PeakFreq1
%  rate_ps_7_spec/BandPower
%  rate_ps_8_spec/PeakFreq1
%  rate_ps_8_spec/BandPower
%  rate_ps_9_spec/PeakFreq1
%  rate_ps_9_spec/BandPower
%  rate_ps_10_spec/PeakFreq1
%  rate_ps_10_spec/BandPower
%  rate_ps_11_spec/PeakFreq1
%  rate_ps_11_spec/BandPower
%
% Frame Policy:
%  Frame name: FRM_1
%  Frame size: 1 seconds
%  Frame rate: 1 seconds
%
% Organization of the function:
% 1. Compute signals/spectra/features
% 2. Extract computed features into a table
%
% Modify the function to add or remove data processing, feature generation
% or ranking operations.

% Auto-generated by MATLAB on 19-Feb-2025 16:56:04

% Create output ensemble.
outputEnsemble = workspaceEnsemble(inputData,'DataVariables',["accX";"accY";"accZ";"gyrX";"gyrY";"gyrZ";"pwm1";"pwm2";"pwm3";"pwm4";"pwm5";"pwm6";"esc1";"esc2";"esc3";"esc4";"esc5";"esc6";"curr1";"curr2";"curr3";"curr4";"curr5";"curr6";"desRoll";"roll";"desPitch";"pitch";"desYaw";"yaw";"vibeX";"vibeY";"vibeZ";"rate"],'ConditionVariables',"faultCode");

% Reset the ensemble to read from the beginning of the ensemble.
reset(outputEnsemble);

% Append new frame policy name to DataVariables.
outputEnsemble.DataVariables = [outputEnsemble.DataVariables;"FRM_1"];

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = ["accX","accY","accZ","gyrX","gyrY","gyrZ","pwm1","pwm2","pwm3","pwm4","pwm5","pwm6","esc1","esc2","esc3","esc4","esc5","esc6","curr1","curr2","curr3","curr4","curr5","curr6","desRoll","roll","desPitch","pitch","desYaw","yaw","vibeX","vibeY","vibeZ","rate"];

% Initialize a cell array to store all the results.
allMembersResult = {};

% Loop through all ensemble members to read and write data.
while hasdata(outputEnsemble)
    % Read one member.
    member = read(outputEnsemble);

    % Read signals.
    accX_full = readMemberData(member,"accX",["Time","Var1"]);
    accY_full = readMemberData(member,"accY",["Time","Var1"]);
    accZ_full = readMemberData(member,"accZ",["Time","Var1"]);
    gyrX_full = readMemberData(member,"gyrX",["Time","Var1"]);
    gyrY_full = readMemberData(member,"gyrY",["Time","Var1"]);
    gyrZ_full = readMemberData(member,"gyrZ",["Time","Var1"]);
    pwm1_full = readMemberData(member,"pwm1",["Time","Var1"]);
    pwm2_full = readMemberData(member,"pwm2",["Time","Var1"]);
    pwm3_full = readMemberData(member,"pwm3",["Time","Var1"]);
    pwm4_full = readMemberData(member,"pwm4",["Time","Var1"]);
    pwm5_full = readMemberData(member,"pwm5",["Time","Var1"]);
    pwm6_full = readMemberData(member,"pwm6",["Time","Var1"]);
    esc1_full = readMemberData(member,"esc1",["Time","Var1"]);
    esc2_full = readMemberData(member,"esc2",["Time","Var1"]);
    esc3_full = readMemberData(member,"esc3",["Time","Var1"]);
    esc4_full = readMemberData(member,"esc4",["Time","Var1"]);
    esc5_full = readMemberData(member,"esc5",["Time","Var1"]);
    esc6_full = readMemberData(member,"esc6",["Time","Var1"]);
    curr1_full = readMemberData(member,"curr1",["Time","Var1"]);
    curr2_full = readMemberData(member,"curr2",["Time","Var1"]);
    curr3_full = readMemberData(member,"curr3",["Time","Var1"]);
    curr4_full = readMemberData(member,"curr4",["Time","Var1"]);
    curr5_full = readMemberData(member,"curr5",["Time","Var1"]);
    curr6_full = readMemberData(member,"curr6",["Time","Var1"]);
    desRoll_full = readMemberData(member,"desRoll",["Time","Var1"]);
    roll_full = readMemberData(member,"roll",["Time","Var1"]);
    desPitch_full = readMemberData(member,"desPitch",["Time","Var1"]);
    pitch_full = readMemberData(member,"pitch",["Time","Var1"]);
    desYaw_full = readMemberData(member,"desYaw",["Time","Var1"]);
    yaw_full = readMemberData(member,"yaw",["Time","Var1"]);
    vibeX_full = readMemberData(member,"vibeX",["Time","Var1"]);
    vibeY_full = readMemberData(member,"vibeY",["Time","Var1"]);
    vibeZ_full = readMemberData(member,"vibeZ",["Time","Var1"]);
    rate_full = readMemberData(member,"rate",["Time","Var1","Var2","Var3","Var4","Var5","Var6","Var7","Var8","Var9","Var10","Var11","Var12"]);

    % Get the frame intervals.
    lowerBound = min([accX_full.Time(1),accY_full.Time(1),accZ_full.Time(1),gyrX_full.Time(1),gyrY_full.Time(1),gyrZ_full.Time(1),pwm1_full.Time(1),pwm2_full.Time(1),pwm3_full.Time(1),pwm4_full.Time(1),pwm5_full.Time(1),pwm6_full.Time(1),esc1_full.Time(1),esc2_full.Time(1),esc3_full.Time(1),esc4_full.Time(1),esc5_full.Time(1),esc6_full.Time(1),curr1_full.Time(1),curr2_full.Time(1),curr3_full.Time(1),curr4_full.Time(1),curr5_full.Time(1),curr6_full.Time(1),desRoll_full.Time(1),roll_full.Time(1),desPitch_full.Time(1),pitch_full.Time(1),desYaw_full.Time(1),yaw_full.Time(1),vibeX_full.Time(1),vibeY_full.Time(1),vibeZ_full.Time(1),rate_full.Time(1)]);
    upperBound = max([accX_full.Time(end),accY_full.Time(end),accZ_full.Time(end),gyrX_full.Time(end),gyrY_full.Time(end),gyrZ_full.Time(end),pwm1_full.Time(end),pwm2_full.Time(end),pwm3_full.Time(end),pwm4_full.Time(end),pwm5_full.Time(end),pwm6_full.Time(end),esc1_full.Time(end),esc2_full.Time(end),esc3_full.Time(end),esc4_full.Time(end),esc5_full.Time(end),esc6_full.Time(end),curr1_full.Time(end),curr2_full.Time(end),curr3_full.Time(end),curr4_full.Time(end),curr5_full.Time(end),curr6_full.Time(end),desRoll_full.Time(end),roll_full.Time(end),desPitch_full.Time(end),pitch_full.Time(end),desYaw_full.Time(end),yaw_full.Time(end),vibeX_full.Time(end),vibeY_full.Time(end),vibeZ_full.Time(end),rate_full.Time(end)]);
    fullIntervals = frameintervals([lowerBound upperBound],1,1,'FrameUnit',"seconds");
    intervals = fullIntervals;

    % Initialize a table to store frame results.
    frames = table;

    % Loop through all frame intervals and compute results.
    for ct = 1:height(intervals)
        % Get all input variables.
        accX = accX_full(accX_full.Time>=intervals{ct,1}&accX_full.Time<intervals{ct,2},:);
        accY = accY_full(accY_full.Time>=intervals{ct,1}&accY_full.Time<intervals{ct,2},:);
        accZ = accZ_full(accZ_full.Time>=intervals{ct,1}&accZ_full.Time<intervals{ct,2},:);
        gyrX = gyrX_full(gyrX_full.Time>=intervals{ct,1}&gyrX_full.Time<intervals{ct,2},:);
        gyrY = gyrY_full(gyrY_full.Time>=intervals{ct,1}&gyrY_full.Time<intervals{ct,2},:);
        gyrZ = gyrZ_full(gyrZ_full.Time>=intervals{ct,1}&gyrZ_full.Time<intervals{ct,2},:);
        pwm1 = pwm1_full(pwm1_full.Time>=intervals{ct,1}&pwm1_full.Time<intervals{ct,2},:);
        pwm2 = pwm2_full(pwm2_full.Time>=intervals{ct,1}&pwm2_full.Time<intervals{ct,2},:);
        pwm3 = pwm3_full(pwm3_full.Time>=intervals{ct,1}&pwm3_full.Time<intervals{ct,2},:);
        pwm4 = pwm4_full(pwm4_full.Time>=intervals{ct,1}&pwm4_full.Time<intervals{ct,2},:);
        pwm5 = pwm5_full(pwm5_full.Time>=intervals{ct,1}&pwm5_full.Time<intervals{ct,2},:);
        pwm6 = pwm6_full(pwm6_full.Time>=intervals{ct,1}&pwm6_full.Time<intervals{ct,2},:);
        esc1 = esc1_full(esc1_full.Time>=intervals{ct,1}&esc1_full.Time<intervals{ct,2},:);
        esc2 = esc2_full(esc2_full.Time>=intervals{ct,1}&esc2_full.Time<intervals{ct,2},:);
        esc3 = esc3_full(esc3_full.Time>=intervals{ct,1}&esc3_full.Time<intervals{ct,2},:);
        esc4 = esc4_full(esc4_full.Time>=intervals{ct,1}&esc4_full.Time<intervals{ct,2},:);
        esc5 = esc5_full(esc5_full.Time>=intervals{ct,1}&esc5_full.Time<intervals{ct,2},:);
        esc6 = esc6_full(esc6_full.Time>=intervals{ct,1}&esc6_full.Time<intervals{ct,2},:);
        curr1 = curr1_full(curr1_full.Time>=intervals{ct,1}&curr1_full.Time<intervals{ct,2},:);
        curr2 = curr2_full(curr2_full.Time>=intervals{ct,1}&curr2_full.Time<intervals{ct,2},:);
        curr3 = curr3_full(curr3_full.Time>=intervals{ct,1}&curr3_full.Time<intervals{ct,2},:);
        curr4 = curr4_full(curr4_full.Time>=intervals{ct,1}&curr4_full.Time<intervals{ct,2},:);
        curr5 = curr5_full(curr5_full.Time>=intervals{ct,1}&curr5_full.Time<intervals{ct,2},:);
        curr6 = curr6_full(curr6_full.Time>=intervals{ct,1}&curr6_full.Time<intervals{ct,2},:);
        desRoll = desRoll_full(desRoll_full.Time>=intervals{ct,1}&desRoll_full.Time<intervals{ct,2},:);
        roll = roll_full(roll_full.Time>=intervals{ct,1}&roll_full.Time<intervals{ct,2},:);
        desPitch = desPitch_full(desPitch_full.Time>=intervals{ct,1}&desPitch_full.Time<intervals{ct,2},:);
        pitch = pitch_full(pitch_full.Time>=intervals{ct,1}&pitch_full.Time<intervals{ct,2},:);
        desYaw = desYaw_full(desYaw_full.Time>=intervals{ct,1}&desYaw_full.Time<intervals{ct,2},:);
        yaw = yaw_full(yaw_full.Time>=intervals{ct,1}&yaw_full.Time<intervals{ct,2},:);
        vibeX = vibeX_full(vibeX_full.Time>=intervals{ct,1}&vibeX_full.Time<intervals{ct,2},:);
        vibeY = vibeY_full(vibeY_full.Time>=intervals{ct,1}&vibeY_full.Time<intervals{ct,2},:);
        vibeZ = vibeZ_full(vibeZ_full.Time>=intervals{ct,1}&vibeZ_full.Time<intervals{ct,2},:);
        rate = rate_full(rate_full.Time>=intervals{ct,1}&rate_full.Time<intervals{ct,2},:);

        % Initialize a table to store results for one frame interval.
        frame = intervals(ct,:);

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(accX.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = accX.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            accX_ps = ps;
        catch
            accX_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accX_ps},'VariableNames',{'accX_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(accY.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = accY.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            accY_ps = ps;
        catch
            accY_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accY_ps},'VariableNames',{'accY_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(accZ.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = accZ.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            accZ_ps = ps;
        catch
            accZ_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accZ_ps},'VariableNames',{'accZ_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyrX.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyrX.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyrX_ps = ps;
        catch
            gyrX_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrX_ps},'VariableNames',{'gyrX_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyrY.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyrY.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyrY_ps = ps;
        catch
            gyrY_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrY_ps},'VariableNames',{'gyrY_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyrZ.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyrZ.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyrZ_ps = ps;
        catch
            gyrZ_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrZ_ps},'VariableNames',{'gyrZ_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm1.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm1.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm1_ps = ps;
        catch
            pwm1_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm1_ps},'VariableNames',{'pwm1_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm2.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm2.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm2_ps = ps;
        catch
            pwm2_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm2_ps},'VariableNames',{'pwm2_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm3.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm3.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm3_ps = ps;
        catch
            pwm3_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm3_ps},'VariableNames',{'pwm3_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm4.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm4.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm4_ps = ps;
        catch
            pwm4_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm4_ps},'VariableNames',{'pwm4_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm5.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm5.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm5_ps = ps;
        catch
            pwm5_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm5_ps},'VariableNames',{'pwm5_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm6.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm6.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm6_ps = ps;
        catch
            pwm6_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm6_ps},'VariableNames',{'pwm6_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc1.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc1.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc1_ps = ps;
        catch
            esc1_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc1_ps},'VariableNames',{'esc1_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc2.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc2.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc2_ps = ps;
        catch
            esc2_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc2_ps},'VariableNames',{'esc2_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc3.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc3.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc3_ps = ps;
        catch
            esc3_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc3_ps},'VariableNames',{'esc3_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc4.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc4.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc4_ps = ps;
        catch
            esc4_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc4_ps},'VariableNames',{'esc4_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc5.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc5.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc5_ps = ps;
        catch
            esc5_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc5_ps},'VariableNames',{'esc5_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(esc6.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = esc6.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            esc6_ps = ps;
        catch
            esc6_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc6_ps},'VariableNames',{'esc6_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr1.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr1.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr1_ps = ps;
        catch
            curr1_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr1_ps},'VariableNames',{'curr1_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr2.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr2.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr2_ps = ps;
        catch
            curr2_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr2_ps},'VariableNames',{'curr2_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr3.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr3.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr3_ps = ps;
        catch
            curr3_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr3_ps},'VariableNames',{'curr3_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr4.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr4.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr4_ps = ps;
        catch
            curr4_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr4_ps},'VariableNames',{'curr4_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr5.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr5.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr5_ps = ps;
        catch
            curr5_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr5_ps},'VariableNames',{'curr5_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(curr6.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = curr6.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            curr6_ps = ps;
        catch
            curr6_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr6_ps},'VariableNames',{'curr6_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(desRoll.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = desRoll.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            desRoll_ps = ps;
        catch
            desRoll_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desRoll_ps},'VariableNames',{'desRoll_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(roll.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = roll.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            roll_ps = ps;
        catch
            roll_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_ps},'VariableNames',{'roll_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(desPitch.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = desPitch.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            desPitch_ps = ps;
        catch
            desPitch_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desPitch_ps},'VariableNames',{'desPitch_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pitch.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pitch.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pitch_ps = ps;
        catch
            pitch_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_ps},'VariableNames',{'pitch_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(desYaw.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = desYaw.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            desYaw_ps = ps;
        catch
            desYaw_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desYaw_ps},'VariableNames',{'desYaw_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(yaw.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = yaw.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            yaw_ps = ps;
        catch
            yaw_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_ps},'VariableNames',{'yaw_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibeX.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibeX.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibeX_ps = ps;
        catch
            vibeX_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeX_ps},'VariableNames',{'vibeX_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibeY.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibeY.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibeY_ps = ps;
        catch
            vibeY_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeY_ps},'VariableNames',{'vibeY_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibeZ.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibeZ.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibeZ_ps = ps;
        catch
            vibeZ_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeZ_ps},'VariableNames',{'vibeZ_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps = ps;
        catch
            rate_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps},'VariableNames',{'rate_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var2;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_1 = ps;
        catch
            rate_ps_1 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_1},'VariableNames',{'rate_ps_1'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var3;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_2 = ps;
        catch
            rate_ps_2 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_2},'VariableNames',{'rate_ps_2'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var4;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_3 = ps;
        catch
            rate_ps_3 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_3},'VariableNames',{'rate_ps_3'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var5;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_4 = ps;
        catch
            rate_ps_4 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_4},'VariableNames',{'rate_ps_4'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var6;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_5 = ps;
        catch
            rate_ps_5 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_5},'VariableNames',{'rate_ps_5'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var7;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_6 = ps;
        catch
            rate_ps_6 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_6},'VariableNames',{'rate_ps_6'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var8;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_7 = ps;
        catch
            rate_ps_7 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_7},'VariableNames',{'rate_ps_7'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var9;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_8 = ps;
        catch
            rate_ps_8 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_8},'VariableNames',{'rate_ps_8'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var10;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_9 = ps;
        catch
            rate_ps_9 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_9},'VariableNames',{'rate_ps_9'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var11;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_10 = ps;
        catch
            rate_ps_10 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_10},'VariableNames',{'rate_ps_10'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(rate.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = rate.Var12;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            rate_ps_11 = ps;
        catch
            rate_ps_11 = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_11},'VariableNames',{'rate_ps_11'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = accX.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accX_sigstats},'VariableNames',{'accX_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = accY.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accY_sigstats},'VariableNames',{'accY_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = accZ.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            accZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accZ_sigstats},'VariableNames',{'accZ_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyrX.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrX_sigstats},'VariableNames',{'gyrX_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyrY.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrY_sigstats},'VariableNames',{'gyrY_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyrZ.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            gyrZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrZ_sigstats},'VariableNames',{'gyrZ_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm1.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm1_sigstats},'VariableNames',{'pwm1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm2.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm2_sigstats},'VariableNames',{'pwm2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm3.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm3_sigstats},'VariableNames',{'pwm3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm4.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm4_sigstats},'VariableNames',{'pwm4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm5.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm5_sigstats},'VariableNames',{'pwm5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm6.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pwm6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm6_sigstats},'VariableNames',{'pwm6_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc1.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc1_sigstats},'VariableNames',{'esc1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc2.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc2_sigstats},'VariableNames',{'esc2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc3.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc3_sigstats},'VariableNames',{'esc3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc4.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc4_sigstats},'VariableNames',{'esc4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc5.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc5_sigstats},'VariableNames',{'esc5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = esc6.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            esc6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc6_sigstats},'VariableNames',{'esc6_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr1.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr1_sigstats},'VariableNames',{'curr1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr2.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr2_sigstats},'VariableNames',{'curr2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr3.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr3_sigstats},'VariableNames',{'curr3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr4.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr4_sigstats},'VariableNames',{'curr4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr5.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr5_sigstats},'VariableNames',{'curr5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = curr6.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            curr6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr6_sigstats},'VariableNames',{'curr6_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = desRoll.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desRoll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desRoll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desRoll_sigstats},'VariableNames',{'desRoll_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = roll.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            roll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            roll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_sigstats},'VariableNames',{'roll_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = desPitch.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desPitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desPitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desPitch_sigstats},'VariableNames',{'desPitch_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pitch.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            pitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_sigstats},'VariableNames',{'pitch_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = desYaw.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desYaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            desYaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desYaw_sigstats},'VariableNames',{'desYaw_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = yaw.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            yaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            yaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_sigstats},'VariableNames',{'yaw_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibeX.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeX_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeX_sigstats},'VariableNames',{'vibeX_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibeY.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeY_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeY_sigstats},'VariableNames',{'vibeY_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibeZ.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            vibeZ_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeZ_sigstats},'VariableNames',{'vibeZ_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var1;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats},'VariableNames',{'rate_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var2;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_1 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_1 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_1},'VariableNames',{'rate_sigstats_1'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var3;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_2 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_2 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_2},'VariableNames',{'rate_sigstats_2'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var4;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_3 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_3 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_3},'VariableNames',{'rate_sigstats_3'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var5;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_4 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_4 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_4},'VariableNames',{'rate_sigstats_4'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var6;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_5 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_5 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_5},'VariableNames',{'rate_sigstats_5'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var7;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_6 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_6 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_6},'VariableNames',{'rate_sigstats_6'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var8;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_7 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_7 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_7},'VariableNames',{'rate_sigstats_7'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var9;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_8 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_8 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_8},'VariableNames',{'rate_sigstats_8'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var10;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_9 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_9 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_9},'VariableNames',{'rate_sigstats_9'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var11;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_10 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_10 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_10},'VariableNames',{'rate_sigstats_10'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = rate.Var12;
            CrestFactor = peak2rms(inputSignal);
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [CrestFactor,Kurtosis,Mean,PeakValue,RMS,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_11 = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,7);
            featureNames = {'CrestFactor','Kurtosis','Mean','PeakValue','RMS','Skewness','Std'};
            rate_sigstats_11 = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_sigstats_11},'VariableNames',{'rate_sigstats_11'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = accX_ps.SpectrumData;
            w = accX_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            accX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            accX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accX_ps_spec},'VariableNames',{'accX_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = accY_ps.SpectrumData;
            w = accY_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            accY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            accY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accY_ps_spec},'VariableNames',{'accY_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = accZ_ps.SpectrumData;
            w = accZ_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            accZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            accZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({accZ_ps_spec},'VariableNames',{'accZ_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyrX_ps.SpectrumData;
            w = gyrX_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            gyrX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            gyrX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrX_ps_spec},'VariableNames',{'gyrX_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyrY_ps.SpectrumData;
            w = gyrY_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            gyrY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            gyrY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrY_ps_spec},'VariableNames',{'gyrY_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyrZ_ps.SpectrumData;
            w = gyrZ_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            gyrZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            gyrZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyrZ_ps_spec},'VariableNames',{'gyrZ_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm1_ps.SpectrumData;
            w = pwm1_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm1_ps_spec},'VariableNames',{'pwm1_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm2_ps.SpectrumData;
            w = pwm2_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm2_ps_spec},'VariableNames',{'pwm2_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm3_ps.SpectrumData;
            w = pwm3_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm3_ps_spec},'VariableNames',{'pwm3_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm4_ps.SpectrumData;
            w = pwm4_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm4_ps_spec},'VariableNames',{'pwm4_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm5_ps.SpectrumData;
            w = pwm5_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm5_ps_spec},'VariableNames',{'pwm5_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm6_ps.SpectrumData;
            w = pwm6_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pwm6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pwm6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm6_ps_spec},'VariableNames',{'pwm6_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc1_ps.SpectrumData;
            w = esc1_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc1_ps_spec},'VariableNames',{'esc1_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc2_ps.SpectrumData;
            w = esc2_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc2_ps_spec},'VariableNames',{'esc2_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc3_ps.SpectrumData;
            w = esc3_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc3_ps_spec},'VariableNames',{'esc3_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc4_ps.SpectrumData;
            w = esc4_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc4_ps_spec},'VariableNames',{'esc4_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc5_ps.SpectrumData;
            w = esc5_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc5_ps_spec},'VariableNames',{'esc5_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = esc6_ps.SpectrumData;
            w = esc6_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            esc6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            esc6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({esc6_ps_spec},'VariableNames',{'esc6_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr1_ps.SpectrumData;
            w = curr1_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr1_ps_spec},'VariableNames',{'curr1_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr2_ps.SpectrumData;
            w = curr2_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr2_ps_spec},'VariableNames',{'curr2_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr3_ps.SpectrumData;
            w = curr3_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr3_ps_spec},'VariableNames',{'curr3_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr4_ps.SpectrumData;
            w = curr4_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr4_ps_spec},'VariableNames',{'curr4_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr5_ps.SpectrumData;
            w = curr5_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr5_ps_spec},'VariableNames',{'curr5_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = curr6_ps.SpectrumData;
            w = curr6_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            curr6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            curr6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({curr6_ps_spec},'VariableNames',{'curr6_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = desRoll_ps.SpectrumData;
            w = desRoll_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            desRoll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            desRoll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desRoll_ps_spec},'VariableNames',{'desRoll_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = roll_ps.SpectrumData;
            w = roll_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            roll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            roll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_ps_spec},'VariableNames',{'roll_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = desPitch_ps.SpectrumData;
            w = desPitch_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            desPitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            desPitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desPitch_ps_spec},'VariableNames',{'desPitch_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pitch_ps.SpectrumData;
            w = pitch_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            pitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            pitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_ps_spec},'VariableNames',{'pitch_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = desYaw_ps.SpectrumData;
            w = desYaw_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            desYaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            desYaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({desYaw_ps_spec},'VariableNames',{'desYaw_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = yaw_ps.SpectrumData;
            w = yaw_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            yaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            yaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_ps_spec},'VariableNames',{'yaw_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibeX_ps.SpectrumData;
            w = vibeX_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            vibeX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            vibeX_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeX_ps_spec},'VariableNames',{'vibeX_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibeY_ps.SpectrumData;
            w = vibeY_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            vibeY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            vibeY_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeY_ps_spec},'VariableNames',{'vibeY_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibeZ_ps.SpectrumData;
            w = vibeZ_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            vibeZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            vibeZ_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibeZ_ps_spec},'VariableNames',{'vibeZ_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps.SpectrumData;
            w = rate_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_spec},'VariableNames',{'rate_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_1.SpectrumData;
            w = rate_ps_1.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_1_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_1_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_1_spec},'VariableNames',{'rate_ps_1_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_2.SpectrumData;
            w = rate_ps_2.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_2_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_2_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_2_spec},'VariableNames',{'rate_ps_2_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_3.SpectrumData;
            w = rate_ps_3.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_3_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_3_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_3_spec},'VariableNames',{'rate_ps_3_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_4.SpectrumData;
            w = rate_ps_4.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_4_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_4_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_4_spec},'VariableNames',{'rate_ps_4_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_5.SpectrumData;
            w = rate_ps_5.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_5_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_5_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_5_spec},'VariableNames',{'rate_ps_5_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_6.SpectrumData;
            w = rate_ps_6.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_6_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_6_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_6_spec},'VariableNames',{'rate_ps_6_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_7.SpectrumData;
            w = rate_ps_7.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_7_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_7_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_7_spec},'VariableNames',{'rate_ps_7_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_8.SpectrumData;
            w = rate_ps_8.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_8_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_8_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_8_spec},'VariableNames',{'rate_ps_8_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_9.SpectrumData;
            w = rate_ps_9.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_9_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_9_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_9_spec},'VariableNames',{'rate_ps_9_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_10.SpectrumData;
            w = rate_ps_10.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_10_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_10_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_10_spec},'VariableNames',{'rate_ps_10_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = rate_ps_11.SpectrumData;
            w = rate_ps_11.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.1) & (w<=factor*175.000000000004);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_11_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,2);
            featureNames = {'PeakFreq1','BandPower'};
            rate_ps_11_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({rate_ps_11_spec},'VariableNames',{'rate_ps_11_spec'})];

        %% Concatenate frames.
        frames = [frames;frame]; %#ok<*AGROW>
    end
    % Append all member results to the cell array.
    memberResult = table({frames},'VariableNames',"FRM_1");
    allMembersResult = [allMembersResult; {memberResult}]; %#ok<AGROW>
end

% Write the results for all members to the ensemble.
writeToMembers(outputEnsemble,allMembersResult)

% Gather all features into a table.
selectedFeatureNames = ["FRM_1/accX_sigstats/CrestFactor","FRM_1/accX_sigstats/Kurtosis","FRM_1/accX_sigstats/Mean","FRM_1/accX_sigstats/PeakValue","FRM_1/accX_sigstats/RMS","FRM_1/accX_sigstats/Skewness","FRM_1/accX_sigstats/Std","FRM_1/accY_sigstats/CrestFactor","FRM_1/accY_sigstats/Kurtosis","FRM_1/accY_sigstats/Mean","FRM_1/accY_sigstats/PeakValue","FRM_1/accY_sigstats/RMS","FRM_1/accY_sigstats/Skewness","FRM_1/accY_sigstats/Std","FRM_1/accZ_sigstats/CrestFactor","FRM_1/accZ_sigstats/Kurtosis","FRM_1/accZ_sigstats/Mean","FRM_1/accZ_sigstats/PeakValue","FRM_1/accZ_sigstats/RMS","FRM_1/accZ_sigstats/Skewness","FRM_1/accZ_sigstats/Std","FRM_1/gyrX_sigstats/CrestFactor","FRM_1/gyrX_sigstats/Kurtosis","FRM_1/gyrX_sigstats/Mean","FRM_1/gyrX_sigstats/PeakValue","FRM_1/gyrX_sigstats/RMS","FRM_1/gyrX_sigstats/Skewness","FRM_1/gyrX_sigstats/Std","FRM_1/gyrY_sigstats/CrestFactor","FRM_1/gyrY_sigstats/Kurtosis","FRM_1/gyrY_sigstats/Mean","FRM_1/gyrY_sigstats/PeakValue","FRM_1/gyrY_sigstats/RMS","FRM_1/gyrY_sigstats/Skewness","FRM_1/gyrY_sigstats/Std","FRM_1/gyrZ_sigstats/CrestFactor","FRM_1/gyrZ_sigstats/Kurtosis","FRM_1/gyrZ_sigstats/Mean","FRM_1/gyrZ_sigstats/PeakValue","FRM_1/gyrZ_sigstats/RMS","FRM_1/gyrZ_sigstats/Skewness","FRM_1/gyrZ_sigstats/Std","FRM_1/pwm1_sigstats/CrestFactor","FRM_1/pwm1_sigstats/Kurtosis","FRM_1/pwm1_sigstats/Mean","FRM_1/pwm1_sigstats/PeakValue","FRM_1/pwm1_sigstats/RMS","FRM_1/pwm1_sigstats/Skewness","FRM_1/pwm1_sigstats/Std","FRM_1/pwm2_sigstats/CrestFactor","FRM_1/pwm2_sigstats/Kurtosis","FRM_1/pwm2_sigstats/Mean","FRM_1/pwm2_sigstats/PeakValue","FRM_1/pwm2_sigstats/RMS","FRM_1/pwm2_sigstats/Skewness","FRM_1/pwm2_sigstats/Std","FRM_1/pwm3_sigstats/CrestFactor","FRM_1/pwm3_sigstats/Kurtosis","FRM_1/pwm3_sigstats/Mean","FRM_1/pwm3_sigstats/PeakValue","FRM_1/pwm3_sigstats/RMS","FRM_1/pwm3_sigstats/Skewness","FRM_1/pwm3_sigstats/Std","FRM_1/pwm4_sigstats/CrestFactor","FRM_1/pwm4_sigstats/Kurtosis","FRM_1/pwm4_sigstats/Mean","FRM_1/pwm4_sigstats/PeakValue","FRM_1/pwm4_sigstats/RMS","FRM_1/pwm4_sigstats/Skewness","FRM_1/pwm4_sigstats/Std","FRM_1/pwm5_sigstats/CrestFactor","FRM_1/pwm5_sigstats/Kurtosis","FRM_1/pwm5_sigstats/Mean","FRM_1/pwm5_sigstats/PeakValue","FRM_1/pwm5_sigstats/RMS","FRM_1/pwm5_sigstats/Skewness","FRM_1/pwm5_sigstats/Std","FRM_1/pwm6_sigstats/CrestFactor","FRM_1/pwm6_sigstats/Kurtosis","FRM_1/pwm6_sigstats/Mean","FRM_1/pwm6_sigstats/PeakValue","FRM_1/pwm6_sigstats/RMS","FRM_1/pwm6_sigstats/Skewness","FRM_1/pwm6_sigstats/Std","FRM_1/esc1_sigstats/CrestFactor","FRM_1/esc1_sigstats/Kurtosis","FRM_1/esc1_sigstats/Mean","FRM_1/esc1_sigstats/PeakValue","FRM_1/esc1_sigstats/RMS","FRM_1/esc1_sigstats/Skewness","FRM_1/esc1_sigstats/Std","FRM_1/esc2_sigstats/CrestFactor","FRM_1/esc2_sigstats/Kurtosis","FRM_1/esc2_sigstats/Mean","FRM_1/esc2_sigstats/PeakValue","FRM_1/esc2_sigstats/RMS","FRM_1/esc2_sigstats/Skewness","FRM_1/esc2_sigstats/Std","FRM_1/esc3_sigstats/CrestFactor","FRM_1/esc3_sigstats/Kurtosis","FRM_1/esc3_sigstats/Mean","FRM_1/esc3_sigstats/PeakValue","FRM_1/esc3_sigstats/RMS","FRM_1/esc3_sigstats/Skewness","FRM_1/esc3_sigstats/Std","FRM_1/esc4_sigstats/CrestFactor","FRM_1/esc4_sigstats/Kurtosis","FRM_1/esc4_sigstats/Mean","FRM_1/esc4_sigstats/PeakValue","FRM_1/esc4_sigstats/RMS","FRM_1/esc4_sigstats/Skewness","FRM_1/esc4_sigstats/Std","FRM_1/esc5_sigstats/CrestFactor","FRM_1/esc5_sigstats/Kurtosis","FRM_1/esc5_sigstats/Mean","FRM_1/esc5_sigstats/PeakValue","FRM_1/esc5_sigstats/RMS","FRM_1/esc5_sigstats/Skewness","FRM_1/esc5_sigstats/Std","FRM_1/esc6_sigstats/CrestFactor","FRM_1/esc6_sigstats/Kurtosis","FRM_1/esc6_sigstats/Mean","FRM_1/esc6_sigstats/PeakValue","FRM_1/esc6_sigstats/RMS","FRM_1/esc6_sigstats/Skewness","FRM_1/esc6_sigstats/Std","FRM_1/curr1_sigstats/CrestFactor","FRM_1/curr1_sigstats/Kurtosis","FRM_1/curr1_sigstats/Mean","FRM_1/curr1_sigstats/PeakValue","FRM_1/curr1_sigstats/RMS","FRM_1/curr1_sigstats/Skewness","FRM_1/curr1_sigstats/Std","FRM_1/curr2_sigstats/CrestFactor","FRM_1/curr2_sigstats/Kurtosis","FRM_1/curr2_sigstats/Mean","FRM_1/curr2_sigstats/PeakValue","FRM_1/curr2_sigstats/RMS","FRM_1/curr2_sigstats/Skewness","FRM_1/curr2_sigstats/Std","FRM_1/curr3_sigstats/CrestFactor","FRM_1/curr3_sigstats/Kurtosis","FRM_1/curr3_sigstats/Mean","FRM_1/curr3_sigstats/PeakValue","FRM_1/curr3_sigstats/RMS","FRM_1/curr3_sigstats/Skewness","FRM_1/curr3_sigstats/Std","FRM_1/curr4_sigstats/CrestFactor","FRM_1/curr4_sigstats/Kurtosis","FRM_1/curr4_sigstats/Mean","FRM_1/curr4_sigstats/PeakValue","FRM_1/curr4_sigstats/RMS","FRM_1/curr4_sigstats/Skewness","FRM_1/curr4_sigstats/Std","FRM_1/curr5_sigstats/CrestFactor","FRM_1/curr5_sigstats/Kurtosis","FRM_1/curr5_sigstats/Mean","FRM_1/curr5_sigstats/PeakValue","FRM_1/curr5_sigstats/RMS","FRM_1/curr5_sigstats/Skewness","FRM_1/curr5_sigstats/Std","FRM_1/curr6_sigstats/CrestFactor","FRM_1/curr6_sigstats/Kurtosis","FRM_1/curr6_sigstats/Mean","FRM_1/curr6_sigstats/PeakValue","FRM_1/curr6_sigstats/RMS","FRM_1/curr6_sigstats/Skewness","FRM_1/curr6_sigstats/Std","FRM_1/desRoll_sigstats/CrestFactor","FRM_1/desRoll_sigstats/Kurtosis","FRM_1/desRoll_sigstats/Mean","FRM_1/desRoll_sigstats/PeakValue","FRM_1/desRoll_sigstats/RMS","FRM_1/desRoll_sigstats/Skewness","FRM_1/desRoll_sigstats/Std","FRM_1/roll_sigstats/CrestFactor","FRM_1/roll_sigstats/Kurtosis","FRM_1/roll_sigstats/Mean","FRM_1/roll_sigstats/PeakValue","FRM_1/roll_sigstats/RMS","FRM_1/roll_sigstats/Skewness","FRM_1/roll_sigstats/Std","FRM_1/desPitch_sigstats/CrestFactor","FRM_1/desPitch_sigstats/Kurtosis","FRM_1/desPitch_sigstats/Mean","FRM_1/desPitch_sigstats/PeakValue","FRM_1/desPitch_sigstats/RMS","FRM_1/desPitch_sigstats/Skewness","FRM_1/desPitch_sigstats/Std","FRM_1/pitch_sigstats/CrestFactor","FRM_1/pitch_sigstats/Kurtosis","FRM_1/pitch_sigstats/Mean","FRM_1/pitch_sigstats/PeakValue","FRM_1/pitch_sigstats/RMS","FRM_1/pitch_sigstats/Skewness","FRM_1/pitch_sigstats/Std","FRM_1/desYaw_sigstats/CrestFactor","FRM_1/desYaw_sigstats/Kurtosis","FRM_1/desYaw_sigstats/Mean","FRM_1/desYaw_sigstats/PeakValue","FRM_1/desYaw_sigstats/RMS","FRM_1/desYaw_sigstats/Skewness","FRM_1/desYaw_sigstats/Std","FRM_1/yaw_sigstats/CrestFactor","FRM_1/yaw_sigstats/Kurtosis","FRM_1/yaw_sigstats/Mean","FRM_1/yaw_sigstats/PeakValue","FRM_1/yaw_sigstats/RMS","FRM_1/yaw_sigstats/Skewness","FRM_1/yaw_sigstats/Std","FRM_1/vibeX_sigstats/CrestFactor","FRM_1/vibeX_sigstats/Kurtosis","FRM_1/vibeX_sigstats/Mean","FRM_1/vibeX_sigstats/PeakValue","FRM_1/vibeX_sigstats/RMS","FRM_1/vibeX_sigstats/Skewness","FRM_1/vibeX_sigstats/Std","FRM_1/vibeY_sigstats/CrestFactor","FRM_1/vibeY_sigstats/Kurtosis","FRM_1/vibeY_sigstats/Mean","FRM_1/vibeY_sigstats/PeakValue","FRM_1/vibeY_sigstats/RMS","FRM_1/vibeY_sigstats/Skewness","FRM_1/vibeY_sigstats/Std","FRM_1/vibeZ_sigstats/CrestFactor","FRM_1/vibeZ_sigstats/Kurtosis","FRM_1/vibeZ_sigstats/Mean","FRM_1/vibeZ_sigstats/PeakValue","FRM_1/vibeZ_sigstats/RMS","FRM_1/vibeZ_sigstats/Skewness","FRM_1/vibeZ_sigstats/Std","FRM_1/rate_sigstats/CrestFactor","FRM_1/rate_sigstats/Kurtosis","FRM_1/rate_sigstats/Mean","FRM_1/rate_sigstats/PeakValue","FRM_1/rate_sigstats/RMS","FRM_1/rate_sigstats/Skewness","FRM_1/rate_sigstats/Std","FRM_1/rate_sigstats_1/CrestFactor","FRM_1/rate_sigstats_1/Kurtosis","FRM_1/rate_sigstats_1/Mean","FRM_1/rate_sigstats_1/PeakValue","FRM_1/rate_sigstats_1/RMS","FRM_1/rate_sigstats_1/Skewness","FRM_1/rate_sigstats_1/Std","FRM_1/rate_sigstats_2/CrestFactor","FRM_1/rate_sigstats_2/Kurtosis","FRM_1/rate_sigstats_2/Mean","FRM_1/rate_sigstats_2/PeakValue","FRM_1/rate_sigstats_2/RMS","FRM_1/rate_sigstats_2/Skewness","FRM_1/rate_sigstats_2/Std","FRM_1/rate_sigstats_3/CrestFactor","FRM_1/rate_sigstats_3/Kurtosis","FRM_1/rate_sigstats_3/Mean","FRM_1/rate_sigstats_3/PeakValue","FRM_1/rate_sigstats_3/RMS","FRM_1/rate_sigstats_3/Skewness","FRM_1/rate_sigstats_3/Std","FRM_1/rate_sigstats_4/CrestFactor","FRM_1/rate_sigstats_4/Kurtosis","FRM_1/rate_sigstats_4/Mean","FRM_1/rate_sigstats_4/PeakValue","FRM_1/rate_sigstats_4/RMS","FRM_1/rate_sigstats_4/Skewness","FRM_1/rate_sigstats_4/Std","FRM_1/rate_sigstats_5/CrestFactor","FRM_1/rate_sigstats_5/Kurtosis","FRM_1/rate_sigstats_5/Mean","FRM_1/rate_sigstats_5/PeakValue","FRM_1/rate_sigstats_5/RMS","FRM_1/rate_sigstats_5/Skewness","FRM_1/rate_sigstats_5/Std","FRM_1/rate_sigstats_6/CrestFactor","FRM_1/rate_sigstats_6/Kurtosis","FRM_1/rate_sigstats_6/Mean","FRM_1/rate_sigstats_6/PeakValue","FRM_1/rate_sigstats_6/RMS","FRM_1/rate_sigstats_6/Skewness","FRM_1/rate_sigstats_6/Std","FRM_1/rate_sigstats_7/CrestFactor","FRM_1/rate_sigstats_7/Kurtosis","FRM_1/rate_sigstats_7/Mean","FRM_1/rate_sigstats_7/PeakValue","FRM_1/rate_sigstats_7/RMS","FRM_1/rate_sigstats_7/Skewness","FRM_1/rate_sigstats_7/Std","FRM_1/rate_sigstats_8/CrestFactor","FRM_1/rate_sigstats_8/Kurtosis","FRM_1/rate_sigstats_8/Mean","FRM_1/rate_sigstats_8/PeakValue","FRM_1/rate_sigstats_8/RMS","FRM_1/rate_sigstats_8/Skewness","FRM_1/rate_sigstats_8/Std","FRM_1/rate_sigstats_9/CrestFactor","FRM_1/rate_sigstats_9/Kurtosis","FRM_1/rate_sigstats_9/Mean","FRM_1/rate_sigstats_9/PeakValue","FRM_1/rate_sigstats_9/RMS","FRM_1/rate_sigstats_9/Skewness","FRM_1/rate_sigstats_9/Std","FRM_1/rate_sigstats_10/CrestFactor","FRM_1/rate_sigstats_10/Kurtosis","FRM_1/rate_sigstats_10/Mean","FRM_1/rate_sigstats_10/PeakValue","FRM_1/rate_sigstats_10/RMS","FRM_1/rate_sigstats_10/Skewness","FRM_1/rate_sigstats_10/Std","FRM_1/rate_sigstats_11/CrestFactor","FRM_1/rate_sigstats_11/Kurtosis","FRM_1/rate_sigstats_11/Mean","FRM_1/rate_sigstats_11/PeakValue","FRM_1/rate_sigstats_11/RMS","FRM_1/rate_sigstats_11/Skewness","FRM_1/rate_sigstats_11/Std","FRM_1/accX_ps_spec/PeakFreq1","FRM_1/accX_ps_spec/BandPower","FRM_1/accY_ps_spec/PeakFreq1","FRM_1/accY_ps_spec/BandPower","FRM_1/accZ_ps_spec/PeakFreq1","FRM_1/accZ_ps_spec/BandPower","FRM_1/gyrX_ps_spec/PeakFreq1","FRM_1/gyrX_ps_spec/BandPower","FRM_1/gyrY_ps_spec/PeakFreq1","FRM_1/gyrY_ps_spec/BandPower","FRM_1/gyrZ_ps_spec/PeakFreq1","FRM_1/gyrZ_ps_spec/BandPower","FRM_1/pwm1_ps_spec/PeakFreq1","FRM_1/pwm1_ps_spec/BandPower","FRM_1/pwm2_ps_spec/PeakFreq1","FRM_1/pwm2_ps_spec/BandPower","FRM_1/pwm3_ps_spec/PeakFreq1","FRM_1/pwm3_ps_spec/BandPower","FRM_1/pwm4_ps_spec/PeakFreq1","FRM_1/pwm4_ps_spec/BandPower","FRM_1/pwm5_ps_spec/PeakFreq1","FRM_1/pwm5_ps_spec/BandPower","FRM_1/pwm6_ps_spec/PeakFreq1","FRM_1/pwm6_ps_spec/BandPower","FRM_1/esc1_ps_spec/PeakFreq1","FRM_1/esc1_ps_spec/BandPower","FRM_1/esc2_ps_spec/PeakFreq1","FRM_1/esc2_ps_spec/BandPower","FRM_1/esc3_ps_spec/PeakFreq1","FRM_1/esc3_ps_spec/BandPower","FRM_1/esc4_ps_spec/PeakFreq1","FRM_1/esc4_ps_spec/BandPower","FRM_1/esc5_ps_spec/PeakFreq1","FRM_1/esc5_ps_spec/BandPower","FRM_1/esc6_ps_spec/PeakFreq1","FRM_1/esc6_ps_spec/BandPower","FRM_1/curr1_ps_spec/PeakFreq1","FRM_1/curr1_ps_spec/BandPower","FRM_1/curr2_ps_spec/PeakFreq1","FRM_1/curr2_ps_spec/BandPower","FRM_1/curr3_ps_spec/PeakFreq1","FRM_1/curr3_ps_spec/BandPower","FRM_1/curr4_ps_spec/PeakFreq1","FRM_1/curr4_ps_spec/BandPower","FRM_1/curr5_ps_spec/PeakFreq1","FRM_1/curr5_ps_spec/BandPower","FRM_1/curr6_ps_spec/PeakFreq1","FRM_1/curr6_ps_spec/BandPower","FRM_1/desRoll_ps_spec/PeakFreq1","FRM_1/desRoll_ps_spec/BandPower","FRM_1/roll_ps_spec/PeakFreq1","FRM_1/roll_ps_spec/BandPower","FRM_1/desPitch_ps_spec/PeakFreq1","FRM_1/desPitch_ps_spec/BandPower","FRM_1/pitch_ps_spec/PeakFreq1","FRM_1/pitch_ps_spec/BandPower","FRM_1/desYaw_ps_spec/PeakFreq1","FRM_1/desYaw_ps_spec/BandPower","FRM_1/yaw_ps_spec/PeakFreq1","FRM_1/yaw_ps_spec/BandPower","FRM_1/vibeX_ps_spec/PeakFreq1","FRM_1/vibeX_ps_spec/BandPower","FRM_1/vibeY_ps_spec/PeakFreq1","FRM_1/vibeY_ps_spec/BandPower","FRM_1/vibeZ_ps_spec/PeakFreq1","FRM_1/vibeZ_ps_spec/BandPower","FRM_1/rate_ps_spec/PeakFreq1","FRM_1/rate_ps_spec/BandPower","FRM_1/rate_ps_1_spec/PeakFreq1","FRM_1/rate_ps_1_spec/BandPower","FRM_1/rate_ps_2_spec/PeakFreq1","FRM_1/rate_ps_2_spec/BandPower","FRM_1/rate_ps_3_spec/PeakFreq1","FRM_1/rate_ps_3_spec/BandPower","FRM_1/rate_ps_4_spec/PeakFreq1","FRM_1/rate_ps_4_spec/BandPower","FRM_1/rate_ps_5_spec/PeakFreq1","FRM_1/rate_ps_5_spec/BandPower","FRM_1/rate_ps_6_spec/PeakFreq1","FRM_1/rate_ps_6_spec/BandPower","FRM_1/rate_ps_7_spec/PeakFreq1","FRM_1/rate_ps_7_spec/BandPower","FRM_1/rate_ps_8_spec/PeakFreq1","FRM_1/rate_ps_8_spec/BandPower","FRM_1/rate_ps_9_spec/PeakFreq1","FRM_1/rate_ps_9_spec/BandPower","FRM_1/rate_ps_10_spec/PeakFreq1","FRM_1/rate_ps_10_spec/BandPower","FRM_1/rate_ps_11_spec/PeakFreq1","FRM_1/rate_ps_11_spec/BandPower"];
featureTable = readFeatureTable(outputEnsemble,"FRM_1",'Features',selectedFeatureNames,'ConditionVariables',outputEnsemble.ConditionVariables,'IncludeMemberID',true);

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = unique([outputEnsemble.DataVariables;outputEnsemble.ConditionVariables;outputEnsemble.IndependentVariables],'stable');

% Gather results into a table.
if nargout > 1
    outputTable = readall(outputEnsemble);
end
end