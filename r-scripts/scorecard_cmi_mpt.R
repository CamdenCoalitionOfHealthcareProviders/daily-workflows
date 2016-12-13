#wd <- setwd("Y:/for_Zach/")

mpt <- read.csv(paste("tmp/1.cmi.master_patient_table_", Sys.Date(), "_1", ".csv", sep=""), stringsAsFactors=FALSE)

#Function to convert TrackVia dates to universal date format
exceldate <- function(date){
  
  if (!is.character(date)) {
    
    return(date)
    
  } else {
    
    date<-gsub(" ", "/",date)
    date<-gsub("Jan", "01",date)
    date<-gsub("Feb", "02",date)
    date<-gsub("Mar", "03",date)
    date<-gsub("Apr", "04",date)
    date<-gsub("May", "05",date)
    date<-gsub("Jun", "06",date)
    date<-gsub("Jul", "07",date)
    date<-gsub("Aug", "08",date)
    date<-gsub("Sep", "09",date)
    date<-gsub("Oct", "10",date)
    date<-gsub("Nov", "11",date)
    date<-gsub("Dec", "12",date)
    date<-as.Date(date, format="%m/%d/%Y")
    
    return(date)
    
  }
}

mpt$Date.of.Birth <- exceldate(mpt$Date.of.Birth)
mpt$Care.Team.Assignment.Date <- exceldate(mpt$Care.Team.Assignment.Date)
mpt$Pre.Enrollment.Interview.Date <- exceldate(mpt$Pre.Enrollment.Interview.Date)
mpt$Enrollment.Date <- exceldate(mpt$Enrollment.Date)
mpt$First.Readmission.Date <- exceldate(mpt$First.Readmission.Date)
mpt$Initial.PCP.Visit.Date <- exceldate(mpt$Initial.PCP.Visit.Date)
mpt$X30.Day.Follow.up.Date <-	exceldate(mpt$X30.Day.Follow.up.Date)
mpt$X60.Day.Follow.up.Date <- exceldate(mpt$X60.Day.Follow.up.Date)
mpt$X180.Day.Follow.up.Date <- exceldate(mpt$X180.Day.Follow.up.Date)
mpt$Outcome.Date <- exceldate(mpt$Outcome.Date)
mpt$Re.Engagement.Outcome.Date <- exceldate(mpt$Re.Engagement.Outcome.Date)
mpt$ReEngage.Grad.Follow.up.Date <- exceldate(mpt$ReEngage.Grad.Follow.up.Date)
mpt$DeceasedDate <- exceldate(mpt$DeceasedDate)
mpt$DateCarePlanCreated <- exceldate(mpt$DateCarePlanCreated)
mpt$DischargeDateIndexAdmission <- exceldate(mpt$DischargeDateIndexAdmission)
mpt$HistoricIndexDischargeDate <- exceldate(mpt$HistoricIndexDischargeDate)

write.csv(mpt, stdout(), row.names=FALSE)
