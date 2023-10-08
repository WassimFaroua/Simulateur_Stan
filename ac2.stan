data{
  int n1;
  real ac2[n1];
  
  
}
parameters{
  real mu2;
  real <lower=0>sigma2;
  
  
}

model{
  
  for(i in 1:n1)
   ac2[i] ~ normal(mu2,sigma2);   //likelihood
   mu2 ~ normal(0.02398355,0.007411166);
   sigma2 ~cauchy(0,1); //prior
} 




