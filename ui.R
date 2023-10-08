shinyUI(fluidPage(
  titlePanel("Simulateur de bilan Amen bank"),
  sidebarLayout(
    sidebarPanel(
      numericInput("input_number", "Entrer le total bilan:", value = 1, min = 1, max = 50000000),
      actionButton("calculate_button", "Calculer")
    ),
    mainPanel(
      tableOutput("result_table")  # Render the data frame as a table
    )
  )
))
