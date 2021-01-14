function [output] = Testmsg(topic,msg)
time =tic; 
global msgl
msgl =msg

 global relayA
 global relayB
 global relayC
 global relayAt
 global relayBt
 global relayCt
fprintf('%s\n',msg)
global relayAnames
global relayBnames
global relayCnames

relayAtest = [1,1,1,1,relayAt];
relayBtest = [1,1,1,1,relayBt];
relayCtest = [1,1,1,1,relayCt];
disp(msg)
try
    
msgp = parse_json(strip(convertStringsToChars(msg),'"'))
catch ME
    disp(ME)
    rethrow(ME)
end    
msgm = struct2cell(cell2mat(msgp))


if length(msgm)==4           %if there is a faliure in a relay 
    id = msgm(1);
    failure = msgm(4)
       failure_relay=[id;failure]; % sending falure to another function
        
else   
    

disp(21)
for i= 1:length(msgm)
    
    id = msgm(1);
    state = msgm(2);
    value = msgm(3);
    for j = 1:length(relayAnames)
         
        if strcmp(id,relayAnames(j))
            if strcmp(state,'true')
                relayAtest(j)=1;
                fprintf('processed');
            else
                relayAtest(j) = 0;
            end
        end
        
    end  
end
disp(40)
for i= 1:length(msgm)
    
    id = msgm(1);
    state = msgm(2);
    value = msgm(3);
    for j = 1:length(relayBnames)
         
        if strcmp(id,relayBnames(j))
            if strcmp(state,'true')
                fprintf('processed');
                relayBtest(j)=1;
            else
                relayBtest(j) = 0;
            end
        end
        
    end  
end
disp(60)

for i= 1:length(msgm)
    
    id = msgm(1);
    state = msgm(2);
    value = msgm(3);
    for j = 1:length(relayAnames)
         
        if strcmp(id,relayCnames(j))
            if strcmp(state,'true')
                relayCtest(j)=1;
            else
              relayCtest(j)=0;
            end
        end
        
    end  
end
disp(70)



for i=1:length(relayA)
    relayAt(i) = relayAtest(i+4);
    relayBt(i) = relayBtest(i+4);
    relayCt(i) = relayCtest(i+4);
    
end
disp(90)

 timeElapsed = toc(time) 


 end