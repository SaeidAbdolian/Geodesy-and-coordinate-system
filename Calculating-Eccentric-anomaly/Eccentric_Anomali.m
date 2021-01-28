clc
clear all
disp('if you enter Mean anomaly without value so we enter m =100')
m = input('m = ');
if isempty(m)
    m=100
end
n=0;
eccentric=0;
while n < m
  n = eccentric - exp(1)*sin(eccentric);
  s=m-n;
  eccentric=eccentric+s;
end
eccentric