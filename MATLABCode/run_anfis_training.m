% Combine input and output data for training
trainingData = [X_train y_train];


% Training options setup
trainingOptions = anfisOptions('InitialFIS', initialFis, 'EpochNumber', 100, 'DisplayANFISInformation', true, 'DisplayErrorValues', true);

% Train ANFIS with the correct number of outputs
% Since we're not using validation data, specify three output arguments
[trainedFis, trainError, stepSize] = anfis(trainingData, trainingOptions);

% Plot the membership functions of the trained FIS
figure;
for i = 1:numel(trainedFis.Inputs)
    subplot(numel(trainedFis.Inputs), 1, i);
    plotmf(trainedFis, 'input', i);
end

% Plot the training error curve
figure;
plot(trainError, 'LineWidth', 2);
title('Training Error');
xlabel('Epochs');
ylabel('Root Mean Squared Error');

% Optionally, save the trained FIS
writeFIS(trainedFis, 'trainedANFIS.fis');

%%
% 5.
% Load the test data
X_test = readmatrix('X_test.csv');
y_test_real = readmatrix('y_test.csv');

% Evaluate the trained FIS with the test data
y_test_pred = evalfis(trainedFis, X_test);

% Optionally, save the predicted test targets
writematrix(y_test_pred, 'fuzzy_test_predictions.csv');

%%
% 6.
% Calculate the errors
errors = y_test_pred - y_test_real;

% Mean Squared Error (MSE) and Root Mean Squared Error (RMSE)
mse = mean(errors.^2);
rmse = sqrt(mse);

% Mean and Standard Deviation
mean_error = mean(errors);
std_error = std(errors);

% Display the error metrics
disp(['MSE: ', num2str(mse)]);
disp(['RMSE: ', num2str(rmse)]);
disp(['Mean Error: ', num2str(mean_error)]);
disp(['Standard Deviation of Error: ', num2str(std_error)]);

%% 
% 7.
% Plot actual vs. predicted values
figure;
plot(y_test_real, 'o');
hold on;
plot(y_test_pred, 'x');
hold off;
legend('Actual', 'Predicted');
title('Comparison of Actual and Predicted Values');
xlabel('Sample Index');
ylabel('Number of Spares');

%%
% 8.
% Load the original FIS
originalFis = readfis('Task D.fis');
% Load the trained ANFIS
trainedFis = readfis('trainedANFIS.fis');

% Define new input data that is beyond the universe of discourse for the original FIS
new_data = [1.1, 1.1, 1.1]; % Example values beyond the training data range

% Evaluate the original FIS with the new input data
originalFisOutput = evalfis(originalFis, new_data);

% Evaluate the trained ANFIS with the new input data
trainedFisOutput = evalfis(trainedFis, new_data);

% Display the results
disp(['Original FIS Output for input [', num2str(new_data), ']: ', num2str(originalFisOutput)]);
disp(['Trained ANFIS Output for input [', num2str(new_data), ']: ', num2str(trainedFisOutput)]);




