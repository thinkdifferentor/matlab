function writeResults(file_name, noVis, noHid, learnRate, maxEpoch, test_ratio, trainError, ValidateError, TestError, noMiniBatch, ratio)

fid = fopen([file_name], 'a+');

fprintf(fid, '  %6.0f %6.0f %6.3f %6.3f %6.3f %6.0f %6.0f %6.5f %6.3f %6.3f %6.3f  ' , noVis, noMiniBatch, test_ratio, ratio, noHid, maxEpoch, ...
                                learnRate(1), trainError, ValidateError, TestError);
fprintf(fid, '\n');
fclose(fid);