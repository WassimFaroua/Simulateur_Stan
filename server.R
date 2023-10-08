source("C:/Users/wassi/OneDrive/Bureau/Stage/stan/test55.R")

shinyServer(function(input, output) {
  observeEvent(input$calculate_button, {
    result_df <- bilan(input$input_number)  # Call your function
    rownames(result_df) <- c("AC1: Caisse et avoirs auprès de la BCT, CCP et TGT","AC2: Créances sur les établissements bancaires et financiers",
                         "AC3: Créances sur la clientèle","AC4: Portefeuille-titres commercial","AC5: Portefeuille d’investissement","AC6: Valeurs immobilisées",
                         "AC7: Autres actifs","Total actifs","PA1: Banque Centrale et CCP","PA2: Dépôts et avoirs des établissements bancaires et financiers",
                         "PA3: Dépôts et avoirs de la clientèle","PA4: Emprunts et Ressources spéciales","PA5: Autres passifs","Total passifs",
                         "CP1: Capital","CP2: Réserves","CP4: Autres capitaux propres","CP5: Résultats reportés","CP6: Résultat de l’exercice",
                         "Total capitaux propres","Total capitaux propres et passifs")
    # Render the result in the app
    output$result_table <- renderTable({
      result_df
    })
  })
})
