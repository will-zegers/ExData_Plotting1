#source('readData.R')
#source('plot2.R')
#source('plot3.R')

genPlot4 <- function(save=T) {

	par(mfrow = c(2,2), mar = c(8,8,4,2), oma = c(0,0,2,0))
	
	with(powData, {
	    genPlot2(F)
	    with(powData, plot(
	        datetime,
	        Voltage,
	        type='l'
	    ))
	    genPlot3(F)
	    with(powData, plot(
	        datetime,
	        Global_reactive_power,
	        type='l'
	    ))
	})

    if(save) {
        dev.copy(png, 'plot4.png')
        dev.off()
    }    
}
