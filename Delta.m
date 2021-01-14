function  P=Delta(u)
global F
global q
global p 
global s
global h1
global h2
global h3
global swg
global LoadsTrigger

q=0;

H = h1 +h2 +h3;
if F == 1 && s == 0    % pass when Test function trigers an estimation command
    
   if (h1== 0 || h2 ==0 || h3 == 0)
p = -2 * H *u *247.5/60;
q = 1; % Controller Trigger
s=1;   % one time estimation
 LoadsTrigger = 1;% trigger for sending messages
   else
      p = 0.975* -2 * H *u *247.5/60;
q = 1; % Controller Trigger
s=1;   % one time estimation
 LoadsTrigger = 10;      % trigger for sending messages
   end
if swg ==1 
     fprintf('Estimated Power to be shed from the system due the shut down of Genarator 2 is %4.5f MW \n',p)
else
     fprintf('Estimated Power to be shed from the system due the over load is %4.5f MW \n',p)
end

else 
p=0;
end
P = [p,q];
