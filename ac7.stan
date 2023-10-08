data{
  int n1;
  real ac7[n1];
  
  
}
parameters{
  real mu7;
  real <lower=0>sigma7;
  
  
}

model{
  
  for(i in 1:n1)
   ac7[i] ~ normal(mu7,sigma7);   //likelihood
   mu7 ~ normal(0.02120658,0.003711148);
   sigma7 ~cauchy(0,1);
} 


