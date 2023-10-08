data{
  int n1;
  real pa4[n1];
  
  
}
parameters{
  real mu11;
  real <lower=0>sigma11;
  
  
}

model{
  
  for(i in 1:n1)
   pa4[i] ~ normal(mu11,sigma11);   //likelihood
   mu11 ~ normal( 0.1002736,0.01103434);
   sigma11 ~ cauchy(0,1);
} 



