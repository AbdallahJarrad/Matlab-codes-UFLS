function testy1 = testy(u)
global myMQTT
global Load12
global relayA
global relayB
global relayC
global LoadsTrigger
global LoadA
global LoadB
global LoadC
global relayAstate
global relayBstate
global relayCstate
global relayAnames
global relayBnames
global relayCnames
global Counterloads
global Counterloads1
a = 0 ;
b = 0 ; 
c = 0 ;
if  LoadsTrigger == 1
for i = 1:length(relayA)
    if relayA(i) == 0 
        relayAstate(i+4)= "false";
        a =1;
    end
     if relayB(i) == 0 
        relayBstate(i+4)= "false";
        b =1; 
     end
     if relayC(i) == 0 
        relayCstate(i+4)= "false";
        c =1;
     end
     
      
     
end
LoadsTrigger =0;
end
% else
%     if Counterloads1 > 1000
%         ValueLoad= string([22.5,12.5,21.5,12.5,LoadA]');
%         relaynames = relayAnames;
%         relaystate = relayAstate;
%         for i = 1:10
%            msgA = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'')
%                publish(myMQTT, 'loads-control',  msgA )
%         end
% %         ValueLoad= string([22.5,12.5,21.5,12.5,LoadA]');
% %         relaynames = relayAnames;
% %         relaystate = relayAstate;
%         
%     
% %         LoadAs =  strjoin(string(['{"LoadA":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
% %         ValueLoad= string([23.5,12,16,10,LoadB]');
%         relaynames = relayBnames;
%          relaystate = relayBstate;
%          for i = 1:10
%            msgB = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'')
%                publish(myMQTT, 'loads-control',  msgB )
%         end
% %         LoadBs =  strjoin(string(['{"LoadB":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
% %         ValueLoad= string([20,11.5,15,10,LoadC]');
%         relaynames = relayCnames;
%          relaystate = relayCstate;
%          for i = 1:10
%            msgC = strjoin(string(['{"id":','"',relaynames(i),'"',',"state":"',relaystate(i),'","ValueLoad":"',ValueLoad(i),'"}']),'')
%                publish(myMQTT, 'loads-control',  msgC )
%         end
% %       LoadCs =  strjoin(string(['{"LoadC":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
%     
%          
%         
% %           msg = strjoin(string(["{",'"LoadA":',LoadAs,',"LoadB":',LoadBs,',"LoadC":',LoadCs,"}"]));
%         %    publish(myMQTT, 'loads-control',  msg );
%             Counterloads1=0;
%     end
    
    
  
    



    if a ==1 || b==1 || c==1
        ValueLoad= string([22.5,12.5,21.5,12.5,LoadA]');
        relaynames = relayAnames;
        relaystate = relayAstate;
        for i=1:length(relayA)
            if relayA(i) == 0
    
         msgA = strjoin(string(['{"id":','"',relaynames(i+4),'"',',"state":"',relaystate(i+4),'","ValueLoad":"',ValueLoad(i+4),'"}']),'');
             publish(myMQTT, 'loads-control',  msgA )
            end 
        end
            
        %LoadAs =  strjoin(string(['{"LoadA":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
        
        ValueLoad= string([23.5,12,16,10,LoadB]');
        relaynames = relayBnames;
         relaystate = relayBstate;
         for i=1:length(relayB)
              if relayB(i) == 0
              msgB = strjoin(string(['{"id":','"',relaynames(i+4),'"',',"state":"',relaystate(i+4),'","ValueLoad":"',ValueLoad(i+4),'"}']),'');
               publish(myMQTT, 'loads-control',  msgB )
              end
         end
         
             
             
        %LoadBs =  strjoin(string(['{"LoadB":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
        ValueLoad= string([20,11.5,15,10,LoadC]');
        relaynames = relayCnames;
         relaystate = relayCstate;
         for i=1:length(relayC)
             if relayC(i)==0
                 msgC = strjoin(string(['{"id":','"',relaynames(i+4),'"',',"state":"',relaystate(i+4),'","ValueLoad":"',ValueLoad(i+4),'"}']),'');
               publish(myMQTT, 'loads-control',  msgC )
             end
         end
         
%      % LoadCs =  strjoin(string(['{"LoadC":[',jsonencode(table(relaynames,relaystate,ValueLoad)),"]}"]));
%     
%          
%         
%           msg = strjoin(string(["{",'"LoadA":',LoadAs,',"LoadB":',LoadBs,',"LoadC":',LoadCs,"}"]));
%             publish(myMQTT, 'loads-control',  msg );
%            %publish(myMQTT, 'loads-control',  '{"id":"Loada1","state":"false"}' )
    end       


  

Counterloads1= Counterloads1+1;

if Counterloads1 == 1200
%Load12 = 45e6;
% for i = 1:length(relayA)
%     
%         relayAstate(i+4)= "false";
%         
%   
% end

end
testy1=[Load12,0];
end


 