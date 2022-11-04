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

    @objc func logGroupJoined(_ call: CAPPluginCall){
        let groupName = call.getString("groupName")

        let param = FlurryParamBuilder()
            .set(stringVal: groupName, param: FlurryParamBuilder.groupName())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_GROUP_JOINED, param: param)
        
        call.resolve()
    }
    @objc func logGroupLeft(_ call: CAPPluginCall){
        let groupName = call.getString("groupName")

        let param = FlurryParamBuilder()
            .set(stringVal: groupName, param: FlurryParamBuilder.groupName())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_GROUP_LEFT, param: param)
        
        call.resolve()
    }
    
    @objc func logLogin(_ call: CAPPluginCall){
        let userId = call.getString("userId")
        let method = call.getString("method")

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_LOGIN, param: param)
        
        call.resolve()
    }
    @objc func logLogout(_ call: CAPPluginCall){
        let userId = call.getString("userId")
        let method = call.getString("method")

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_LOGOUT, param: param)
        
        call.resolve()
    }
    @objc func logUserRegistered(_ call: CAPPluginCall){
        let userId = call.getString("userId")
        let method = call.getString("method")

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_USER_REGISTERED, param: param)
        
        call.resolve()
    }
    
    @objc func logSearchResultViewed(_ call: CAPPluginCall){
        let query = call.getString("query")
        let searchType = call.getString("searchType")

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())
            .set(stringVal: searchType, param: FlurryParamBuilder.searchType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_SEARCH_RESULT_VIEWED, param: param)
        
        call.resolve()
    }

    @objc func logKeywordSearched(_ call: CAPPluginCall){
        let query = call.getString("query")
        let searchType = call.getString("searchType")

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())
            .set(stringVal: searchType, param: FlurryParamBuilder.searchType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_KEYWORD_SEARCHED, param: param)
        
        call.resolve()
    }

    @objc func logLocationSearched(_ call: CAPPluginCall){
        let query = call.getString("query")

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_LOCATION_SEARCHED, param: param)
        
        call.resolve()
    }
    
    @objc func logInvite(_ call: CAPPluginCall){
        let userId = call.getString("userId")
        let method = call.getString("method")

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_INVITE, param: param)
        
        call.resolve()
    }

    @objc func logShare(_ call: CAPPluginCall){
        guard let socialContentId = call.getString("socialContentId") as? String else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")
        let method = call.getString("method")

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_SHARE, param: param)
        
        call.resolve()
    }
    @objc func logLike(_ call: CAPPluginCall){
        guard let socialContentId = call.getString("socialContentId") as? String else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")
        let likeType = call.getString("likeType")

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())
            .set(stringVal: likeType, param: FlurryParamBuilder.likeType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_LIKE, param: param)
        
        call.resolve()
    }
    @objc func logComment(_ call: CAPPluginCall){
        guard let socialContentId = call.getString("socialContentId") as? String else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_COMMENT, param: param)
        
        call.resolve()
    }
    
    @objc func logMediaCaptured(_ call: CAPPluginCall){
        let mediaId = call.getString("mediaId")
        let mediaName = call.getString("mediaName")
        let mediaType = call.getString("mediaType")

        let param = FlurryParamBuilder()
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_MEDIA_CAPTURED, param: param)
        
        call.resolve()
    }

    @objc func logMediaStarted(_ call: CAPPluginCall){
        let mediaId = call.getString("mediaId")
        let mediaName = call.getString("mediaName")
        let mediaType = call.getString("mediaType")

        let param = FlurryParamBuilder()
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_MEDIA_STARTED, param: param)
        
        call.resolve()
    }

    @objc func logMediaStopped(_ call: CAPPluginCall){
        guard let duration = call.getInt("duration") as? Int else {
            call.reject("Must provide a duration")
            return
        }

        let mediaId = call.getString("mediaId")
        let mediaName = call.getString("mediaName")
        let mediaType = call.getString("mediaType")

        let param = FlurryParamBuilder()
            .set(intVal: duration, param: FlurryParamBuilder.duration())
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_MEDIA_STOPPED, param: param)
        
        call.resolve()
    }
    
    @objc func logMediaPaused(_ call: CAPPluginCall){
        guard let duration = call.getInt("duration") as? Int else {
            call.reject("Must provide a duration")
            return
        }

        let mediaId = call.getString("mediaId")
        let mediaName = call.getString("mediaName")
        let mediaType = call.getString("mediaType")

        let param = FlurryParamBuilder()
            .set(intVal: duration, param: FlurryParamBuilder.duration())
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.FLURRY_EVENT_MEDIA_PAUSED, param: param)
        
        call.resolve()
    }
    
    
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
