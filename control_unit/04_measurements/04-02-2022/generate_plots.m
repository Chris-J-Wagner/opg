%% Current source step response.

data1 = readtable("current_source_gpio_vmod.CSV");
data2 = readtable("current_source_vout.CSV");
data1 = table2array(data1);
data2 = table2array(data2);

plot(data1(:,1)*1e6,data1(:,2),'k')
grid on
hold on
plot(data2(:,1)*1e6,data2(:,2),'b')
xlabel('Time [µs]');
ylabel('Voltage')
title("Current source step response")
legend('V_{mod}','V_{out}','Location','southeast');

% fit_and_print_to_pdf(gcf, "current_source_step_response","-dpdf");

%% Voltage overshoot from PD.
data1 = readtable("MUX_out_neg_gate_voltage.CSV");
data2 = readtable("PD_flush_overshoot_voltage3.CSV");
data1 = table2array(data1);
data2 = table2array(data2);

plot(data1(:,1)*1e6,data1(:,2),'k')
grid on
hold on
plot(data2(:,1)*1e6,data2(:,2),'b')
xlabel('Time [µs]');
ylabel('Voltage')
title("Photodiode flush current overshoot")
legend('V_{gate}','V_{adc}','Location','southeast');
axis([-70 160 -inf inf])

% set(gcf,'Position', [26.6435   13.7848   19.8438    9.9483])
% fit_and_print_to_pdf(gcf, "photodiode_flush_current_overshoot","-dpdf");