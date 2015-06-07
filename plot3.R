source('readData.R')

genPlot3 <- function(save=T) {

	title = ''
	xData = powData$datetime
	y1Data = powData$Sub_metering_1
	y2Data = powData$Sub_metering_2
	y3Data = powData$Sub_metering_3
	xLabel = ''
	yLabel = 'Energy sub metering'
	y1Color = 1 
	y2Color = 2
	y3Color = 4
	w = 480
	h = 480
	
	par(bg='white', mar=c(3.0,5.0,1.0,1.0))
	plot(
	    xData,
	    y1Data,
	    main=title,
	    xlab=xLabel,
	    ylab=yLabel,
	    col=y1Color,
	    type='l'
	)
	
	lines(
	    xData,
	    y2Data,
	    col=y2Color
	)
	
	lines(
	    xData,
	    y3Data,
	    col=y3Color
	)
	
	legend(
	    'topright',
	    lty=c(1,1),
	    col=c('black','red','blue'),
	    legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
	)
    if(save) {
        dev.copy(png, 'plot3.png')
    	dev.off()
    }
}
