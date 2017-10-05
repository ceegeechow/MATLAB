%Camille Chow
%ECE300 PSET 1
%9/26/17

%Question 1 Part c
trials = 10000;
urn1 = [0 0 0 0 1]; % 0 = blue, 1 = red
urn2 = repmat([0;0;1;1],1,trials);
choice1 = urn1(randi(5,1,trials)); %pick a ball from urn 1 10,000 times
new_urn2 = [urn2;choice1]; %add the choices to 10,000 urn 2's
choice2 = zeros(1,trials);
%choice2 = new_urn2(randi(5,1,trials); -- doesn't produce same results?
for i = 1:trials
    choice2(1,i) = new_urn2(r(1,i),i); %choose a ball from each new urn 2
end

ML = choice2; %predicts the first ball was the color of the second ball chosen
MAP = zeros(1,trials); %always predicts first ball was blue

%percent correct
p_ml = (1 - sum(abs(ML - choice1))/trials)*100
p_map = (1 - sum(abs(MAP - choice1))/trials)*100

%Question 3 Part c
fn = (-10:.01:10); %fn (normalized) = f/W
Y = sinc(.25*fn).*exp(-log(2)*fn.^2/2); %output frequency spectrum
figure
plot(fn,Y)
xlabel('f/W')
ylabel('Y(f)')
title('Frequency Spectrum of Y')

B0 = fn(Y<.00001 & fn > 0);
B0(1) %f/W at which Y(f/W) is 50 dB down

%Question 3 Part e
tn = (-10:.01:10); %tn = t/T
%output pulse:
y = 2*sqrt(2*pi*log(2))*(qfunc((pi/(2*sqrt(log(2))))*(tn - 1/2)) - qfunc((pi/(2*sqrt(log(2))))*(tn + 1/2)))/pi;
peak = max(abs(y));
figure
plot(tn,y/peak)
xlabel('t/T')
ylabel('y/max(y)')
title('Output Pulse')

T0 = tn(y < .1*peak & tn > 0);
T0(1) %t/T at which y(t/T) goes below 10% of peak value