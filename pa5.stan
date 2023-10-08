data{
  int n1;
  real pa5[n1];
  
  
}
parameters{
  real mu12;
  real <lower=0>sigma12;
  
  
}

model{
  
  for(i in 1:n1)
   pa5[i] ~ normal(mu12,sigma12);   //likelihood
   mu12 ~ normal( 0.02265352,0.001413507);
   sigma12 ~ cauchy(0,1);
} 



