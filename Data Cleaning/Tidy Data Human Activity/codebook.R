codebook <- function(i){
    data2<-read.table("./dataset.txt")
    namesdata <- read.table("./names.txt")
    colnames(data2)<-namesdata[,1]
    print(paste("### ", names(data2[i])))
    # codebook: create summary on variables:
    codebook <- character(86)
    for (i in 3:88){
        if (identical(grep("[Mm]ean", names(data2[i])), integer(0))){
            a1=""
        }
        else{
            a1="Mean value "
        }
        if (identical(grep("[Ss]td", names(data2[i])), integer(0))){
            a2=""
        }
        else{
            a2="Standard deviation "
        }
        if (identical(grep("-Y", names(data2[i])), integer(0))){
            a3=""
        }
        else{
            a3="of Y-axis signal "
        }
        if (identical(grep("-X", names(data2[i])), integer(0))){
            a4=""
        }
        else{
            a4="of X-axis signal "
        }
        if (identical(grep("-Z",  names(data2[i])), integer(0))){
            a5=""
        }
        else{
            a5="of Z-axis signal "
        }
        if (identical(grep("Acc", names(data2[i])), integer(0))){
            a6=""
        }
        else{
            a6=",captured by accelerometer. "
        }
        if (identical(grep("Gyro", names(data2[i])), integer(0))){
            a7=""
        }
        else{
            a7=",captured by gyroscope. "
        }
        if (identical(grep("^t", names(data2[i])), integer(0))){
            a8=""
        }
        else{
            a8="It is a time domain signal, captured at a constant rate of 50 Hz. Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. "
        }
        if (identical(grep("^f", names(data2[i])), integer(0))){
            a9=""
        }
        else{
            a9="Fast Fourier Transform (FFT) is applied on signal and shifts it to frequency domain. "
        }
        if (identical(grep("^angle", names(data2[i])), integer(0))){
            a10=""
        }
        else{
            a10="It is averaged in signal window sample. "
        }   
        if (identical(grep("[Gg]ravity", names(data2[i])), integer(0))){
            a11=""
        }
        else{
            a11="Low pass Butterworth filter with a corner frequency of 0.3 Hz separated it into gravity signal. "
        }
        if (identical(grep("Body", names(data2[i])), integer(0))){
            a12=""
        }
        else{
            a12="Low pass Butterworth filter with a corner frequency of 0.3 Hz separated it into body signal. "
        }
        if (identical(grep("[Mm]ag", names(data2[i])), integer(0))){
            a13=""
        }
        else{
            a13="The magnitude of these three-dimensional signals were calculated using the Euclidean norm. "
        }
        if (identical(grep("[Jj]erk", names(data2[i])), integer(0))){
            a14=""
        }
        else{
            a14="The body linear acceleration and angular velocity were derived in time to obtain signal. "
        }
        codebook<- paste(names(data2[i]), a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,"- Class: ", class(data2[,i]), "- Unique values/levels: [-1;1] ", "- Unit of measurement: NA ", sep="")
    }
    print(codebook)

    #write.table(codebook, file = "./tidydata/code.txt",row.name= FALSE, quote = FALSE)
}