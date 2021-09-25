data_type   = 'MovieLens-100k';
LearnRate   = 0.05; 
noVis       = 1682; 
noHid       = [20, 50, 100 200];
% Scale       = 1; 

tColor      = {'r', 'g', 'b', 'k', 'm'};
tLegend     = cell(1); 
pr          = figure(1);
for i = 1:1:length(noHid)
    data = load(['Results\' data_type '_noVis' num2str(noVis) '_noHid' num2str(noHid(i)) ...
                '_LearnRate' num2str(LearnRate) '_.mat']); 
    plot(data.results.allErr, tColor{i}, 'LineWidth', 2); hold on; 
    tLegend{i} = ['noHid ' num2str(noHid(i))];
end;
title([data_type ', Learn rate ' num2str(LearnRate)]); hold off; 
% xlabel('epoch'); 
% ylabel('Error'); 
legend(tLegend);

saveas(pr, ['Results\' data_type '_Learnrate' num2str(LearnRate) '.png']); 