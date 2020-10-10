# DDP_FinalProj

## Introduction

This `shiny` app is a simple demonstration of multivariate linear regression using `lm` function. The user can select several variables as predictors and check how the predictions for `Fertility` changes using the `swiss` data set. Also, user can select a variable for presenting the `scatter` plot. The plot also lists mean square root error `(MSRE)` of the prediction. Finally, a table of model `coefficients` is displayed below the plot.

## How to Use the App

Follow the steps below:

1. To generate a `new prediction`:
  - Select predictor variables using the check boxes,
  - Select the predictor for plotting, and
  - Hit **Submit** button to update the plot and summary table.
2. To `reset` the app, click *"circular arrow"* towards the upper left corner of the app.
3. To read this documentation, click on the `Documentation` tab.
4. To view the predictions, click on the `Prediction` tab.

## Inputs

There are two inputs desired from the user:

1. Predictor variables, and
2. X-axis Variable for plotting.

## Outputs

Based upon the user's input, the following output is displayed:

1. A `scatter` plot showing:
  - `Fertility` data plotted against selected x-axis variable,
  - `fitted.values` plotted against selected x-axis variable, and
  - `MSRE` of the predictions.
2. A table showing summary of linear fit model `coefficients`.

