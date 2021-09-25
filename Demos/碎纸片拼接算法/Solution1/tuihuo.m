
% Ä£ÄâÍË»ð
function [ output ] = tuihuo( chushijie,cellx )
%TUIHUO Summary of this function goes here
% Detailed explanation goes here
routes=chushijie;
temperature=100;
titer=1;
previous_cost=diffx(chushijie,cellx);
temperature_threshould=1;
time=0;

while (temperature > temperature_threshould&&time<1000)
    temp_jie=reorder_route(routes);
    current_cost=diffx(routes,cellx);
    diff=current_cost-previous_cost;
    
    if(diff<0||(rand<exp(-diff*10/(temperature))))
        routes=temp_jie;
        previous_cost=current_cost;
        titer=titer+1;
    end
    
    if titer>=10
        temperature=0.5*temperature;
        titer=0;
    end
    
    time=time+1;
end

drawcell(routes,cellx);
output=routes;

end