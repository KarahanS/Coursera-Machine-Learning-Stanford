function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% X: 5000 x 400 (there are 5000 many 20x20 images)
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26
X = [ones(m,1) X];
a2 = sigmoid(X * transpose(Theta1));
% a2 = 5000 x 25
a2 = [ones(m,1) a2];
% a2 = 5000 x 26 (bias unit)
output = sigmoid(a2 * transpose(Theta2));
% output = 5000 x 10
[~, p] = max(output, [], 2);

% Another way of doing this: 
%{
X = transpose(X);  % X: 400 x 5000
X = [ones(1,m); X];  % X: 401 x 500
a2 = sigmoid(Theta1 * X); % (25x401) * (401x5000) = 25x5000
% a2 = 25 x 5000
a2 = [ones(1,m); a2]; % 26 x 5000
% a2 = 26 x 5000 (bias unit)
output = sigmoid(Theta2 * a2); % (10x26) * (26x5000) = 10x5000 
% output = 10 x 5000  (first row corresponds to the probability of it being
% class 1 for each training example)
[~, p] = max(transpose(output), [], 2);
}%





% =========================================================================


end
