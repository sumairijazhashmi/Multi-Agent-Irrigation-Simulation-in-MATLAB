%%% PROJECT 3 - Irrigation games
%%% Submitted by: 
%%% Sumair Ijaz Hashmi 24100004
%%% Muawiz Khan Feroze 24100052
%%% Muhammad Haris Saad 24100055 

%% LAB 1 - TASK 1
clc;
clear all;
close all;

moisture_decay_rate = [0.005,0.07,0.05,0.02];
ydecay_rate = [ 0.09,0.05,0.07,0.1];
Moist_min = 0.1;
Moist_max = 0.8;
Moist_ini = 0.5;
num_days = 7*16; 
    
rain_prob = 0.02;   
R = full(sprand(1,num_days,rain_prob)); 
    
I_total = 0.5;
Inlet_size = 0.2;
water_delay = 21; 
     
I = zeros(1,num_days);
I(1) = I_total; 

for farmer = 1:4
 
    M = zeros(1,num_days);
    M(1) = Moist_ini;
    Yield_max = 100;
    Y = zeros(1,num_days);
    Y(1) = Yield_max;


    s = get(0, 'ScreenSize');
    figure('Position', [0 0 s(3) s(4)]);
    subplot(4,1,1); plot([1:num_days],Moist_min*ones(1,num_days),'.');
    hold on
    subplot(4,1,1); plot([1:num_days],Moist_max*ones(1,num_days),'.');
    axis([1 num_days 0 1.2])


    for t = 1:1:num_days
        
        dec_moisture = M(t)*moisture_decay_rate(farmer);  
        M(t+1) = M(t) - dec_moisture + R(t); 
        
        if (M(t) < Moist_min || M(t) > Moist_max) 
            Y(t+1) = Y(t) - Y(t)*ydecay_rate(farmer);
        else 
            Y(t+1) = Y(t);
        end

        subplot(4,1,1); plot(1:t,M(1:t),'*m-'); hold on;
        axis([1 num_days 0 1.6])
        subplot(4,1,2); stem(1:t,R(1:t),'r'); hold on;
        axis([1 num_days 0 1.2])
        subplot(4,1,3); plot(1:t,I(1:t),'bo-'); hold on;
        axis([1 num_days 0 1.2])
        subplot(4,1,4); plot(1:t,Y(1:t),'*g-'); hold on;
        subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'g.');
        axis([1 num_days 0 Yield_max*1.2]) 
        pause(0.5);   
    end
end

%% LAB 1 - TASK 2

clc;
clear all;
close all;

dec_rate = [0.005,0.07,0.05,0.02];
ydecay_rate = [0.09,0.05,0.07,0.1];
Moist_min = 0.1;
Moist_max = 0.8;
Moist_ini = 0.5;
num_days = 7*16; 

M_1 = zeros(1,num_days);
M_1(1) = Moist_ini;

M_2 = zeros(1,num_days);
M_2(1) = Moist_ini;

M_3 = zeros(1,num_days);
M_3(1) = Moist_ini;

M_4 = zeros(1,num_days);
M_4(1) = Moist_ini;

rain_prob = 0.02;   
R = full(sprand(1,num_days,rain_prob)); 
I_total = 2;
Inlet_size = 0.2;

I = zeros(1,num_days);
I(1) = I_total;

s = get(0, 'ScreenSize'); 
figure('Position', [0 0 s(3) s(4)]); 
subplot(4,1,1); plot([1:num_days],Moist_min*ones(1,num_days),'.');
hold on
subplot(4,1,1); plot([1:num_days],Moist_max*ones(1,num_days),'.');
axis([1 num_days 0 1.2]) 
       
Yield_max = 100;
            
Y_1 = zeros(1,num_days);
Y_1(1) = Yield_max;

Y_2 = zeros(1,num_days);
Y_2(1) = Yield_max;

Y_3 = zeros(1,num_days);
Y_3(1) = Yield_max;

Y_4 = zeros(1,num_days);
Y_4(1) = Yield_max;

