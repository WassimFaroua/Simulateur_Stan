data{
  int n1;
  real ac3[n1];
  
  
}
parameters{
  real mu3;
  real <lower=0>sigma3;
  
  
}

model{
  
  for(i in 1:n1)
   ac3[i] ~ normal(mu3,sigma3);   //likelihood
   mu3 ~ normal(0.6714123,0.02734965);
   sigma3 ~cauchy(0,1);
} 




