data30  = [%  noVis   nBat  ratio         rating   noHid     itr rW       trErr  VaErr  testErr   
    1682      1  0.800  0.100  0.200     30     20 0.00150  0.692  1.884  1.833  
    1682      1  0.800  0.100  0.200     30     40 0.00150  0.666  1.843  1.819  
    1682      1  0.800  0.100  0.200     30     60 0.00150  0.635  1.856  1.774  
    1682      1  0.800  0.100  0.200     30     80 0.00150  0.598  1.811  1.771  
    1682      1  0.800  0.100  0.200     30    100 0.00150  0.560  1.800  1.781  
    1682      1  0.800  0.100  0.200     30    120 0.00150  0.523  1.810  1.758  
    1682      1  0.800  0.100  0.200     30    140 0.00150  0.490  1.824  1.817  
    1682      1  0.800  0.100  0.200     30    160 0.00150  0.459  1.835  1.836  
    1682      1  0.800  0.100  0.200     30    180 0.00150  0.433  1.825  1.845  
    1682      1  0.800  0.100  0.200     30    200 0.00150  0.409  1.918  1.879  ];

plot(data30(:, 7), data30(:, 9), 'r', 'LineWidth', 2); hold on; 
plot(data30(:, 7), data30(:, 10), 'g', 'LineWidth', 2);  
plot(data30(:, 7), data30(:, 11), 'b', 'LineWidth', 2); hold off; grid on; 
legend('Training', 'Validating', 'Testing');