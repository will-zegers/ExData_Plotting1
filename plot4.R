source('readData.R')
source('plot2.R')
source('plot3.R')

makePlot4 <- function(save=F) {

	par(mfrow = c(2,2),
        mgp   = c(2,1,0),
        mar   = c(5,4,4,2), 
        oma   = c(0,0,2,0))
	
	with(powData, {

	    makePlot2()

	    plot(
	        x    = datetime,
	        y    = Voltage,
	        type = 'l',
            xlab = 'datetime'
	    )

	    makePlot3(hasLegendBorder = F)

	    plot(
	        x    = datetime,
	        y    = Global_reactive_power,
	        type = 'l'
	    )
	})

    if(save) {
        dev.copy(png, 'plot4.png')
        q <- dev.off()
    }
}
