% Load the input data and target data
inputData = readmatrix('fuzzy_input_data.csv');
targets = readmatrix('fuzzy_output_targets.csv');

% Combine input data and targets into a single matrix
fullData = [inputData, targets];

% Determine the number of samples
numSamples = size(fullData, 1);

% Define the size of the training set (e.g., 70% of the dataset)
trainSize = floor(0.7 * numSamples);

% Generate random indices for the training set
randIndices = randperm(numSamples);

% Split the dataset into training and testing sets using the indices
trainIndices = randIndices(1:trainSize);
testIndices = randIndices(trainSize+1:end);

% Create the training and testing sets
trainData = fullData(trainIndices, :);
testData = fullData(testIndices, :);

% Extract input features and targets from the training set
X_train = trainData(:, 1:end-1);  % all columns except the last one
y_train = trainData(:, end);      % only the last column

% Extract input features and targets from the testing set
X_test = testData(:, 1:end-1);    % all columns except the last one
y_test = testData(:, end);        % only the last column

% Optionally, save the split datasets to CSV files
writematrix(X_train, 'X_train.csv');
writematrix(y_train, 'y_train.csv');
writematrix(X_test, 'X_test.csv');
writematrix(y_test, 'y_test.csv');

% Verify the dimensions of the split datasets
disp(['Training set size: ', num2str(size(X_train, 1))]);
disp(['Testing set size: ', num2str(size(X_test, 1))]);
