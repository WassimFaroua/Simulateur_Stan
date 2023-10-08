data{
  int n1;
  real pa3[n1];
  
  
}
parameters{
  real mu10;
  real <lower=0>sigma10;
  
  
}

model{
  
  for(i in 1:n1)
   pa3[i] ~ normal(mu10,sigma10);   //likelihood
   mu10 ~ normal(0.6337704,0.02720472);
   sigma10 ~ cauchy(0,1);
} 


