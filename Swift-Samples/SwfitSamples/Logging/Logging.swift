import os
class LoggingSamples{
    
    static func main(){
        sample1()
        privacySample()
        
    }
    
}


fileprivate func privacySample(){
    let logger=Logger(subsystem: app, category: "privacySample")
    let bankAccount="133"
    logger.log("Bank account:\(bankAccount, privacy: .public)")//force to visible in log
    
}
fileprivate func sample1(){
    let logger=Logger(subsystem: app, category: "sample1")
    logger.log("this the first log")
    logger.info("this is info log")
    logger.debug("this is debug log")
    logger.trace("this is trace log")
    
    
}


fileprivate let app="com.kz.cse.SwiftSample"
fileprivate let tag="LoggingSamples"
