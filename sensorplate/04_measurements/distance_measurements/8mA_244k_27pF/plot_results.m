% Distance curve for single optode measurement. %

start_indices = [632, 738, 541, 624, 506, 1209, 425, 503, ...
    594, 529, 506, 547, 466, 473, 585];
stop_indices = [1131, 1248, 1025, 1083, 1004, 1636, 1003, 957, ...
    1163, 1160, 1021, 1117, 1004, 975, 1074];
taring_value = [56, 26,4, -4, -1, -9, -12, -13, 0, -6, -1, 3, 1, 5, 6];

d = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30];
m = zeros(1,15);
st = zeros(1,15);

for n = 1:15
    file_name = sprintf("d%d", n);
    try
        data_adr = readtable(file_name);
        data = table2array(data_adr);
        measurements = data(:,6);
        segment = measurements(start_indices(n):stop_indices(n));
        m(n) = mean(segment) - taring_value(n);
        st(n) = std(segment);
    catch
        fprintf("No file for d%d.\n", n);
    end
end

errorbar(d, m, st, '-kx')
xlabel('Distance [mm]')
ylabel('ADC value [LSB]')
title("Distance curve for 8 mA and R_f = 244 k\Omega");
grid on

%%
clc;
start_indices = [632, 738, 541, 624, 506, 1209, 425, 503, ...
    594, 529, 506, 547, 466, 473, 585];
stop_indices = [1131, 1248, 1025, 1083, 1004, 1636, 1003, 957, ...
    1163, 1160, 1021, 1117, 1004, 975, 1074];
taring_value = [56, 26,4, -4, -1, -9, -12, -13, 0, -6, -1, 3, 1, 5, 6];

file_name = "d15.csv";
data = readtable(file_name);
data = table2array(data);
plot(data(:,1), data(:,6));