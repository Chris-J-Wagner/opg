led_off = readmatrix("offset_transient_measurements.csv");
led_on = readmatrix("sensor_readings_transient_measurements.csv");

figure("Name","Offset, led off");
plot(0:23, led_off,'-kx')
xlabel('Measurement index')
ylabel('Counts [LSB]')
axis([0,23,-inf,inf])
