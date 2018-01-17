#Create a matrix of weather conditions for bee foraging conditions
#This model assumes that bloom lasts about 25 days and that bees are foraging
#for a max of 10 hours each day. About a quarter of the days during bloom are rainy
#and so bees don't forage. But not every hour is lost on rainy days, and there are
#also some rare bad hours during good days (it's too cloudy or windy). This function
#generates a matrix[hours,numDays] for use in the bbbees function.
weatherfast = function(hours=10, numDays=25, 
                         rainyprob=0.25, goodprob=0.1, badprob=0.75) {

  weathermat = matrix(0, hours, numDays) #initialize the weathermat.
  days = sample(c(1,0), numDays, #Choose whether each day is good or bad
                prob=c(1-rainyprob, rainyprob), replace=TRUE)
  weathermat[1,] = days #slam these into the first row of weathermat
  
  for (day in 1:numDays) { #then loop over each of those days
    if(weathermat[1,day]==1) { #If it's good, make most of the hours good.
      weathermat[1:hours,day] = sample(c(1,0), hours, 
                                   prob=c(1-goodprob, goodprob), replace=TRUE)
    } else { #But then if it's bad, make most of the hours bad.
      weathermat[1:hours,day] = sample(c(1,0), hours, 
                                   prob=c(1-badprob, badprob), replace=TRUE)
    }
  }
  return(weathermat)
}



