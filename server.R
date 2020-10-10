#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Some of the code followed from https://github.com/vnijs/shiny-site
#

library(shiny)
library(knitr)
library(dplyr)
library(datasets)
data(swiss)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    output$plot1 <- renderPlot({
        
        if(input$xaxis=="Index")
            xp <- 1:nrow(swiss)
        else
            xp <- swiss[, grep(input$xaxis,colnames(swiss))]

        pred1 <- c(1)
        if(input$x2) pred1 <- c(pred1,2)
        if(input$x3) pred1 <- c(pred1,3)
        if(input$x4) pred1 <- c(pred1,4)
        if(input$x5) pred1 <- c(pred1,5)
        if(input$x6) pred1 <- c(pred1,6)
        
        sw <- swiss[,pred1]
        if (ncol(sw)==1) sw <- swiss[,c(1,2)]
        modFit <- lm(Fertility ~ ., data=sw)
        mse <- sqrt(sum(modFit$residual^2)/nrow(swiss))
        
        output$sumtable <- renderTable({
            summary(modFit)$coef
        }, include.rownames = TRUE)
        
        plot(xp,swiss$Fertility,
             xlab = input$xaxis, ylab = "Fertility", pch=1, col="blue")
        points(xp,modFit$fitted.values,pch=19,col="red")
        legend("topright", pch = c(1,19), col = c("blue", "red"), 
               legend = c("Data", "Prediction"))
        text(x=mean(c(max(xp),min(xp))),y=40,paste("MSRE = ",round(mse,2)))
    })

    output$Out2 <- renderUI({
        inclRmd("./AddDoc.Rmd")
    })
})

encoding <- getOption("shiny.site.encoding", default = "UTF-8")

inclRmd <- function(path, r_env = parent.frame()) {
    paste(
        readLines(path, warn = FALSE, encoding = encoding),
        collapse = '\n'
    ) %>%
        knitr::knit2html(
            text = .,
            fragment.only = TRUE,
            envir = r_env,
            options = "",
            stylesheet = "",
            encoding = encoding
        ) %>%
        gsub("&lt;!--/html_preserve--&gt;","",.) %>%  ## knitr adds this
        gsub("&lt;!--html_preserve--&gt;","",.) %>%   ## knitr adds this
        HTML
}
