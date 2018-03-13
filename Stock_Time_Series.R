install.packages("forecast")
library(forecast)
apple <- read.csv("AAPL.csv")
print(apple)
typeof(apple)
applePrices = data.frame(apple['Date'],apple['Adj.Close'])
print(applePrice)
plot(applePrices)
a <-which(applePrices$Date == '2017-01-01')
applePrices[a,]
train= applePrices [1:a,2]
print(train)
test = applePrices [a:60,2]
test
testts <- ts(test,frequency = 12, start=c(2017,2))
testts
plot(applePrices)
lines(applePrices)
lines()
appletsmain <- ts(applePrices$Adj.Close,frequency = 12, start=c(2013,1))
applets <- ts(train,frequency = 12, start=c(2013,1))
print(applets)
plot.ts(applets)
acf <- acf(applets,lag.max = 20)
pacf <- pacf(applets,lag.max = 20) 
station <- Box.test(applets, lag = 20, type = "Ljung-Box")
station
appletscomp <- decompose(applets)
plot(appletscomp$seasonal)
fit <- auto.arima(applets)
summary(fit)
tsdiag(fit)
fc<-forecast(fit,h=12)
appleforecasted <- fc$mean
appleforecasted
pct = ((appleforecasted - testts)/testts)*100
pct
plot(fc)
lines(appletsmain,col="red")
fit1 <- ar(applets)
summary(fit1)
fc1 <- forecast(fit1,h=12)
fc1
plot(fc1)
fit2 <- ma(applets,order=1)

fit2
fc2 <- forecast(fit2,h=12)
fc2
plot(fc2)
