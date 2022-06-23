# Coursera-Machine-Learning-Stanford
My solutions to all the programming assignments of Machine Learning course given by Andrew Ng.


# Notes
* In Week #3 assigment, we used a MATLAB built-in function called ```fminunc```. MATLAB's ```fminunc``` is an optimization solver that finds the minimum of an unconstrained function. It requires you to install [Optimization Toolbox](https://www.mathworks.com/products/optimization.html). For logistic regression, we want to optimize the cost function  with parameters. Concretely, we have used ```fminunc``` to find the best parameters for the logistic regression cost function, given a fixed dataset (of  <img src="https://render.githubusercontent.com/render/math?math=\large X">and  <img src="https://render.githubusercontent.com/render/math?math=\large y"> values).
* In Week #4 assignment, we used another MATLAB built-in function called ```fmincg``` for one-vs-all classification. ```fmincg``` works similarly to fminunc, but is more more efficient for dealing with a large number of parameters.
