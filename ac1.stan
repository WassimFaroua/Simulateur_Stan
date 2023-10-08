data{
  int n1;
  real ac1[n1];
  
  
}
parameters{
  real mu1;
  real <lower=0>sigma1;
  
  
}

model{
  
  for(i in 1:n1)
   ac1[i] ~ normal(mu1,sigma1);   //likelihood
   mu1 ~ normal(0.03905122,0.02587884);
   sigma1 ~ cauchy(0,1);
} 


