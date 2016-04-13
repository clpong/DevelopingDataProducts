library(shiny)
shinyServer(
  function(input, output){
     output$Principal <- renderText({input$Principal})
     output$MonthlyRepayment <- renderText({ CalculatCarRepayment(input$Principal, input$InterestRate, input$Tenure) })
     output$TotalPayment <- renderText({ CalculateTotalPayment(input$Principal, input$InterestRate, input$Tenure) })
     output$TotalInterestPay <- renderText({ CalculateCarInterest(input$Principal, input$InterestRate, input$Tenure) })
  }
)

CalculatCarRepayment <- function (Principal, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  result <- (Principal*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  return(round(result, digits = 2))
}

CalculateTotalPayment <- function (Principal, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  MonthlyPayment <- (Principal*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  result <- MonthlyPayment * TenureInMonth
  return(round(result, digits = 0))
}

CalculateCarInterest <- function (Principal, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  MonthlyPayment <- (Principal*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  TotalPayment <- MonthlyPayment * TenureInMonth
  result <- TotalPayment - Principal
  return(round(result, digits = 0))
}
