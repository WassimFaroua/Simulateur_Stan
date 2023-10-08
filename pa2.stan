data{
  int n1;
  real pa2[n1];
  
  
}
parameters{
  real mu9;
  real <lower=0>sigma9;
  
  
}

model{
  
  for(i in 1:n1)
   pa2[i] ~ normal(mu9,sigma9);   //likelihood
   mu9 ~ normal(0.03323781,0.01253512);
   sigma9 ~ cauchy(0,1);
} 


