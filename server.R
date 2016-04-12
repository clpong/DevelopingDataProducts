library(shiny)
shinyServer(
  function(input, output){
     output$MonthlyRepayment <- renderText({ CalculatCarRepayment(input$Principal, input$InterestRate, input$Tenure) })   
  }
)

CalculatCarRepayment <- function (Principal, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  result <- (Principal*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  return(round(result, digits = 2))
}

