function G = Gcontrol(u)

global h1
global h2
global h3
global myMQTT
global counter
global swg


if  counter >= 4000
if u(1)>-1e-5 && u(1)< 5e-3  && swg == 0  
    h1 =0 
    swg = 1 ;
end

  if u(2)>-1e-5 && u(2)< 5e-3  && swg == 0  
    h2 =0 
     fprintf('Generator 2 128MVA on bus 3 is out of service \n')
   %danger =  string('{"type":"danger","message": "Generator 2 (128 MVA) went down", "timestamp":"00000"}');
   % publish(myMQTT, 'alerts', danger);
    swg = 1 ;
  end 

    if u(3)>-1e-5 && u(3)< 5e-3  && swg == 0  
    h3 =0 
    swg = 1 ;
    end
   

else 
    counter = counter + 1;
    
end

G = [h1,h2,h3];

end