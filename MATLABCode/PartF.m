% If you have saved the FIS to a file
fis = readfis('C:\Users\Jo\Documents\MATLAB\Task D.fis');

% Load the input data
inputData = readmatrix('fuzzy_input_data.csv');

% Preallocate the array for output targets
numSamples = size(inputData, 1);
targets = zeros(numSamples, 1);

% Evaluate the FIS for each row of input data
for i = 1:numSamples
    % Assuming inputData contains Mean Delay, Number of Servers, and Repair Utilization Factor in this order
    targets(i) = evalfis(fis, inputData(i, :));
end

% Save the output data
writematrix(targets, 'fuzzy_output_targets.csv');
