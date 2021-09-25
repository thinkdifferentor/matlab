%% �ʱ�ȭ ����
function [visHid, hidBiases, visBiases, allErr] = RBM_CF_Training_Batch(batchdata, opts)
%% ���� Restricted Boltzmann Machine�� training����

[opts.numCases, opts.numDims, opts.numBatches] = size(batchdata);  
% batchsize = 100;                        % the number of batches
% numdims  =  size(digitdata , 2);        % the number of pixels in a single batch
% numbatches = totnum / batchsize;        % the number of images(items) in a batch

% Initializing symmetric weights and biases.
visHid      = 0.001*randn(opts.numDims, opts.numhid, 5); % Weights
hidBiases   = zeros(1,opts.numhid);              % bias of didden layer
visBiases   = zeros(opts.numDims, 5);             % bias of visible layer    
posHidProbs = zeros(opts.numCases,opts.numhid);       % positive prob. of hidden units for all test images 
negHidProbs = zeros(opts.numCases,opts.numhid);       % negative prob. of hidden units for all test images
posProds    = zeros(opts.numDims,opts.numhid);        % positive probability. 
negProds    = zeros(opts.numDims,opts.numhid);
visHidInc   = zeros(opts.numDims,opts.numhid, 5);
hidBiasInc  = zeros(1,opts.numhid);
visBiasInc  = zeros(opts.numDims, 5);
batchPosHidProbs = zeros(opts.numCases, opts.numhid, opts.numBatches);

%% ������ RBM�� train����
% batchIndex = floor((numBatches-1)*rand())+1;
batchIndex = 1;   % fixed
ii = 1;

