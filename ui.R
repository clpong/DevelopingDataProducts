library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Car Loan Repayment"),
  sidebarPanel(
    numericInput('Principal', 'Loan Amount (MYR)', 15000, min=0, step=10000),
    numericInput('InterestRate', 'Interest Rate Per Annum', 2.3, min=0, step =1),
    numericInput('Tenure', 'Loan Tenure (years)', 5)
    
  ),
  mainPanel(
    h3('Monthly Car Loan Repayment (MYR)'),
    strong(h4(textOutput("MonthlyRepayment"))),
    br(),
    code("Instructions"),
    helpText("This application is for car purchaser to calculate monthly repayment base on bank given interest rate")
  
  )
))