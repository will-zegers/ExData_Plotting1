library(dplyr)

targetRegex <- '^[12]/2/2007.*'

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
destFile <- substr(fileUrl, start=regexpr('[^2F]*$',fileUrl), stop=100000L)

if(!file.exists(destFile)) {
    cat(paste0('[+] Downloading data from ', substr(fileUrl,0,32),'...\n'))
    if (download.file(fileUrl, destFile, method='curl', quiet=T) != 0)
        print('[-] Problem downloading file. Download stopped.')
}

if(!exists('powData')) {
	cat('[+] Reading data...\n')
	dataFile <- unzip(destFile)
	targetLines <- grep(targetRegex, readLines(dataFile))
	powData <- read.csv(
	            dataFile,
	            sep=';',
	            skip=targetLines[1],
	            nrows=length(targetLines),
	            header=F
	            )
	colnames(powData) <- strsplit(readLines(dataFile,n=1),';')[[1]]
	
	powData <- mutate(powData, datetime=paste(Date, Time)) %>%
	       select(c(datetime, Global_active_power:Sub_metering_3))
	
	powData$datetime <- strptime(powData$datetime, '%d/%m/%Y %H:%M:%S')
}
