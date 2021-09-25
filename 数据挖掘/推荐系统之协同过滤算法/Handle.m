%数据处理

for i=1:length(ID)
   NRules(i).name=name{i};
   NRules(i).id=ID(i);
end

save('NRules','NRules');