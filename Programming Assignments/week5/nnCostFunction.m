function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% FIRST PART: VECTORIZED IMPLEMENTATION OF FORWARD PROPAGATION
% SECOND PART: IMPLEMENTATION OF THE ALL ALGORITHM WITH A FOR LOOP

% neural network: 400 - 25 - 10 (number of neurons in the layers)
% Theta1 =  25 x 401
% Theta2 = 10 x 26
% y = 5000 x 1 (where each row denotes a number from 1 to 10)
% X = 5000 x 400 (each row consists of 20x20 pixels)

% first add ones for bias units
X = [ones(m, 1) X]; % 5000 x 401

% X = 5000 x 401
% first, feedforward

% (5000 x 401) . (401 x 25)
a2 = [ones(m, 1) sigmoid(X * transpose(Theta1))];
% a2 = 5000 x 26

% (5000 x 26) . (26 x 10)
a3 = sigmoid(a2 * transpose(Theta2));

% a3 is the output: 5000 x 10 (5000 training examples)
% y = 5000 x 1

% labels must be recoded so that y = 5000 x 10
% for example [4] will be [0 0 0 4 0 0 0 0 0 0]
a = 1:num_labels;
y = (y == a);
% y = 5000 x 10
J = (-1/m) * sum(sum(y .* log(a3) + (1 - y) .* log(1 - a3)));


% regularization
temp1 = Theta1(:, 2:end);  % ignore bias units
temp2 = Theta2(:, 2:end);
J = J + (lambda / (2 * m)) * sum(sum(temp1 .^ 2, 'all') + sum(temp2 .^ 2, 'all'));




% algorithm
delta1 =  zeros(size(Theta1));
delta2 = zeros(size(Theta2));
for t = 1:m
    a1 = transpose(X(t, :)); % transpose([1 x1 x2 x3 .. x400])  (401 elements) 
    % a1 = 401 x 1
    % (25 x 401) . (401 x 1) = 25 x 1
    a2 = [1; sigmoid(Theta1 * a1)];
    
    % (10 x 26) . (26 x 1)
    a3 = sigmoid(Theta2 * a2);
    % a3 = 10 x 1
    % now set errors (we converted y from 5000x1 to 5000x10 beforehand)
    
    error3= a3 - transpose(y(t, :));
    % transpose(Theta2) * error3 = (26 x 10) . (10 x 1) = (26 x 1) (remove
    % first row - bias neurons)

    % Theta1 * a1 = (25 x 401) . (401 x 1) = 25 x 1
    temp = transpose(Theta2) * error3;
    error2= temp(2:end, :) .* sigmoidGradient(Theta1 * a1);
    
    delta2 = delta2 + error3 * transpose(a2);
    delta1 = delta1 + error2 * transpose(a1);
end

temp1 = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];  % do not regularize bias units (replace them with 0)
temp2 = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];  % do not regularize bias units (replace them with 0)
Theta1_grad = (1/m) * delta1 + (lambda / m) * temp1;
Theta2_grad = (1/m) * delta2 + (lambda / m) * temp2;



% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
