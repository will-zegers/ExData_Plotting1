source('readData.R')

genPlot2 <- function(save=T) {
	
    title = ''
	xData = powData$datetime
	yData = powData$Global_active_power
	xLabel = ''
	yLabel = 'Global Active Power (kilowatts)'
	color = 1 
	w = 480
	h = 480
	
	par(bg='white', mar=c(3.0,5.0,1.0,1.0))
	plot(
	    xData,
	    yData,
	    main=title,
	    xlab=xLabel,
	    ylab=yLabel,
	    col=color,
	    type='l'
	    )
    
    if(save) {
    	dev.copy(png, 'plot2.png')
    	dev.off()
    }
}
