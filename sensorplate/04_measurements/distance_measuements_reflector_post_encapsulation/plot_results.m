file_name = "distance_measurements_reflector_8mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_post_8mA = data(:,6);
file_name = "distance_measurements_reflector_7mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_post_7mA = data(:,6);
file_name = "distance_measurements_reflector_6mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_post_6mA = data(:,6);

plot(measurements_post_8mA,'-k')
% h = datacursormode;
% s = getCursorInfo(h);
% indices = [s.Position];
% indices = indices(1:2:end);
% nd = indices(1:2:end);
% st = indices(2:2:end);

%%

d = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
d_8mA_start_indices = [17668,16686,15625,14645,13434,12305,11095,10013,8985,7045,5934,4806,3649,2551,1335];
d_8mA_end_indices = [17937,16888,15813,14778,13595,12537,11284,10249,9214,7274,6134,5007,3837,2703,1472];
d_7mA_start_indices = [20575,19544,18533,17338,14978,13901,12745,11652,10610,9182,8174,6460,5402,4276,2708];
d_7mA_end_indices = [20870,19805,18786,17728,15267,14197,13023,11920,10863,9383,8375,6618,5536,4463,2930];
d_6mA_start_indices = [18441,17405,16332,15275,14145,12908,11920,10906,8878,7359,6351,5195,4147,2985,1513];
d_6mA_end_indices = [18726,17668,16586,15526,14409,13120,12147,11094,8999,7560,6499,5383,4362,3190,1645];

for i = 1:15
    adc_values_8mA_post(i) = mean(measurements_post_8mA(d_8mA_start_indices(i):d_8mA_end_indices(i)));
    std_values_8mA_post(i) = std(measurements_post_8mA(d_8mA_start_indices(i):d_8mA_end_indices(i)));
    adc_values_7mA_post(i) = mean(measurements_post_7mA(d_7mA_start_indices(i):d_7mA_end_indices(i)));
    std_values_7mA_post(i) = std(measurements_post_7mA(d_7mA_start_indices(i):d_7mA_end_indices(i)));
    adc_values_6mA_post(i) = mean(measurements_post_6mA(d_6mA_start_indices(i):d_6mA_end_indices(i)));
    std_values_6mA_post(i) = std(measurements_post_6mA(d_6mA_start_indices(i):d_6mA_end_indices(i)));
end

errorbar(d,fliplr(adc_values_8mA_post),fliplr(std_values_8mA_post),'-bx');
hold on
errorbar(d,fliplr(adc_values_7mA_post),fliplr(std_values_7mA_post),'--bx');
errorbar(d,fliplr(adc_values_6mA_post),fliplr(std_values_6mA_post),'-.bx');
grid on
xlabel('Distance [mm]')
ylabel('ADC value [LSB]')
title('Reflector distance curves post encapsulation, 122k\Omega')
legend('8 mA','7 mA','6 mA')