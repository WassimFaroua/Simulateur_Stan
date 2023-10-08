data{
  int n1;
  real ac6[n1];
  
  
}
parameters{
  real mu6;
  real <lower=0>sigma6;
  
  
}

model{
  
  for(i in 1:n1)
   ac6[i] ~ normal(mu6,sigma6);   //likelihood
   mu6 ~ normal(0.02324061,0.007809698);
   sigma6 ~cauchy(0,1);
} 





