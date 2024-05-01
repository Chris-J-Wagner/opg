
figure('name','vcsel on response');
subplot(2,1,1)
for i = 2:15
    file_name = sprintf("vcsel_on_response_s%d.txt", i);
    data = csvread(file_name);
    plot(data,'-k');
    hold on
end
xlabel('Measurement index')
ylabel('Counts [LSB]')

subplot(2,1,2)
for i = 2:15
    file_name = sprintf("vcsel_on_response_s%d.txt", i);
    data = csvread(file_name);
    plot(diff(data),'-k');
    hold on
end
axis([0, 100, -10 10])
xlabel('Measurement index')
ylabel('Counts [LSB]')

figure('name','vcsel off response');
subplot(2,1,1)
for i = 2:15
    file_name = sprintf("pd_response_s%d.txt", i);
    data = csvread(file_name);
    plot(data,'-k');
    hold on
end
xlabel('Measurement index')
ylabel('Counts [LSB]')

subplot(2,1,2)
for i = 2:15
    file_name = sprintf("pd_response_s%d.txt", i);
    data = csvread(file_name);
    plot(diff(data),'-k');
    hold on
end
axis([0, 100, -10 10])
xlabel('Measurement index')
ylabel('Counts [LSB]')