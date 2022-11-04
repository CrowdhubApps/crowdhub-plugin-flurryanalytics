import Foundation
import Capacitor
import Flurry_iOS_SDK

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(FlurryAnalyticsPlugin)
public class FlurryAnalyticsPlugin: CAPPlugin {
    private let implementation = FlurryAnalytics()

    @objc func initialize(_ call: CAPPluginCall) {
        // TODO:
        let logLevel = call.getString("logLevel", "DEBUG")
        let crashReportingEnabled = call.getBool("crashReportingEnabled", true)
        let appVersion = call.getString("appVersion", "1.0")
        let iapReportingEnabled = call.getBool("iapReportingEnabled", true)
        let apiKey = call.getString("apiKey")
        
        let sb = FlurrySessionBuilder()
                  .build(logLevel: FlurryLogLevel.all)
                  .build(crashReportingEnabled: crashReportingEnabled)
                  .build(appVersion: appVersion)
                  .build(iapReportingEnabled: iapReportingEnabled)
              
            Flurry.startSession(apiKey: apiKey, sessionBuilder: sb)
    }
    
    
    
    //StandardEvents: https://developer.yahoo.com/flurry/docs/analytics/standard_events/iOS/
    
    
    
    
    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @objc func logCustomEvent(_ call: CAPPluginCall) {
        let eventName = call.getString("eventName","")
        let eventParams = call.getObject("eventParams", [:])
        let eventTimed = call.getBool("eventTimed",false)
        call.resolve([
            "eventName": Flurry.log(eventName: eventName, parameters: eventParams, timed: eventTimed)
        ])
    }
    
    
    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @objc func setUserId(_ call: CAPPluginCall) {
        let userId = call.getString("userId","")
        call.resolve([
            "userId": Flurry.set(userId: userId)
        ])
    }

    @objc func setAge(_ call: CAPPluginCall) {
        let userAge = call.getInt("userAge",0)
        call.resolve([
            "userAge": Flurry.set(age: userAge)
        ])
    }

    @objc func setGender(_ call: CAPPluginCall) {
        let userGender = call.getString("userGender", "")
        call.resolve([
            "userGender": Flurry.set(gender: userGender)
        ])
    }

    @objc func logError(_ call: CAPPluginCall) {
        let errorId = call.getString("errorId", "")
        let errorMessage = call.getString("errorMessage", "")
        let error = call.getString("error", "")
        call.resolve([
            "error": Flurry.log(errorId: errorId, message: errorMessage, error: error)
        ])
    }
}
