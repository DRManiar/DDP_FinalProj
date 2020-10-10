#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(knitr)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Fertility using the swiss Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(h5("Select Predictor(s) to Build a Model"),
            checkboxInput("x2", "Agriculture", value = TRUE),
            checkboxInput("x3", "Examination", value = FALSE),
            checkboxInput("x4", "Education", value = FALSE),
            checkboxInput("x5", "Catholic", value = FALSE),
            checkboxInput("x6", "Infant.Mortality", value = FALSE),
            selectizeInput("xaxis","Select a Predictor for Plotting",
                           c("Index",
                             "Fertility",
                             "Agriculture",
                             "Examination",
                             "Education",
                             "Catholic",
                             "Infant.Mortality")),
            h5(""),
            h5("(Hint: Hit Submit After Making Selections.)"),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Prediction", br(), 
                                 h4("The swiss Data Prediction using User-Selected Predictors:"),
                                 h5("DRManiar, 10 October 2020"),
                                 plotOutput("plot1"),
                                 h5("The Model Coefficient Summary:"),
                                 tableOutput("sumtable"),
                                 h5("Note: The predictor with a p-value greater than 0.05 should be
                                    excluded from the model.")),
                        tabPanel("Documentation", uiOutput("Out2"))
            )
        )
    )
))
