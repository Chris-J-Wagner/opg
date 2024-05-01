file_name = "distance_measurements_reflector_8mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_pre_8mA = data(:,6);
file_name = "distance_measurements_reflector_7mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_pre_7mA = data(:,6);
file_name = "distance_measurements_reflector_6mA_122kOhm.csv";
data = readtable(file_name);
data = table2array(data);
measurements_pre_6mA = data(:,6);

% plot(measurements_8mA)

d = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
d_8mA_start_indices = [19505,18340,17166,14332,13308,12196,11069,9928,8830,7026,5880,4871,3634,2488,788];
d_8mA_end_indices = [19882,18602,17541,14620,13565,12477,11336,10186,9054,7291,6105,5083,4005,2694,1042];
d_7mA_start_indices = [22336,21261,20114,18362,16478,15255,14012,10039,9047,7972,6956,5950,4684,3583,2188];
d_7mA_end_indices = [22624,21535,20390,18633,16730,15539,14281,10207,9199,8279,7115,6156,5083,3819,2412];
d_6mA_start_indices = [17386,16424,15302,14120,12816,11606,10537,9448,8421,7426,6310,5231,4214,3155,1696];
d_6mA_end_indices = [17574,16584,15491,14334,12991,11821,10740,9665,8609,7601,6458,5423,4430,3313,1839];

for i = 1:15
    adc_values_8mA_pre(i) = mean(measurements_pre_8mA(d_8mA_start_indices(i):d_8mA_end_indices(i)));
    std_values_8mA_pre(i) = std(measurements_pre_8mA(d_8mA_start_indices(i):d_8mA_end_indices(i)));
    adc_values_7mA_pre(i) = mean(measurements_pre_7mA(d_7mA_start_indices(i):d_7mA_end_indices(i)));
    std_values_7mA_pre(i) = std(measurements_pre_7mA(d_7mA_start_indices(i):d_7mA_end_indices(i)));
    adc_values_6mA_pre(i) = mean(measurements_pre_6mA(d_6mA_start_indices(i):d_6mA_end_indices(i)));
    std_values_6mA_pre(i) = std(measurements_pre_6mA(d_6mA_start_indices(i):d_6mA_end_indices(i)));
end

errorbar(d,fliplr(adc_values_8mA_pre),fliplr(std_values_8mA_pre),'-kx');
hold on
errorbar(d,fliplr(adc_values_7mA_pre),fliplr(std_values_7mA_pre),'--kx');
errorbar(d,fliplr(adc_values_6mA_pre),fliplr(std_values_6mA_pre),'-.kx');
grid on
xlabel('Distance [mm]')
ylabel('ADC value [LSB]')
title('Reflector distance curves pre encapsulation, 122k\Omega')
legend('8 mA','7 mA','6 mA')
