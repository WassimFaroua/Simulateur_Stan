data{
  int n1;
  real cp5[n1];
  
  
}
parameters{
  real mu14;
  real <lower=0>sigma14;
  
  
}

model{
  
  for(i in 1:n1)
   cp5[i] ~ normal(mu14,sigma14);   //likelihood
   mu14 ~ normal(0.0005780911,0.0005780911);
   sigma14 ~ cauchy(0,1);
}


