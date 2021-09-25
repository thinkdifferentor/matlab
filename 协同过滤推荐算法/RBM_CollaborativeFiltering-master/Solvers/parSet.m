function opts = parSet(numHid, learningRate, maxEpoch)
opts.numhid      = numHid;  % number of hidden unit 
opts.epoch       = 1;    
opts.maxepoch    = maxEpoch;

opts.epsilonW    = learningRate(1);     % Learning rate for weights
opts.epsilonVb   = learningRate(2);     % Learning rate for biases of visible units
opts.epsilonHb   = learningRate(3);     % Learning rate for biases of hidden units

opts.CD          = 1;        % the number of Contrastive Divergence, 
opts.weightCost  = 0.0005;    % Weight-decay (reducing overfitting) 
opts.initialMomentum  = 0.8; % Momentum to speed up learning 
opts.finalMomentum    = 0.9; % 
opts.rating_scale= 5; % around 5 percent 
opts.scale       = 1; 