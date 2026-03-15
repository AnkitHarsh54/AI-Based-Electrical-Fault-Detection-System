%% Step 1: Load Dataset from CSV
data = readtable('data.csv');

% Handle missing values
data = rmmissing(data);

% Display first few rows to confirm
disp('Loaded Dataset:');
disp(head(data, 10));

% Convert FaultType column to categorical
data.FaultType = categorical(data.FaultType);

%% Step 2: Normalize the Data (Scale Between 0-1)
features = table2array(data(:, 1:5)); % Extract numeric features
featureMin = min(features, [], 1); % Compute min for each feature
featureMax = max(features, [], 1); % Compute max for each feature

% Prevent division by zero during normalization
denominator = featureMax - featureMin;
denominator(denominator == 0) = 1; % Avoid NaN values

features = (features - featureMin) ./ denominator; % Min-max normalization

%% Step 3: Convert Fault Labels into One-Hot Encoding
faultLabels = onehotencode(data.FaultType(:), 2); % Convert categorical to one-hot encoded matrix


%% Step 4: Split Data (Training 70%, Testing 30%)s
cv = cvpartition(height(data), 'HoldOut', 0.3); % Holdout 30% for testing
trainFeatures = features(training(cv), :);
testFeatures = features(test(cv), :);
trainLabels = faultLabels(training(cv), :);
testLabels = faultLabels(test(cv), :);

%% Step 5: Define & Train Neural Network
hiddenLayerSize = 12; % Adjust neuron count
net = patternnet(hiddenLayerSize);

% Use Levenberg-Marquardt training algorithm
net.trainFcn = 'trainlm';
net.performFcn = 'crossentropy';

% Enable early stopping to prevent overfitting
net.trainParam.max_fail = 10;

% Train Neural Network
[net, tr] = train(net, trainFeatures', trainLabels');

%% Step 6: Test the Model
predictions = net(testFeatures'); % Get predictions
[~, predictedLabels] = max(predictions, [], 1); % Get class with highest probability
[~, actualLabels] = max(testLabels', [], 1);

accuracy = sum(predictedLabels == actualLabels) / length(actualLabels) * 100;
fprintf('Neural Network Model Accuracy: %.2f%%\n', accuracy);

%% Step 7: Save the Trained Model
save('FaultDetectionNN.mat', 'net', 'featureMin', 'featureMax', 'data');
disp('Trained model saved successfully!');
