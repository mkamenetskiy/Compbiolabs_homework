# Markdown for Lab08
## EBIO4420 Assignment 7
> The assignment was assigned through a github repository for the class. The link to the instructions can be found [here](https://github.com/flaxmans/CompBio_on_git/blob/main/Labs/Lab08/Lab08_documentation_and_metadata.md).

This piece of code will be useful for calculating a population that changes over time, specifically one that changes following a logistic gowth model.
In order to set the parameters of the function to be used one must set the existing conditions of the function:
* **population** - This will be the value of the starting population
* **K** - This will be the carrying capacity of the population. This is not neccessary to preassign.
* **r** - This is the intrinsic growth rate of a population.
* **years** - This is the amount of years in which the population will grow for.

The function used will be as below:
> LogGrowthFunc <- function(r, K){...}

The first input of the function can be the r preassigned or a number of choosing that is the intrinsic growth rate. The second input of function can be the K preassigned or a number that represents the carrying capacity.
The output of the function will be a vector where each number represents the population in sequential years and a plot of the time in years against the abundance of the population.
Here is an example of the plot:

[![4be67378-cb88-44b8-afb7-8d91f16dbc01.png](https://i.postimg.cc/66c3mxZg/4be67378-cb88-44b8-afb7-8d91f16dbc01.png)](https://postimg.cc/fk3DVFBf)

Finally this code finishes with converting the data into a csv in which the first column is generations in years and the second is the abudnace vector.

