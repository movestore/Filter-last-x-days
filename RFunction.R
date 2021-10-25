library('move')

rFunction <- function(data,time_now=NULL,dur=14,dur_unit="days")
{
  Sys.setenv(tz="UTC") 
  
  if (is.null(time_now)) time_now <- Sys.time() else time_now <- as.POSIXct(time_now,format="%Y-%m-%dT%H:%M:%OSZ",tz="UTC")
  
  logger.info(paste("You have selected to select the data of the last",dur,dur_unit,"starting from",time_now,"."))
  
  endTime <- time_now
  startTime <- time_now - as.difftime(dur,format="%X", units=dur_unit)
  
  minT <- min(timestamps(data))
  maxT <- max(timestamps(data))

  if (minT>endTime | maxT<startTime)
  {
    logger.info("Warning! None of your data lies in the requested time range. Return NULL.")
    result <- NULL
  } else
  {
    result <- data[timestamps(data)>=startTime & timestamps(data)<=endTime,]
    logger.info(paste("Filtering successful. It found",length(result),"positions of",length(namesIndiv(result)),"animal(s)."))
  }
  
  #zero move cleanup not necessary

  result
}
  
