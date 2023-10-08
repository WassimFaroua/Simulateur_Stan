library(openxlsx)
library(MASS)
library(tidyverse)
library(rstan)
# library(shinystan)
bl<- read.xlsx("C:/Users/wassi/OneDrive/Bureau/Stage/bilan1.xlsx")
n1<-7
ac1<-bl$ac1
ac2<-bl$ac2
ac3<-bl$ac3
ac4<-bl$ac4
ac5<-bl$ac5
ac6<-bl$ac6
ac7<-bl$ac7
pa1<-bl$pa1
pa2<-bl$pa2
pa3<-bl$pa3
pa4<-bl$pa4
pa5<-bl$pa5
cp2<-bl$cp2
cp5<-bl$cp5
cp6<-bl$cp6


hist(ac2)
mean(ac1)
sd(ac1)
## do it for all variables
fitdistr(ac1,"normal")

#compile
rstan_options(auto_write = TRUE)
model1 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac1.stan') 
model2 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac2.stan')
model3 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac3.stan')
model4 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac4.stan')
model5 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac5.stan')
model6 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac6.stan')
model7 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/ac7.stan')
model8 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/pa1.stan')
model9 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/pa2.stan')
model10 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/pa3.stan')
model11<- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/pa4.stan')
model12 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/pa5.stan')
model13 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/cp2.stan')
model14 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/cp5.stan')
model15 <- stan_model('C:/Users/wassi/OneDrive/Bureau/Stage/stan/cp6.stan')

#pass data and run model

fit1 <- sampling(model1, list(n1=n1, ac1=ac1), iter=200, chains=4 )
fit2 <- sampling(model2, list(n1=n1, ac2=ac2), iter=200, chains=4 )
fit3 <- sampling(model3, list(n1=n1, ac3=ac3), iter=200, chains=4 )
fit4 <- sampling(model4, list(n1=n1, ac4=ac4), iter=200, chains=4 )
fit5 <- sampling(model5, list(n1=n1, ac5=ac5), iter=200, chains=4 )
fit6 <- sampling(model6, list(n1=n1, ac6=ac6), iter=200, chains=4 )
fit7 <- sampling(model7, list(n1=n1, ac7=ac7), iter=200, chains=4 )
fit8 <- sampling(model8, list(n1=n1, pa1=pa1), iter=200, chains=4 )
fit9 <- sampling(model9, list(n1=n1, pa2=pa2), iter=200, chains=4 )
fit10 <- sampling(model10, list(n1=n1, pa3=pa3), iter=200, chains=4 )
fit11<- sampling(model11, list(n1=n1, pa4=pa4), iter=200, chains=4 )
fit12 <- sampling(model12, list(n1=n1, pa5=pa5), iter=200, chains=4 )
fit13 <- sampling(model13, list(n1=n1, cp2=cp2), iter=200, chains=4 )
fit14 <- sampling(model14, list(n1=n1, cp5=cp5), iter=200, chains=4 )
fit15 <- sampling(model15, list(n1=n1, cp6=cp6), iter=200, chains=4 )

# launch_shinystan(fit1)
#print(fit)
#print(p1$mu1)
#hist(p1$mu1)
#va1<-sample(p1$mu1,1)
#va2<-sample(p2$mu2,1)
p1<-extract((fit1))
p2<-extract((fit2))
p3<-extract((fit3))
p4<-extract((fit4))
p5<-extract((fit5))
p6<-extract((fit6))
p7<-extract((fit7))
p8<-extract((fit8))
p9<-extract((fit9))
p10<-extract((fit10))
p11<-extract((fit11))
p12<-extract((fit12))
p13<-extract((fit13))
p14<-extract((fit14))
p15<-extract((fit15))
# actifs<- c(1,1,1,1,1,1,1)
#set.seed(1000000)
#while (sum(actifs) > 1) {
#}
bilan <-function(n){
  actifs<- c(0,0,0,0,0,0,0,0,0,0)
  actifs[1] <- sample(p1$mu1, 1) #ac1  
  actifs[2] <- sample(p2$mu2, 1) #ac2
  actifs[3] <- sample(p3$mu3, 1) #ac3
  actifs[4] <- sample(p4$mu4, 1) #ac4
  actifs[5] <- sample(p5$mu5, 1) #ac5
  actifs[6] <- sample(p6$mu6, 1) #ac6
  actifs[7] <- sample(p7$mu7, 1) #ac7

if (sum(actifs)>1){
  actifs[3] <- actifs[3] - (sum(actifs)-1)
} else if (sum(actifs)<1){
    actifs[7] <- actifs[7] +(1-sum(actifs))
}
  pf<- c(0,0,0,0,0,0,0,0,0,0) #initialization
  pf[1] <- sample(p8$mu8, 1) #pa1
  pf[2] <- sample(p9$mu9, 1) #pa2
  pf[3] <- sample(p10$mu10, 1) #pa3
  pf[4] <- sample(p11$mu11, 1) #pa4
  pf[5] <- sample(p12$mu12, 1) #pa5
  pf[6] <- sample(p13$mu13, 1) #cp2
  pf[7] <- sample(p14$mu14, 1) #cp5
  pf[8] <- sample(p15$mu15, 1) #cp6
  pf[9] <-131677.6/n #cp1_cst
  pf[10] <-423/n #cp4-cst
  if (sum(pf)>1){
    pf[3] <- pf[3] - (sum(pf)-1)
  } else if (sum(pf)<1){
    pf[7] <- pf[7] +(1-sum(pf))
  }
  final<-data.frame(Value= c(actifs[1]*n,actifs[2]*n,actifs[3]*n,actifs[4]*n,
                            actifs[5]*n,actifs[6]*n,actifs[7]*n,n,pf[1]*n,pf[2]*n,pf[3]*n,pf[4]*n,pf[5]*n,sum(pf[1:5])*n,
                            pf[9]*n,pf[6]*n,pf[10]*n,pf[7]*n,pf[8]*n,sum(pf[6:10])*n,n))
  rownames(final) <- c("AC1: Caisse et avoirs auprès de la BCT, CCP et TGT","AC2: Créances sur les établissements bancaires et financiers",
                       "AC3: Créances sur la clientèle","AC4: Portefeuille-titres commercial","AC5: Portefeuille d’investissement","AC6: Valeurs immobilisées",
                       "AC7: Autres actifs","Total actifs","PA1: Banque Centrale et CCP","PA2: Dépôts et avoirs des établissements bancaires et financiers",
                       "PA3: Dépôts et avoirs de la clientèle","PA4: Emprunts et Ressources spéciales","PA5: Autres passifs","Total passifs",
                       "CP1: Capital","CP2: Réserves","CP4: Autres capitaux propres","CP5: Résultats reportés","CP6: Résultat de l’exercice",
                       "Total capitaux propres","Total capitaux propres et passifs")
  titre <- "Bilan simulé"
  View(final, title = titre)
  return(final)
}