% figure(1);   % display the batch 101 (including 100 images). 
% dispims((batchdata(:, :, batchIndex))',28,28); title(sprintf('%dth batch raw data ', epoch, batchIndex)); 
            
for epoch = 1:opts.maxepoch
    errsum = 0;
    
    % 1. ��ü batch�� ���ؼ�
    %for batch = 1 : numBatches,            
    
    % 2. ���� �׽�Ʈ�� ���ؼ� �� batch�� ���ؼ�
    for batch = 1 : size(batchdata, 4)     
        
        % ��� batch�� ���ؼ�, (�� batch�� 100���� image�� �̷����ִ�.)
        %fprintf(1,'epoch %  d batch %d \r\n', epoch, batch);
        data = batchdata(:, :, :, batch); 
        
        % �ϳ��� batch�� �ѹ��� ó���ϱ� ���ؼ� bias�� repmat
        visBias = zeros(size(data)); 
        for i =1:1:5
            visBias(:, :, i) = repmat(visBiases(:, i)', opts.numCases, 1);    % bias matrix for all 100 test images
        end
        hidBias = repmat(hidBiases, opts.numCases, 1);    % bias matrix for all 100 test images

        %%%%%%%%% START POSITIVE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % 1. batch �߿��� �츮�� ����� data�� �о�´�. 100���� digit���� �̷����ִ�. 
                      % Current test data      
        % get this index's batch data(100���� digit�� ����)
        % �� data�� numCases, �� 100���� digit ������ ������ �ִ�. �� ������ 0~1������ ���̰�,
        % RBM�� binary�� ó���� �� �־ �̷��� ��ƾ�� �ִ� �� ����.
        data = data > rand(opts.numCases, opts.numDims, opts.rating_scale);       % Converse data to binary format    
        % �� ���� 0�Ǵ� 1�� �ٲ۴�.
        
        % 2. positive state���� �� batch�� Ư�� hidden node�� 1�� �� Ȯ���� �ǹ��Ѵ�. 
        tmp  = 0; 
        for i = 1:1:5            
            tmp = tmp + data(:, :, i) * opts.scale * visHid (:, :, i); 
        end;
        posHidProbs = 1./ (1 + exp(-tmp - hidBias));  % The positive stage: why there is "2" here 
        % posHidProbs�� R[numCases*numhid]�� ������ ���� �ִ�.
        % i��° ���� ���� batch�� i��° item�� �ǹ��ϰ�,
        % j��° ���� �ش� item�� j��° hidden node�� 1�� �� Ȯ���� �ǹ��Ѵ�.

        % 3. ��� batch�� ���ؼ� positive state���� hidden node�� 1�� �� Ȯ���� �����Ѵ�. 
        batchPosHidProbs(:, :, batchIndex) = posHidProbs;    % storage hidden prob. of current patch
        % batchPosHidProbs�� R[nunCases*numhid*numBatches]�� ũ�⸦ ���´�.
        % ���� �� loop�� �� batch���� �ѹ��� �����µ� �̸� �� ������ �ϰ�, batchPosHidProbs�� ���⼱ �Ⱦ��δ�.

        % 4. data�� ��� 
        posProds    = zeros(size(visHid));              % Averaging of each probability  
        for i = 1:1:5
            posProds(:, :, i)    = data(:, :, i)' * posHidProbs; 
        end;
        % posProds�� R[numDims, numhid]�� ũ�⸦ ���´�.
        % ���� batch���� ��� data�� �� dimension�� ���� expectation?
        % �ڿ��� numCases�� �������� data�� ����� ���Ѵ�. 

        % 5. positve phase���� hidden node�� ��밪�� ��Ÿ����. 
        poshidact   = sum(posHidProbs);
        % poshidact�� R[numhid]�� ũ�⸦ ���´�.
        % �� item�� �ڿ��� numCases�� �������� ���� batch�� �� hidden node�� ��밪�� ��Ÿ����.

        % 6. positve phase���� visible node�� ��밪�� ��Ÿ����. 
        posvisact   = reshape(sum(data, 1), opts.numDims, opts.rating_scale);
        % poshidact�� R[numDims]�� ũ�⸦ ���´�., 5)
        % �� item�� �ڿ��� numCases�� �������� ���� batch�� �� visible node�� ��밪�� ��Ÿ����.
        %%%%%%%%% END OF POSITIVE PHASE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



        %%%%% START NEGATIVE PHASE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        poshidstates = posHidProbs > rand(opts.numCases, opts.numhid);   % Gibb sampling
        % posHidProbs �տ��� ���� ���� batch�� �� case���� �� hidden node�� 1�� �� Ȯ���̴�.
        % poshidstates�� RBM�� binary�� ������ ���ؼ� �̸� 1�Ǵ� 0���� �ٲ۴�.
        negdata = zeros(size(data)); 
        for i = 1:1:5
            negdata(:, :, i) = 1./(1 + exp(-poshidstates*visHid(:, :, i)' - visBias(:, :, i))); % negative data 
        end
        % negdata�� �ռ� positive phase���� ���� hid node�� (1 if Ȯ��>rand)�� ���� ���� ���� �ִ� 
        % visHid, �� vis�� hid�� �����ϴ� weight�� ���ؼ� �ᱹ neg phase���� vis�� 1�̵� Ȯ���� �ǹ��Ѵ�. 
        
        if rem(epoch, 10) == 1 && batch == batchIndex
            ii  = ii + 1;
            % raw data (batch)
            %figure(1);
            %dispims((batchdata(:, :, batch))',28,28); title(sprintf('[%dth epoch] %dth batch raw data ', epoch, batch)); drawnow; 
            
            % negative phase���� ���� image -
%             figure(2); 
%             dispims(negdata',28,28); title(sprintf('[%dth epoch] %dth batch negative phase data', epoch, batch)); drawnow; 
%             drawnow;
%             pause(.01);
        end
        
        negdata = negdata > rand(opts.numCases, opts.numDims, opts.rating_scale);
        % RBM�� binary data�ۿ� �� �� ����. �� neg phase���� vis data�� �ǹ��Ѵ�. 
        tmp = zeros(size(hidBias)); 
        for i = 1:1:5
            tmp = tmp + negdata(:, :, i)*(opts.scale *visHid(:, :, i));
        end 
        negHidProbs = 1./(1 + exp(-tmp - hidBias));
        % negHidProbs �� ���� batch���� �� data�� ���ؼ� �� hidden node���� Ȯ���� ��Ÿ����.
        
        negProbs    = zeros(size(posProds)); 
        for i = 1:1:5
            negProds(:, :, i)  = negdata(:, :, i)'*negHidProbs;
        end
        % negProds�� R[784*50]�� ũ�⸦ ���´�.
        % �� ���� batch�� ���ؼ� vis�� hid�� �����ϴ� weight�� �ǹ�? 
        
        neghidact = sum(negHidProbs);
        % neghidact R[numhid]�� ũ�⸦ ���´�.
        % �� item�� �ڿ��� numCases�� �������� ���� batch�� �� hidden node�� ��밪�� ��Ÿ����.
        
        negvisact = reshape(sum(negdata, 1), opts.numDims, opts.rating_scale); 
        % negvisact R[numDims]�� ũ�⸦ ���´�.
        % �� item�� �ڿ��� numCases�� �������� ���� batch�� �� visible node�� ��밪�� ��Ÿ����.
        %%%%%%%%% END OF NEGATIVE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        err= sqrt(sum(sum( (data(:) - negdata(:)).^2 )) / length(data(:)));
        errsum = err + errsum; % �� errsum�� batch���� �ʱ�ȭ �ȴ�. �� ���� batch�� �� ������ �ǹ� 
        if epoch > 5  
            momentum = opts.finalMomentum;
        else
            momentum = opts.initialMomentum;
        end;

        %%%%%%%%% UPDATE WEIGHTS AND BIASES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % inc�� ����Ѵ�. E[pos]-E[neg] 
        visHidInc = momentum*visHidInc + ...
            opts.epsilonW*( (posProds-negProds)/opts.numCases - opts.weightCost*visHid ) ;
        visBiasInc = momentum*visBiasInc + (opts.epsilonVb/opts.numCases)*(posvisact - negvisact);
        hidBiasInc = momentum*hidBiasInc + (opts.epsilonHb/opts.numCases)*(poshidact - neghidact);
        
        % ���� update �κ� 
        visHid = visHid + visHidInc;
        visBiases = visBiases + visBiasInc;
        hidBiases = hidBiases + hidBiasInc;
        %%%%%%%%%%%%%%%% END OF UPDATES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
    allErr(epoch) = errsum; 
    fprintf(1, 'epoch %4i error %6.3f  \r\n', epoch, errsum);
    
    results.visHid      = visHid; 
    results.visBiases   = visBiases; 
    results.hidBias     = hidBiases;
    results.allErr      = allErr;     
end;
%plot(allErr); grid on; 
%% ������ RBM�� test�غ��� 


% 1. ���� �׽�Ʈ�� ���� random�ϰ� data�� �����´�. 
%batchIndex = floor((numBatches-1)*rand())+1;
%fprintf(' %d th batch\r\n', batchIndex);
%data = batchdata(:, :, batchIndex); 

% % 2. �� data�� noise�� ���´�.
% data_with_noise = data + 0.1*randn(numCases, numDims);
% 
% %. 3. RBM���� hidden node�� ���ٰ� �ٽ� visible�� ����. 
% data2 = data_with_noise > rand(numCases, numDims);      % �� ���� 0�Ǵ� 1�� �ٲ۴�.
% posHidProbs = 1./ (1 + exp(-data2*(2*visHid) - hidBias)); 
% poshidstates = posHidProbs > rand(numCases,numhid);
% negdata = 1./(1 + exp(-poshidstates*visHid' - visBias));
% negdata = negdata > rand(numCases, numDims);

% 4. ����� plot�Ѵ�. 
% figure(1); dispims( (batchdata(:, :, batchIndex))', 28, 28); title(sprintf('1. raw data')); 
% figure(2); dispims( data2', 28, 28); title(sprintf('2. data with noise')); 
% figure(3); dispims( negdata', 28, 28); title('3. RBM result'); 






