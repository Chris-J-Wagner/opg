% Distance curve for single optode measurement. %

% clear;clc;

start_indices = [1972, 2209, 3464, 624, 588, 660, 484, 514, 569,NaN,...
    1529, 821, 728, 500, 605];
stop_indices = [2587, 2709, 3914, 1115, 1125, 1210, 1028, 1118, 1071, NaN, ...
    2132, 1405, 1370, 1178, 1205];

d = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
m = zeros(1,15);
st = zeros(1,15);

for n = 1:15
    file_name = sprintf("d%d.csv", n);
    try
        data_adr = readtable(file_name);
        data = table2array(data_adr);
        measurements = data(:,6);
        segment = measurements(start_indices(n):stop_indices(n));
        m(n) = mean(segment);
        st(n) = std(segment);
    catch
        fprintf("No file for d%d.\n", n);
    end
end

% Remove spacer 20 mm for now.
d(10) = [];
m(10) = [];
st(10) = [];
errorbar(d, m, st, '-kx')
xlabel('Distance [mm]')
ylabel('ADC value [LSB]')
title("Distance curve for 5 mA and R_f = 244 k\Omega");
grid on