function output = Controller(u)


global firstBus
global secondBus
global thirdBus
global VoltageAtload
global VoltageAtload1
global VoltageAtload2
global relayA
global relayB
global relayC
global relayAt
global relayBt
global relayCt
global LoadA
global LoadB
global LoadC
global LoadT
global testime
A = u(2);
Pestimated = u(1);











%%





%%LoadA
if   ( A==1 && Pestimated <= 62.5 && Pestimated >= 3 && firstBus == VoltageAtload)
   
   tic
Tstart = tic;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadA)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadA);
            d = abs(sum(Table_k,2) - Pestimated);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadA)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayA(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                  end
               end
               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(1)= tEnd;
end

                       
%%LoadB

                  if (A==1 && Pestimated <= 50 && firstBus == VoltageAtload1)
     tic
Tstart = tic;
   
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadB)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadB);
            d = abs(sum(Table_k,2) - Pestimated);
               LoadsToBeShed = Table_k(d == min(d),:)';
               for i=1:length(LoadB)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayB(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                
                  end
               end
                  tEnd = toc(Tstart);    
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(2)= tEnd;    
                  end
                  
                  %%LoadC
                   
                            if (A==1 && Pestimated <= 51 && firstBus == VoltageAtload2)
   
     tic
Tstart = tic;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadC)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadC);
            d = abs(sum(Table_k,2) - Pestimated);
               LoadsToBeShed = Table_k(d == min(d),:)';
               for i=1:length(LoadC)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayC(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                
                  end
               end
                   tEnd = toc(Tstart);    
                fprintf('Time spent in processing Loadc  %4.8f second\n',tEnd)
                TotalT(3)= tEnd;  
                            end
                            
                            
                            
                            
                      %% more than 62.5mw and less than 113.5 for load A Firstbus   
                            
                         if   ( A==1 && Pestimated > 62.5 && Pestimated< 113.5 && firstBus == VoltageAtload)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadA)
            
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                            
                              end
                              tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(4)= tEnd;
                
                        if   ( A==1 && Pestimated > 62.5 && Pestimated < 113.5 && secondBus == VoltageAtload1)
                              tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 62.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadB)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadB);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadB)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayB(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                
                  end
               end  
                     tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(5)= tEnd;
                        end  
                      
                        if   ( A==1 && Pestimated > 62.5 && Pestimated < 113.5 && secondBus == VoltageAtload2)
                             tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 62.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadC)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadC);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadC)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayC(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
               
                  end
               end
               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(6)= tEnd;
                        end
                            
                            
                            
                         end
                         
                         
                         
%% %% more than 50mw and less than 113.5 for load B Firstbus

                            
                            
                            if   ( A==1 && Pestimated > 50 && Pestimated< 113.5 && firstBus == VoltageAtload1)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadB)
            
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                             
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(7)= tEnd;
                              
                        if   ( A==1 && Pestimated > 50 && Pestimated < 113.5 && secondBus == VoltageAtload)
                             tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 50;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadA)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadA);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadA)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayA(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                   
                  end
               end
                     tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(8)= tEnd;
                        end
                      
                        if   ( A==1 && Pestimated > 50 && Pestimated < 113.5 && secondBus == VoltageAtload2)
                             tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 50;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadC)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadC);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadC)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayC(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                   
                  end
               end
               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(9)= tEnd;
                        end
                            
                            
                            
                         end
                            
                            
                            
                            
                            
                            
               %% for loads more than 51Mw and less than 113.5 for Loac C as a first bus
               
                            
                                
                            
                            if   ( A==1 && Pestimated > 50 && Pestimated< 113.5 && firstBus == VoltageAtload2)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadC)
            
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                           
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(10)= tEnd;
                              
                        if   ( A==1 && Pestimated > 50 && Pestimated < 113.5 && secondBus == VoltageAtload)
                             tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 50;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadA)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadA);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadA)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayA(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                 
                  end
               end
                tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(11)= tEnd;
                        end
                            
                      
                        if   ( A==1 && Pestimated > 50 && Pestimated < 113.5 && secondBus == VoltageAtload1)
                             tic
                              Tstart = tic;
                              Pestimated2= Pestimated - 50;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadB)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadB);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
              
               
               for i = 1:length(LoadB)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayB(i) = 0 ;
                 fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
           
                  end
               end
                tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(12)= tEnd;
                        end
                            
                            
                            
                        end
                           
                         
                       %% for loads more than 113.5Mw and less than 163.5Mw for A first bus 
                            
                            
                               if   ( A==1 && Pestimated >= 113.5 && Pestimated<= 163.5 && firstBus == VoltageAtload)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadA)
            
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                              end
                              tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(13)= tEnd;
                              if(secondBus == VoltageAtload1)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadB)
            
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(14)= tEnd;
                              end
                            
                              
                            if(secondBus == VoltageAtload2)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadC)
            
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(14)= tEnd;
                            end
                              
                            
                              if(thirdBus == VoltageAtload1)
                                   tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadB)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadB);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadB)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                 
                  end
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(16)= tEnd;
                              end
                         
                         if(thirdBus == VoltageAtload2)
                              tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadC)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadC);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadC)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                 
                  end
                              end
                tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(17)= tEnd;
                            
                            
                         end
                         
                              end
                         
                            
                            
                            
                            %% for loads more than 113.5Mw and less than 163.5Mw for B first bus 
                            
                            
                               if   ( A==1 && Pestimated >= 113.5 && Pestimated<= 163.5 && firstBus == VoltageAtload1)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadB)
            
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload1)
                              end
                             
                              if(secondBus == VoltageAtload)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadA)
            
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(18)= tEnd;
                              end
                            
                              
                            if(secondBus == VoltageAtload2)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadC)
            
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(19)= tEnd;
                            end
                              
                            
                              if(thirdBus == VoltageAtload)
                                   tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadA)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadA);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadA)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                 
                  end
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(20)= tEnd;
                              end
                         
                         if(thirdBus == VoltageAtload2)
                              tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadC)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadC);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadC)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                 
                  end
               end
                            
                     tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(21)= tEnd;        
                         end
                         
                              end
                            
                            
                             %% for loads more than 113.5Mw and less than 163.5Mw for C first bus 
                            
                            
                               if   ( A==1 && Pestimated >= 113.5 && Pestimated<= 163.5 && firstBus == VoltageAtload2)
                              tic
                              Tstart = tic;
                              for i = 1:length(LoadC)
            
                         relayC(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 8 its voltage %4.5f pu\n',i,LoadC(i),VoltageAtload2)
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadC  %4.8f second\n',tEnd)
                TotalT(22)= tEnd;
                             
                              if(secondBus == VoltageAtload)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadA)
            
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(23)= tEnd;
                              end
                            
                              
                            if(secondBus == VoltageAtload1)
                                   tic
                              Tstart = tic;
                            for i = 1:length(LoadB)
            
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload1)
                            end
                             tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(14)= tEnd;
                            end
                              
                            
                              if(thirdBus == VoltageAtload)
                                   tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadA)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadA);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadA)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayA(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 5 its voltage %4.5f pu\n',i,LoadA(i),VoltageAtload)
                 
                  end
                              end
                               tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadA  %4.8f second\n',tEnd)
                TotalT(24)= tEnd;
                              end
                         
                         if(thirdBus == VoltageAtload1)
                              tic
                              Tstart = tic;
                                  Pestimated2= Pestimated - 113.5;
        Table = dec2bin((0:bin2dec(sprintf('%d',ones(1,numel(LoadB)))))')-'0';
          Table_k = bsxfun(@times,Table,LoadB);
            d = abs(sum(Table_k,2) - Pestimated2);
               LoadsToBeShed = Table_k(d == min(d),:)';
               
                              for i = 1:length(LoadB)
                  if  LoadsToBeShed(i) == 0
                    else
                         relayB(i) = 0 ;
                         fprintf(' Load %4.0f, %4.2f MW of power has been disconnected on bus 6 its voltage %4.5f pu\n',i,LoadB(i),VoltageAtload2)
                 
                  end
               end
                     tEnd = toc(Tstart) ;   
                fprintf('Time spent in processing LoadB  %4.8f second\n',tEnd)
                TotalT(25)= tEnd;        
                            
                         end
                         
                              end
      
    %%
    
    if A == 1
        TotalT = sum(TotalT);
        LoadT = abs(sum((relayA.*LoadA ) - (LoadA)))+abs(sum((relayB.*LoadB ) - (LoadB)))+abs(sum((relayC.*LoadC ) - (LoadC)));
        
        fprintf('Total time spent by controller is %4.8f second\n',TotalT)
        fprintf('Total loads have been shed are %3.2f MW\n ',LoadT)
         
        
        
    end
         output=[relayA,relayB,relayC];              
end               
               