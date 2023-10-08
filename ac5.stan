data{
  int n1;
  real ac5[n1];
  
  
}
parameters{
  real mu5;
  real <lower=0>sigma5;
  
  
}

model{
  
  for(i in 1:n1)
   ac5[i] ~ normal(mu5,sigma5);   //likelihood
   mu5 ~ normal(0.1887118,0.03299219);
   sigma5 ~cauchy(0,1);
} 


