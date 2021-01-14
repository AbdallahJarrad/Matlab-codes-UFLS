function FreqandVolt = freqv(u)

global VoltageAtG1
global VoltageAtG2
global VoltageAtG3
global VoltageAtload
global VoltageAtload1
global VoltageAtload2
global h1state
global h2state
global h3state
global Counter2
global h1
global h2
global h3
global swg
global myMQTT
global Breaker
global VBGnames
global VBLnames


PowerG = string([ u(2)/1e6, u(3)/1e6, u(4)/1e6]');
 
VG = string([VoltageAtG1,VoltageAtG2,VoltageAtG3]');
VL = string([VoltageAtload,VoltageAtload1,VoltageAtload2]');
     


if (h1== 0 || h2 ==0 || h3 == 0) && swg ==1 && Breaker < 2 
      if h1 == 0 
       h1state = "false";
      end
      if h2 == 0 
       h2state = "false";
      end

       if h3 == 0 
       h3state = "false";
       end
       
       
Gstate = [h1state,h2state,h3state]';
    systemState= strjoin(string(['{"freq":','"',string(num2str(u(1))),'"',"}",',"LoadBusses":[',jsonencode(table(VBLnames,VL)),"]"]),'');
 generators = strjoin(string([ '{"Generators":[' , jsonencode(table(VBGnames,VG,Gstate,PowerG)) , "]}"]));
 msg = strjoin(string(["{",'"systemState":',systemState,',"generators":',generators,"}"]));
 publish(myMQTT, 'system-update', msg);

Breaker = Breaker+1;
 

 
else 
    if Counter2 >1000
     if h1 == 0 
       h1state = "false";
      end
      if h2 == 0 
       h2state = "false";
      end

if h3 == 0 
       h3state = "false";
end
 
Gstate = [h1state,h2state,h3state]';

    systemState= strjoin(string(['{"freq":','"',string(num2str(u(1))),'"',"}",',"LoadBusses":[',jsonencode(table(VBLnames,VL)),"]"]),'');
 generators = strjoin(string([ '{"Generators":[' , jsonencode(table(VBGnames,VG,Gstate,PowerG)) , "]}"]));
 msg = strjoin(string(["{",'"systemState":',systemState,',"generators":',generators,"}"]));
 publish(myMQTT, 'system-update', msg);

 Counter2 =0;
    end 

end

 
 
Counter2 = Counter2 +1;





FreqandVolt=1;



end