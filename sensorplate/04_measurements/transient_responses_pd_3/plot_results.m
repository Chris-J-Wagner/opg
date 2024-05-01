data = zeros(64,15);

for i = 1:15
    file_name = sprintf("pd_transient_with_offset_s%d.txt", i);
    data(:,i) = csvread(file_name);
end

subplot(2,1,1)
plot(data)

subplot(2,1,2)
for i = 1:15
    file_name = sprintf("pd_transient_with_offset_2_s%d.txt", i);
    data(:,i) = csvread(file_name);
end
plot(data)