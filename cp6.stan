data{
  int n1;
  real cp6[n1];
  
  
}
parameters{
  real mu15;
  real <lower=0>sigma15;
  
  
}

model{
  
  for(i in 1:n1)
   cp6[i] ~ normal(mu15,sigma15);   //likelihood
   mu15 ~ normal(0.01331924,0.0019507);
   sigma15 ~ cauchy(0,1);
}



