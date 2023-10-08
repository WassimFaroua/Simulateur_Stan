data{
  int n1;
  real pa1[n1];
  
  
}
parameters{
  real mu8;
  real <lower=0>sigma8;
  
  
}

model{
  
  for(i in 1:n1)
   pa1[i] ~ normal(mu8,sigma8);   //likelihood
   mu8 ~ normal(0.09998562,0.02667522);
   sigma8 ~ cauchy(0,1);
} 


