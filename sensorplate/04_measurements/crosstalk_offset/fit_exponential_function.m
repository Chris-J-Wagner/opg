clear;clc;

B = csvread("pd_irradiance_vcsel_off.txt");
B = [B(:,1),B(:,3),B(:,4),B(:,2)];
A = csvread("pd_irradiance_vcsel_on.txt");
A = [A(:,1),A(:,3),A(:,4),A(:,2)];
C = A-B;
C = C - C(:,1);

mean_b = 0.4362;
mean_a = 1e-10;

for index = 1:15
    x = C(index,:)';
    y = B(index,:)';
    plot(x,y)
    f = fit(x,y,'exp1','StartPoint',[x(1), y(1)]);
    a(index) = f.a;
    b(index) = f.b;
    fit_func =@(x) a(index)*exp(b(index)*x);
    xfit = x(1):0.001:x(end);
    hold on
    plot(xfit,fit_func(xfit),'-k')
end

%% 
mean_C = mean(C,1);
mean_B = mean(B,1);
std_C = std(C,1);

f = fit(mean_C',mean_B','exp1','StartPoint',[mean_C(1), mean_B(1)]);
fit_func =@(x) f.a*exp(f.b*x);
xfit = x(1):0.001:x(end);
plot(mean_C,mean_B)
hold on
plot(xfit,fit_func(xfit),'-k')

