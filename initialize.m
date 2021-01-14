function Initializaing() 

global myMQTT
global LoadA
global LoadB
global LoadC
global relayAstate
global relayBstate
global relayCstate
global relayAnames
global relayBnames
global relayCnames
 ValueLoad= string([22.5,12.5,21.5,12.5,LoadA]');
        relaynames = relayAnames;
        relaystate = relayAstate;
        for i = 1:10
           msgA = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'');
               publish(myMQTT, 'loads-control',  msgA )
        end
%         ValueLoad= string([22.5,12.5,21.5,12.5,LoadA]');
%         relaynames = relayAnames;
%         relaystate = relayAstate;
        
    
%         LoadAs =  strjoin(string(['{"LoadA":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
         ValueLoad= string([23.5,12,16,10,LoadB]');
        relaynames = relayBnames;
         relaystate = relayBstate;
         for i = 1:10
           msgB = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'');
               publish(myMQTT, 'loads-control',  msgB )
        end
%         LoadBs =  strjoin(string(['{"LoadB":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
        ValueLoad= string([20,11.5,15,10,LoadC]');
        relaynames = relayCnames;
         relaystate = relayCstate;
         for i = 1:10
           msgC = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'');
               publish(myMQTT, 'loads-control',  msgC )
        end
%       LoadCs =  strjoin(string(['{"LoadC":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
    
         
        
%           msg = strjoin(string(["{",'"LoadA":',LoadAs,',"LoadB":',LoadBs,',"LoadC":',LoadCs,"}"]));
        %    publish(myMQTT, 'loads-control',  msg );
           



end