for t=1:1:num_days
    
    subplot(4,1,2); stem(1:t,R(1:t),'r'); hold on;
    axis([1 num_days 0 1.2])
     
    for farmer=1:1:4
        if (farmer == 1)
                
                dec_moisture = M_1(t)*dec_rate(farmer);
                M_1(t+1) = M_1(t) - dec_moisture + R(t);
                
                if((t==1 || t==21 || t==42 || t==63 || t==84 || t==105) && I(t) > 0) 
                    water_input = min(Inlet_size, I(t));
                    M_1(t+1) = M_1(t+1) + water_input;
                    I(t) = I(t) - water_input;  
                end
                I(t+1) = I(t);
                if (M_1(t) < Moist_min || M_1(t) > Moist_max) 
                    Y_1(t+1) = Y_1(t) - Y_1(t)*ydecay_rate(farmer);
                else 
                    Y_1(t+1) = Y_1(t);
                end
                 
                subplot(4,1,1); plot(1:t,M_1(1:t),'*k-'); hold on;
                axis([1 num_days 0 1.2])
                legend('min M','max M','farmer 1','farmer 2','farmer 3', 'farmer 4');
                subplot(4,1,4); plot(1:t,Y_1(1:t),'*k-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
                
        if (farmer == 2)
            
                dec_moisture = M_2(t)*dec_rate(farmer);
                M_2(t+1) = M_2(t) - dec_moisture + R(t);
                
                if((t==2 || t==22 || t==43 || t==64 || t==85 || t==106) && I(t) > 0)
                    water_input = min(Inlet_size, I(t));
                    M_2(t+1) = M_2(t+1) + water_input;
                    I(t) = I(t) - water_input;
                    
                end
                I(t+1) = I(t);
                
                if (M_2(t) < Moist_min || M_2(t) > Moist_max) 
                    Y_2(t+1) = Y_2(t) - Y_2(t)*ydecay_rate(farmer);
                else 
                    Y_2(t+1) = Y_2(t);
                end
                
                subplot(4,1,1); plot(1:t,M_2(1:t),'*g-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_2(1:t),'*g-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
                
        if (farmer == 3)
            
                dec_moisture = M_3(t)*dec_rate(farmer);
                M_3(t+1) = M_3(t) - dec_moisture + R(t);
                
                if((t==3 || t==23 || t==44 || t==65 || t==86 || t==107) && I(t) > 0)
                    water_input = min(Inlet_size, I(t));
                    M_3(t+1) = M_3(t+1) + water_input;
                    I(t) = I(t) - water_input;
                end
                I(t+1) = I(t);
                if (M_3(t) < Moist_min || M_3(t) > Moist_max) 
                    Y_3(t+1) = Y_3(t) - Y_3(t)*ydecay_rate(farmer);
                else 
                    Y_3(t+1) = Y_3(t);
                end
                
                subplot(4,1,1); plot(1:t,M_3(1:t),'*m-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_3(1:t),'*m-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
                
        if (farmer == 4)
                
                dec_moisture = M_4(t)*dec_rate(farmer);
                M_4(t+1) = M_4(t) - dec_moisture + R(t);
                
                if((t==4 || t==24 || t==45 || t==66 || t==87 || t==108) && I(t) > 0) 
                    water_input = min(Inlet_size, I(t));
                    M_4(t+1) = M_4(t+1) + water_input;
                    I(t) = I(t) - water_input;
               
                end
                I(t+1) = I(t);
                if (M_4(t) < Moist_min || M_4(t) > Moist_max) 
                    Y_4(t+1) = Y_4(t) - Y_4(t)*ydecay_rate(farmer);
                else 
                    Y_4(t+1) = Y_4(t);
                end  
                
                subplot(4,1,1); plot(1:t,M_4(1:t),'*c-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_4(1:t),'*c-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
        
    end
    subplot(4,1,3); plot(1:t,I(1:t),'bo-'); hold on;
    axis([1 num_days 0 2])
    pause(0.75);
    
end

%% LAB 2 - TASK 1
clc;
clear all;
close all;

dec_rate = [0.005,0.07,0.05,0.02];
ydecay_rate = [0.09,0.05,0.07,0.1];
Moist_min = 0.1;
Moist_max = 0.8;
Moist_ini = 0.5;
num_days = 7*16; 

M_1 = zeros(1,num_days);
M_1(1) = Moist_ini;

M_2 = zeros(1,num_days);
M_2(1) = Moist_ini;

M_3 = zeros(1,num_days);
M_3(1) = Moist_ini;

M_4 = zeros(1,num_days);
M_4(1) = Moist_ini;

m_acceptable = 0.3;

rain_prob = 0;   
R = full(sprand(1,num_days,rain_prob)); 
I_total = 2;
Inlet_size = 0.2;

total_farmers = 4;

I = zeros(1,num_days);
I(1) = I_total;

s = get(0, 'ScreenSize'); 
figure('Position', [0 0 s(3) s(4)]); 
subplot(4,1,1); plot([1:num_days],Moist_min*ones(1,num_days),'.');
hold on
subplot(4,1,1); plot([1:num_days],Moist_max*ones(1,num_days),'.');
axis([1 num_days 0 1.2]) 
       
Yield_max = 100;
            
Y_1 = zeros(1,num_days);
Y_1(1) = Yield_max;

Y_2 = zeros(1,num_days);
Y_2(1) = Yield_max;

Y_3 = zeros(1,num_days);
Y_3(1) = Yield_max;

Y_4 = zeros(1,num_days);
Y_4(1) = Yield_max;

water_delay = 7;
last_day = 69;  


for t=1:1:num_days
    
    subplot(4,1,2); stem(1:t,R(1:t),'r'); hold on;
    axis([1 num_days 0 1.2])  
    
   
    for farmer=1:1:4
        if (farmer == 1)
                
                dec_moisture = M_1(t)*dec_rate(farmer);
                M_1(t+1) = M_1(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && I(t) > 0 && (minimum == M_1(t-1) && minimum <= m_acceptable )) 
                    water_input = min(Inlet_size, I(t));
                    M_1(t+1) = M_1(t+1) + water_input;
                    I(t) = I(t) - water_input;  
                end
                I(t+1) = I(t);
                if (M_1(t) < Moist_min || M_1(t) > Moist_max) 
                    Y_1(t+1) = Y_1(t) - Y_1(t)*ydecay_rate(farmer);
                else 
                    Y_1(t+1) = Y_1(t);
                end
                 
                subplot(4,1,1); plot(1:t,M_1(1:t),'*k-'); hold on;
                axis([1 num_days 0 1.2])
                legend('min M','max M','farmer 1','farmer 2','farmer 3', 'farmer 4');
                subplot(4,1,4); plot(1:t,Y_1(1:t),'*k-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
               
                
        if (farmer == 2)
            
                dec_moisture = M_2(t)*dec_rate(farmer);
                M_2(t+1) = M_2(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && I(t) > 0 && (minimum == M_2(t-1) && minimum <= m_acceptable ))
                    water_input = min(Inlet_size, I(t));
                    M_2(t+1) = M_2(t+1) + water_input;
                    I(t) = I(t) - water_input;
                    
                end
                I(t+1) = I(t);
                
                if (M_2(t) < Moist_min || M_2(t) > Moist_max) 
                    Y_2(t+1) = Y_2(t) - Y_2(t)*ydecay_rate(farmer);
                else 
                    Y_2(t+1) = Y_2(t);
                end
                
                subplot(4,1,1); plot(1:t,M_2(1:t),'*g-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_2(1:t),'*g-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
                
              
                
        if (farmer == 3)
            
                dec_moisture = M_3(t)*dec_rate(farmer);
                M_3(t+1) = M_3(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && I(t) > 0 && (minimum == M_3(t-1) && minimum <= m_acceptable ))  
                    water_input = min(Inlet_size, I(t));
                    M_3(t+1) = M_3(t+1) + water_input;
                    I(t) = I(t) - water_input;
                end
                I(t+1) = I(t);
                if (M_3(t) < Moist_min || M_3(t) > Moist_max) 
                    Y_3(t+1) = Y_3(t) - Y_3(t)*ydecay_rate(farmer);
                else 
                    Y_3(t+1) = Y_3(t);
                end
                
                subplot(4,1,1); plot(1:t,M_3(1:t),'*m-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_3(1:t),'*m-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
        end
           
                
                
        if (farmer == 4)
                
                dec_moisture = M_4(t)*dec_rate(farmer);
                M_4(t+1) = M_4(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && I(t) > 0 && (minimum == M_4(t-1) && minimum <= m_acceptable ))
                    water_input = min(Inlet_size, I(t));
                    M_4(t+1) = M_4(t+1) + water_input;
                    I(t) = I(t) - water_input;
               
                end
                I(t+1) = I(t);
                if (M_4(t) < Moist_min || M_4(t) > Moist_max) 
                    Y_4(t+1) = Y_4(t) - Y_4(t)*ydecay_rate(farmer);
                else 
                    Y_4(t+1) = Y_4(t);
                end  
                
                subplot(4,1,1); plot(1:t,M_4(1:t),'*c-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_4(1:t),'*c-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                
               
        end
        
    end
    subplot(4,1,3); plot(1:t,I(1:t),'bo-'); hold on;
    axis([1 num_days 0 2])
    pause(0.9);
    MM = [M_1(t), M_2(t), M_3(t), M_4(t)];
    minimum = MM(1);
    for i = 2 : 4
        if MM(i) < minimum
            minimum = MM(i);
        end
    end
end
%% LAB 2 - TASK 2

clc;
clear all;
close all;

dec_rate = [0.005,0.07,0.05,0.02];
ydecay_rate = [0.09,0.05,0.07,0.1];
Moist_min = 0.1;
Moist_max = 0.8;
Moist_ini = 0.5;
num_days = 7*16; 

M_1 = zeros(1,num_days);
M_1(1) = Moist_ini;

M_2 = zeros(1,num_days);
M_2(1) = Moist_ini;

M_3 = zeros(1,num_days);
M_3(1) = Moist_ini;

M_4 = zeros(1,num_days);
M_4(1) = Moist_ini;

rain_prob = 0;   
R = full(sprand(1,num_days,rain_prob)); 

s = get(0, 'ScreenSize'); 
figure('Position', [0 0 s(3) s(4)]); 
subplot(4,1,1); plot([1:num_days],Moist_min*ones(1,num_days),'.');
hold on
subplot(4,1,1); plot([1:num_days],Moist_max*ones(1,num_days),'.');
axis([1 num_days 0 1.2]) 
       
Yield_max = 100;
            
Y_1 = zeros(1,num_days);
Y_1(1) = Yield_max;

Y_2 = zeros(1,num_days);
Y_2(1) = Yield_max;

Y_3 = zeros(1,num_days);
Y_3(1) = Yield_max;

Y_4 = zeros(1,num_days);
Y_4(1) = Yield_max;

water_delay = 7;
last_day = 69;  

price_water = 1;
total_water_1 = zeros(1,num_days);
total_water_2 = zeros(1,num_days);
total_water_3 = zeros(1,num_days);
total_water_4 = zeros(1,num_days);

min_m = 0.25; 


for t=1:1:num_days
    
    subplot(4,1,2); stem(1:t,R(1:t),'r'); hold on;
    axis([1 num_days 0 1.2])  
    
   
    for farmer=1:1:4
        if (farmer == 1)
                
                dec_moisture = M_1(t)*dec_rate(farmer);
                M_1(t+1) = M_1(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && M_1(t-1) <= min_m)
                    water_input = dec_rate(1)*water_delay;
                    total_water_1(t) = total_water_1(t) + water_input;
                    M_1(t+1) = M_1(t+1) + water_input;
                end
                total_water_1(t+1) = total_water_1(t);
                if (M_1(t) < Moist_min || M_1(t) > Moist_max) 
                    Y_1(t+1) = Y_1(t) - Y_1(t)*ydecay_rate(farmer);
                else 
                    Y_1(t+1) = Y_1(t);
                end
                 
                subplot(4,1,1); plot(1:t,M_1(1:t),'*k-'); hold on;
                axis([1 num_days 0 1.2])
                legend('min M','max M','farmer 1','farmer 2','farmer 3', 'farmer 4');
                subplot(4,1,4); plot(1:t,Y_1(1:t),'*k-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                subplot(4,1,3); plot(1:t,total_water_1(1:t),'ko-'); hold on;
                axis([1 num_days 0 2])
        end
                
        if (farmer == 2)
            
                dec_moisture = M_2(t)*dec_rate(farmer);
                M_2(t+1) = M_2(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && M_2(t-1) <= min_m)
                    water_input = dec_rate(2)*water_delay;
                    total_water_2(t) = total_water_2(t) + water_input;
                    M_2(t+1) = M_2(t+1) + water_input;
                end
                total_water_2(t+1) = total_water_2(t);
                if (M_2(t) < Moist_min || M_2(t) > Moist_max) 
                    Y_2(t+1) = Y_2(t) - Y_2(t)*ydecay_rate(farmer);
                else 
                    Y_2(t+1) = Y_2(t);
                end
                
                subplot(4,1,1); plot(1:t,M_2(1:t),'*g-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_2(1:t),'*g-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                subplot(4,1,3); plot(1:t,total_water_2(1:t),'go-'); hold on;
                axis([1 num_days 0 2])
        end
                
        if (farmer == 3)
            
                dec_moisture = M_3(t)*dec_rate(farmer);
                M_3(t+1) = M_3(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && M_3(t-1) <= min_m)
                    water_input = dec_rate(3)*water_delay;
                    total_water_3(t) = total_water_3(t) + water_input;
                    M_3(t+1) = M_3(t+1) + water_input;
                end
                total_water_3(t+1) = total_water_3(t);
                if (M_3(t) < Moist_min || M_3(t) > Moist_max) 
                    Y_3(t+1) = Y_3(t) - Y_3(t)*ydecay_rate(farmer);
                else 
                    Y_3(t+1) = Y_3(t);
                end
                
                subplot(4,1,1); plot(1:t,M_3(1:t),'*m-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_3(1:t),'*m-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                subplot(4,1,3); plot(1:t,total_water_3(1:t),'mo-'); hold on;
                 axis([1 num_days 0 2])
        end
                
        if (farmer == 4)
                
                dec_moisture = M_4(t)*dec_rate(farmer);
                M_4(t+1) = M_4(t) - dec_moisture + R(t);
                
                if(mod(t,water_delay) == 0 && M_4(t-1) <= min_m)
                    water_input = dec_rate(4)*water_delay;
                    total_water_4(t) = total_water_4(t) + water_input;
                    M_4(t+1) = M_4(t+1) + water_input;
                end
                total_water_4(t+1) = total_water_4(t);
                if (M_4(t) < Moist_min || M_4(t) > Moist_max) 
                    Y_4(t+1) = Y_4(t) - Y_4(t)*ydecay_rate(farmer);
                else 
                    Y_4(t+1) = Y_4(t);
                end  
                
                subplot(4,1,1); plot(1:t,M_4(1:t),'*c-'); hold on;
                axis([1 num_days 0 1.2])
                subplot(4,1,4); plot(1:t,Y_4(1:t),'*c-'); hold on;
                subplot(4,1,4); plot([1:num_days],Yield_max*ones(1,num_days),'k.');
                axis([1 num_days 0 Yield_max*1.2])
                subplot(4,1,3); plot(1:t,total_water_4(1:t),'co-'); hold on;
                axis([1 num_days 0 2])        
        end
    end 
   pause(0.9);    
end

Farmer1_profit = Y_1(num_days) - total_water_1(num_days)* price_water
Farmer2_profit = Y_2(num_days) - total_water_2(num_days)* price_water
Farmer3_profit = Y_3(num_days) - total_water_3(num_days)* price_water
Farmer4_profit = Y_4(num_days) - total_water_4(num_days)* price_water
