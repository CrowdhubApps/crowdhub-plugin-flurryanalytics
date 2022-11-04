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

    // Initialize: https://developer.yahoo.com/flurry/docs/integrateflurry/ios/#swift
    @objc func initialize(_ call: CAPPluginCall) {
        
        guard let apiKey = call.getString("apiKey") as? String else {
            call.reject("Must provide a Flurry API Key")
            return
        }
        
        let logLevel = FlurryLogLevelCriticalOnly
        
        switch call.getString("logLevel")?.lowercased() {
            case "verbose":
                logLevel = FlurryLogLevelAll
            case "debug":
                logLevel = FlurryLogLevelDebug
            case "info":
                logLevel = FlurryLogLevelDebug
            case "warn":
                logLevel = FlurryLogLevelCriticalOnly
            case "error":
                logLevel = FlurryLogLevelCriticalOnly
        }
        
        let crashReportingEnabled = call.getBool("crashReportingEnabled", true)
        let appVersion = call.getString("appVersion", "1.0")
        let iapReportingEnabled = call.getBool("iapReportingEnabled", true)

        let sb = FlurrySessionBuilder()
            .build(logLevel: logLevel)
            .build(crashReportingEnabled: crashReportingEnabled)
            .build(appVersion: appVersion)
            .build(iapReportingEnabled: iapReportingEnabled)
        
        Flurry.startSession(apiKey: apiKey, sessionBuilder: sb)
        call.resolve()
    }
    
    
    
    // StandardEvents: https://developer.yahoo.com/flurry/docs/analytics/standard_events/iOS/
    @objc func logContentRated(_ call: CAPPluginCall){
        // required
        guard let contentId = call.getString("contentId") as? String else {
            call.reject("Must provide a content ID")
            return
        }
        guard let contentRating = call.getString("contentRating") as? String else {
            call.reject("Must provide a content rating")
            return
        }
        // recommended
        let contentName = call.getString("contentName", "")
        let contentType = call.getString("contentType", "")
        
        let param = FlurryParamBuilder()
            .set(stringVal: contentId, param: FlurryParamBuilder.contentId())
            .set(stringVal: contentRating, param: FlurryParamBuilder.rating())
            .set(stringVal: contentName, param: FlurryParamBuilder.contentName())
            .set(stringVal: contentType, param: FlurryParamBuilder.contentType())
        
        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_CONTENT_RATED, param: param)
        
        call.resolve()
    }
    
    @objc func logContentViewed(_ call: CAPPluginCall){
        // required
        guard let contentId = call.getString("contentId") as? String else {
            call.reject("Must provide a content ID")
            return
        }

        // recommended
        let contentName = call.getString("contentName", "")
        let contentType = call.getString("contentType", "")
        
        let param = FlurryParamBuilder()
            .set(stringVal: contentId, param: FlurryParamBuilder.contentId())
            .set(stringVal: contentName, param: FlurryParamBuilder.contentName())
            .set(stringVal: contentType, param: FlurryParamBuilder.contentType())
        
        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_CONTENT_VIEWED, param: param)
        
        call.resolve()
    }

    @objc func logContentSaved(_ call: CAPPluginCall){
        // required
        guard let contentId = call.getString("contentId") as? String else {
            call.reject("Must provide a content ID")
            return
        }

        // recommended
        let contentName = call.getString("contentName", "")
        let contentType = call.getString("contentType", "")
        
        let param = FlurryParamBuilder()
            .set(stringVal: contentId, param: FlurryParamBuilder.contentId())
            .set(stringVal: contentName, param: FlurryParamBuilder.contentName())
            .set(stringVal: contentType, param: FlurryParamBuilder.contentType())
        
        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_CONTENT_SAVED, param: param)
        
        call.resolve()
    }

    @objc func logProductCustomized(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_PRODUCT_CUSTOMIZED)
        
        call.resolve()
    }
    
    @objc func logSubscriptionStarted(_ call: CAPPluginCall){
        // required
        guard let price = call.getDouble("price") as? Double else {
            call.reject("Must provide a price")
            return
        }
        guard let isAnnualSubscription = call.getBool("isAnnualSubscription") as? Bool else {
            call.reject("Must define whether the subscription is annual or not")
            return
        }

        // recommended
        let trialDays = call.getInt("trialDays")
        let predictedLTV = call.getString("predictedLTV")
        let currencyType = call.getString("currencyType")
        let subscriptionCountry = call.getString("subscriptionCountry")
        
        let param = FlurryParamBuilder()
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(boolVal: isAnnualSubscription, param: FlurryParamBuilder.isAnnualSubscription())
            .set(intVal: trialDays, param: FlurryParamBuilder.trialDays())
            .set(stringVal: predictedLTV, param: FlurryParamBuilder.predictedLTV())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: subscriptionCountry, param: FlurryParamBuilder.subscriptionCountry())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_SUBSCRIPTION_STARTED, param: param)
        
        call.resolve()
    }

    @objc func logSubscriptionEnded(_ call: CAPPluginCall){
        // required
        guard let isAnnualSubscription = call.getBool("isAnnualSubscription") as? Bool else {
            call.reject("Must define whether the subscription is annual or not")
            return
        }

        // recommended
        let currencyType = call.getString("currencyType")
        let subscriptionCountry = call.getString("subscriptionCountry")
        
        let param = FlurryParamBuilder()
            .set(boolVal: isAnnualSubscription, param: FlurryParamBuilder.isAnnualSubscription())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: subscriptionCountry, param: FlurryParamBuilder.subscriptionCountry())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_SUBSCRIPTION_ENDED, param: param)
        
        call.resolve()
    }

    @objc func logGroupJoined(_ call: CAPPluginCall){}
    @objc func logGroupLeft(_ call: CAPPluginCall){}
    
    @objc func logLogin(_ call: CAPPluginCall){}
    @objc func logLogout(_ call: CAPPluginCall){}
    @objc func logUserRegistered(_ call: CAPPluginCall){}
    
    @objc func logSearchResultViewed(_ call: CAPPluginCall){}
    @objc func logKeywordSearched(_ call: CAPPluginCall){}
    @objc func logLocationSearched(_ call: CAPPluginCall){}
    
    @objc func logInvite(_ call: CAPPluginCall){}
    @objc func logShare(_ call: CAPPluginCall){}
    @objc func logLike(_ call: CAPPluginCall){}
    @objc func logComment(_ call: CAPPluginCall){}
    
    @objc func logMediaCaptured(_ call: CAPPluginCall){}
    @objc func logMediaStarted(_ call: CAPPluginCall){}
    @objc func logMediaStopped(_ call: CAPPluginCall){}
    @objc func logMediaPaused(_ call: CAPPluginCall){}
    
    
    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @objc func logCustomEvent(_ call: CAPPluginCall) {
        guard let eventName = call.getString("eventName") as? String else {
            call.reject("Must provide an event name")
            return
        }
        let eventParams = call.getObject("eventParams", [:])
        let eventTimed = call.getBool("eventTimed",false)
        Flurry.log(eventName: eventName, parameters: eventParams, timed: eventTimed)
        call.resolve()
    }
    
    
    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @objc func setUserId(_ call: CAPPluginCall) {
        guard let userId = call.getString("userId") as? String else {
            call.reject("Must provide a user ID")
            return
        }
        Flurry.set(userId: userId)
        call.resolve()
    }

    @objc func setAge(_ call: CAPPluginCall) {
        guard let userAge = call.getInt("userAge") as? Int > 0 else {
            call.reject("Must provide a user age")
            return
        }
        Flurry.set(age: userAge)
        call.resolve()
    }

    @objc func setGender(_ call: CAPPluginCall) {
        guard let userGender = call.getString("userGender") as? String else {
            call.reject("Must provide a user gender")
            return
        }
        Flurry.set(gender: userGender)
        call.resolve()
    }

    @objc func logError(_ call: CAPPluginCall) {
        let errorId = call.getString("errorId", "")
        let errorMessage = call.getString("errorMessage", "An error occurred")
        let error = call.getString("error", "")
        Flurry.log(errorId: errorId, message: errorMessage, error: error)
        call.resolve()
    }
}
