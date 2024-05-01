clear;clc;

file_name_sensor_1 = "static_distances_sensor_1_23-03-2022.csv";
data1 = readtable(file_name_sensor_1);
data1 = table2array(data1);
file_name_sensor_2 = "static_distances_sensor_2_23-03-2022.csv";
data2 = readtable(file_name_sensor_2);
data2 = table2array(data2);

plot(data2(:,3:end))
legend('S11','S12','S13','S14'...
    ,'S21','S22','S23','S24'...
    ,'S31','S32','S33','S34'...
    ,'S41','S42','S43')
%%
end_indices_1 = [6042,5033,4006,2957,1929];
start_indices_1 = [5900,4797,3778,2790,1436];
end_indices_2 = [7981,6886,5858,4600,2549];
start_indices_2 = [7588,6602,5368,4092,1025];

for n = 1:length(end_indices_1)
    means_1(n,:) = mean(data1(start_indices_1(n):end_indices_1(n),3:end));
    stds_1(n,:) = std(data1(start_indices_1(n):end_indices_1(n),3:end));
    means_2(n,:) = mean(data2(start_indices_2(n):end_indices_2(n),3:end));
    stds_2(n,:) = std(data2(start_indices_2(n):end_indices_2(n),3:end));    
end

d = fliplr([10,15,20,25,30]);

figure('Name','Sensor 1')
    for n = 1:15
        errorbar(d, means_1(:,n), stds_1(:,n));
        hold on
    end
    grid on
    xlabel('Distance [mm]')
    ylabel('ADC value [LSB]')
    title('Reflector distance curves post encapsulation, 243k\Omega')
    legend('S11','S12','S13','S14'...
    ,'S21','S22','S23','S24'...
    ,'S31','S32','S33','S34'...
    ,'S41','S42','S43')
figure('Name','Sensor 1')
    for n = 1:15
        errorbar(d, means_2(:,n), stds_2(:,n));
        hold on
    end
    grid on
    xlabel('Distance [mm]')
    ylabel('ADC value [LSB]')
    title('Reflector distance curves pre encapsulation, 243k\Omega')
    legend('S11','S12','S13','S14'...
    ,'S21','S22','S23','S24'...
    ,'S31','S32','S33','S34'...
    ,'S41','S42','S43')