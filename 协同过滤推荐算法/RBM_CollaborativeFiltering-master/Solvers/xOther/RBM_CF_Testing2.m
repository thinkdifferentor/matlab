%% 초기화 하자
function [out] = RBM_CF_Testing2(batchdata, visHid, hidBiases, visBiases, opts)
%% 실제 Restricted Boltzmann Machine을 training하�

[opts.numCases, opts.numDims, opts.numBatches] = size(batchdata);  

data = batchdata(:, :, :);               % Current test data
visBias = zeros(size(batchdata)); 
for i =1:1:5
    visBias(:, :, i) = repmat(visBiases(:, i)', opts.numCases, 1);    % bias matrix for all 100 test images
end
hidBias = repmat(hidBiases, opts.numCases, 1);

% calculate hidden layer
tmp  = 0;
for i = 1:1:5
    tmp = tmp + data(:, :, i) * opts.scale * visHid (:, :, i);
end;
posHidProbs = 1./ (1 + exp(-tmp - hidBias));  % The positive stage: why there is "2" here

% poshidstates = posHidProbs > rand(opts.numCases, opts.numhid);   % Gibb sampling
poshidstates = posHidProbs; 
% calculate the output  
negdata = zeros(size(data));
for i = 1:1:5
    negdata(:, :, i) = 1./(1 + exp(-poshidstates*visHid(:, :, i)' - visBias(:, :, i))); % negative data
end

out = zeros(size(negdata,1), size(negdata,2)); 
for i =1:1:5
    out = out + negdata(:, :, i) .* i; 
end

