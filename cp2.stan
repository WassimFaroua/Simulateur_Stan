data{
  int n1;
  real cp2[n1];
  
  
}
parameters{
  real mu13;
  real <lower=0>sigma13;
  
  
}

model{
  
  for(i in 1:n1)
   cp2[i] ~ normal(mu13,sigma13);   //likelihood
   mu13 ~ normal(0.08162369,0.01441922);
   sigma13 ~ cauchy(0,1);
}


