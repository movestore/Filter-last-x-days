library('move2')

rFunction <- function(data,time_now=NULL,dur=14,dur_unit="days")
{
  Sys.setenv(tz="UTC")
 
   if (is.null(time_now)) time_now <- Sys.time() else time_now <- as.POSIXct(time_now,format="%Y-%m-%dT%H:%M:%OSZ",tz="UTC")
  
  logger.info(paste("You have selected to select the data of the last",dur,dur_unit,"starting from",time_now,"."))
  
  endTime <- time_now
  startTime <- time_now - as.difftime(dur,format="%X", units=dur_unit)
  
  minT <- min(mt_time(data))
  maxT <- max(mt_time(data))

  if (minT>endTime | maxT<startTime)
  {
    logger.info("Warning! None of your data lies in the requested time range. Return NULL.")
    result <- NULL
  } else
  {
    result <- data[mt_time(data)>=startTime & mt_time(data)<=endTime,]
    logger.info(paste("Filtering successful. It found",nrow(result),"positions of",length(unique(mt_track_id(result))),"animal(s)."))
  }
  
  #zero move cleanup not necessary

  result
}
  
