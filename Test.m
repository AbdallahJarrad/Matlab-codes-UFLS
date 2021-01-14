function F=Test(u)
global F 
global h1
global h2
global h3
global s 

Ftest = 0;
if h1== 0 || h2 ==0 || h3 == 0       %  pass when any generator is off 
if u <= 59.85 && u > 59.45 && s ==0  %  pass when the frequency is below the threshould
    
    Ftest = 1; % trigger for Delta function

end
end
if u <= 59.60 && u > 57.5  && s ==0  
    Ftest =1 ;
   
end 
 F = Ftest;
end 
