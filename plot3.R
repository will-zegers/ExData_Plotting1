source('readData.R')

makePlot3 <- function(save=F, hasLegendBorder=T) {

	par(bg='white', mar=c(3.0,5.0,1.0,1.0))

	with(powData, { 
        plot(
	        x    = datetime,
	        y    = Sub_metering_1,
    	    main ='',
	        xlab ='',
    	    ylab ='Energy sub metering',
    	    col  ='black',
    	    type ='l'
    	)
	
    	lines(
    	   x   = datetime,
    	   y   = Sub_metering_2,
    	   col = 'red'
    	)
	
    	lines(
    	   x   = datetime,
    	   y   = Sub_metering_3,
    	   col = 'blue'
    	)
    })
	
	legend(
	    x          = 'topright',
	    lty        = c(1,1),
	    col        = c('black','red','blue'),
	    legend     = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
        text.width = strwidth('Sub_metering_X  '), 
        box.lwd    = if(hasLegendBorder) 1 else 0
	)

    if(save) {
        dev.copy(png, 'plot3.png')
    	q <- dev.off()
    }
}
