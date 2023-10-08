data{
  int n1;
  real ac4[n1];
  
  
}
parameters{
  real mu4;
  real <lower=0>sigma4;
  
  
}

model{
  
  for(i in 1:n1)
   ac4[i] ~ normal(mu4,sigma4);   //likelihood
   mu4 ~ normal(0.03239387, 0.02562294);
   sigma4 ~cauchy(0,1);
} 

