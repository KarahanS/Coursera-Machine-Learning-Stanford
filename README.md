# Coursera-Machine-Learning-Stanford
My solutions to all the programming assignments of Machine Learning course given by Andrew Ng. Try to solve all the assignments by yourself first, but if you get stuck somewhere then feel free to browse the code.

* [Certificate](https://www.coursera.org/account/accomplishments/certificate/DFPJJ7MV32YC)

# Contents 
| Week          | Assignment    |Grade  |
| ------------- |:-------------:| :-----:|
| Week 2        |   Linear Regression |100/100| 
| Week 3        |    Logistic Regression     |100/100| 
| Week 4        |   Multi-class Classification and Neural Networks   |100/100|
| Week 5        |  Neural Networks Learning    |100/100|
| Week 6        | Regularized Linear Regression and Bias vs. Variance      |100/100|
| Week 7        | Support Vector Machines     |100/100|
| Week 8        | K-Means Clustering and Principal Component Analysis      |100/100|
| Week 9        |  Anomaly Detection and Recommender Systems    |100/100|


# Notes
* In [Week #3](https://github.com/KarahanS/Coursera-Machine-Learning-Stanford/tree/main/Programming%20Assignments/week3) assigment, I've used a MATLAB built-in function called ```fminunc```. MATLAB's ```fminunc``` is an optimization solver that finds the minimum of an unconstrained function. It requires you to install [Optimization Toolbox](https://www.mathworks.com/products/optimization.html). For logistic regression, we want to optimize the cost function  with parameters. Concretely, we have used ```fminunc``` to find the best parameters for the logistic regression cost function, given a fixed dataset (of  <img src="https://render.githubusercontent.com/render/math?math=\large X">and  <img src="https://render.githubusercontent.com/render/math?math=\large y"> values).
* In [Week #4](https://github.com/KarahanS/Coursera-Machine-Learning-Stanford/tree/main/Programming%20Assignments/week4) assignment, I've used another MATLAB built-in function called ```fmincg``` for one-vs-all classification. ```fmincg``` works similarly to fminunc, but is more more efficient for dealing with a large number of parameters.
* In [Week #5](https://github.com/KarahanS/Coursera-Machine-Learning-Stanford/tree/main/Programming%20Assignments/week5) assignment, I've used a MATLAB built-in function called ```randsample``` to randomly select <img src="https://render.githubusercontent.com/render/math?math=\large i"> examples from the training set and <img src="https://render.githubusercontent.com/render/math?math=\large i"> examples from the cross validation set for the optional exercise: Plotting learning curves with randomly selected examples. This function requires you to install [Statistics and Machine Learning Toolbox](https://www.mathworks.com/products/statistics.html). You can test this part by uncommenting the related code block in ```learningCurve.m```. 

# Possible Improvement
* In [Week #5](https://github.com/KarahanS/Coursera-Machine-Learning-Stanford/tree/main/Programming%20Assignments/week5), I've implemented the backpropagation algorithm with a for loop over the all training examples (as it was recommended to do so). But I strongly believe vectorized implementation for the whole algorithm is possible. I'll have a try sometime.
