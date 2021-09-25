clear all; clc; 
data_type = 'ml-1m';
ratio     = [0.7 0.15]; 
sizeMiniBatch = 1/40; 
[train_data, validate_data, test_data, opts] = getData_miniBatch(data_type, ratio, sizeMiniBatch);