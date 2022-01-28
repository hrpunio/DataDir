fileName <- "ZwK_2018_vs_2017.csv"  ## 2016_KK_D.csv
co <- "Dystans: 140 (biorący udział w latach 2017-16)"

z <- read.csv(fileName, sep = ';',  header=T, na.string="NA", dec=".");

s140 <- summary(z$speed)

summary_label <- paste (sep='', "Średnia = ", s140[["Mean"]], 
  "\nMediana = ", s140[["Median"]],
  "\nQ1 = ", s140[["1st Qu."]],  "\nQ3 = ", s140[["3rd Qu."]],
  "\n\nMax = ", s140[["Max."]] )
##s140
z <- subset (z, ( speed > 16.0 )); ## bez maruderów


# wykres słupkowy
h <- hist(z$speed, breaks=c(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35), freq=TRUE, 
   col="orange", 
   main=co,
   xlab="Prędkość średnia w latach 2017--16 [kmh]",ylab="L.kolarzy", labels=T, xaxt='n' )
   axis(side=1, at=c(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35))
   text(38, 37, summary_label, cex = .8, adj=c(1,1) )

