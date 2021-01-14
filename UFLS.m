clc 
clear
global Load12
Load12 =0;
global relayA
global relayB
global relayC
global relayAt
global relayBt
global relayCt

relayAt = [1 1 1 1 1 1];
relayBt = [1 1 1 1 1 1];
relayCt = [1 1 1 1 1 1];
global relayAstate
global relayBstate
global relayCstate
global relayAnames
global relayBnames
global relayCnames
global LoadA
global LoadB
global LoadC
global Counterloads
global Counterloads1
Counterloads1=0;
Counterloads = 0;
global q % Controller Trigger
global p % Estimated value sent to Controller
global s % one time estimation
global F % Trigger Delta Estimation
global Breaker 
Breaker =0 ;
%%
%G's Status

global h1
global h2
global h3
h1= 9.55;
h2=2.35*(128/247.5);
h3=3.33*(192/247.5);

global h1state
global h2state
global h3state
global Gshut
Gshut =0 ;
h1state = "true" ; 
h2state = "true" ;
h3state = "true" ;
global VBGnames
global VBLnames
global Generators
VBGnames = [ "VG1","VG2","VG3"]';
VBLnames = ["VloadA","VloadB","VloadC"]';
Generators = [ "G1" , "G2" , "G3"]';
global counter 
counter =0;
global Counter2 
Counter2 = 0;
global swg
swg =0;    
%%
F =0;
s=0;
q=0; 
relayA = [1 1 1 1 1 1];
relayB = [1 1 1 1 1 1];
relayC = [1 1 1 1 1 1];
LoadA = [10 7 15 3 13 14.5];
LoadB = [5 7 11 6 8 13];
LoadC = [5.5 7.5 6.5 7 9 15.5];
relayAstate = [ "true", "true" , "true" ,"true" , "true", "true", "true" ,"true" , "true", "true"]';
relayBstate = [ "true", "true" , "true" ,"true" , "true", "true", "true" ,"true" , "true", "true"]';
relayCstate = [ "true", "true" , "true","true" , "true" , "true", "true" ,"true" , "true", "true"]';
relayAnames = ["Loada1", "Loada2" , "Loada3" ,"Loada4" , "Loada5", "Loada6", "Loada7" ,"Loada8" , "Loada9", "Loada10"]';
relayBnames = ["Loadb1", "Loadb2" , "Loadb3" ,"Loadb4" , "Loadb5", "Loadb6", "Loadb7" ,"Loadb8" , "Loadb9", "Loadb10"]';
relayCnames = ["Loadc1", "Loadc2" , "Loadc3" ,"Loadc4" , "Loadc5", "Loadc6", "Loadc7" ,"Loadc8" , "Loadc9", "Loadc10"]';
global LoadsTrigger
LoadsTrigger =0;
%%
global myMQTT
global mySub
myMQTT = mqtt('ws://ip-160-153-252-170.ip.secureserver.net', 'Port', 8888,'Username','matlab', 'Password', 'UKR5Kr+bd@$gJYpY89jjHgA');
mySub = subscribe(myMQTT,'loads-updates', 'QoS', 2) ;
mySub.Callback = @Testmsg; 
Initializaing(); 

sim('IEEE_9bus_new_wow_mach_9.slx')
p;
figure;
plot(Vbus4,'b')
hold on 
plot(Vbus9,'m')
hold on 
plot(Vbus7,'y')
ylabel('Generator Voltage (pu)')
xlabel('Time(sec)')
legend('Voltage at G1','Voltage at G2','Voltage at G3')
figure;
plot(Vbus5,'g')
hold on 
plot(Vbus6,'r')
hold on 
plot(Vbus8,'c')
hold on 
ylabel('Load Voltage (pu)')
xlabel('Time(sec)')

legend('Voltage at LoadA','Voltage at LoadB','Voltage at LoadC')






figure
plot(Fcoi);
title('Fcoi')
ylabel('Frequency (Hz)')
xlabel('Time(sec)')

figure
plot(PowerG1,'r');
hold on 
plot(PowerG2,'b');
hold on 
plot(PowerG3,'m');
hold on 
ylabel('Power (W)')
xlabel('Time(sec)')
legend('PowerG1','PowerG2','PowerG3')