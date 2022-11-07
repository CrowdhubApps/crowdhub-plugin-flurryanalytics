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

        guard let apiKey = call.getString("apiKey") else {
            call.reject("Must provide a Flurry API Key")
            return
        }

        var logLevel = FlurryLogLevel.none
        
        switch call.getString("logLevel")?.lowercased() {
        case "verbose":
            logLevel = FlurryLogLevel.all
        case "debug":
            logLevel = FlurryLogLevel.debug
        case "info":
            logLevel = FlurryLogLevel.debug
        case "warn":
            logLevel = FlurryLogLevel.criticalOnly
        case "error":
            logLevel = FlurryLogLevel.criticalOnly
        case .none:
            logLevel = FlurryLogLevel.none
        case .some(_):
            logLevel = FlurryLogLevel.none
        }

        let crashReportingEnabled = call.getBool("crashReportingEnabled", true)
        let appVersion = call.getString("appVersion", "1.0")
        let iapReportingEnabled = call.getBool("iapReportingEnabled", false)

        let sb = FlurrySessionBuilder()
            .build(logLevel: logLevel)
            .build(crashReportingEnabled: crashReportingEnabled)
            .build(appVersion: appVersion)
            .build(iapReportingEnabled: iapReportingEnabled)

        Flurry.startSession(apiKey: apiKey, sessionBuilder: sb)
        call.resolve()
    }

    // StandardEvents: https://developer.yahoo.com/flurry/docs/analytics/standard_events/iOS/
    @objc func logContentRated(_ call: CAPPluginCall) {
        // required
        guard let contentId = call.getString("contentId") else {
            call.reject("Must provide a content ID")
            return
        }
        guard let contentRating = call.getString("contentRating") else {
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

        Flurry.log(standardEvent: FlurryEvent.contentRated, param: param)

        call.resolve()
    }

    @objc func logContentViewed(_ call: CAPPluginCall) {
        // required
        guard let contentId = call.getString("contentId") else {
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

        Flurry.log(standardEvent: FlurryEvent.contentViewed, param: param)

        call.resolve()
    }

    @objc func logContentSaved(_ call: CAPPluginCall) {
        // required
        guard let contentId = call.getString("contentId") else {
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

        Flurry.log(standardEvent: FlurryEvent.contentSaved, param: param)

        call.resolve()
    }

    @objc func logProductCustomized(_ call: CAPPluginCall) {
        let param = FlurryParamBuilder()
            .set(stringVal: "Product customized", param: FlurryStringParam())
        Flurry.log(standardEvent: FlurryEvent.productCustomized, param: param)
    }

    @objc func logSubscriptionStarted(_ call: CAPPluginCall) {
        // required
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        guard let isAnnualSubscription = call.getBool("isAnnualSubscription") else {
            call.reject("Must define whether the subscription is annual or not")
            return
        }

        // recommended
        let trialDays = call.getInt("trialDays")!
        let predictedLTV = call.getString("predictedLTV")!
        let currencyType = call.getString("currencyType")!
        let subscriptionCountry = call.getString("subscriptionCountry")!

        let param = FlurryParamBuilder()
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(booleanVal: isAnnualSubscription, param: FlurryParamBuilder.isAnnualSubscription())
            .set(integerVal: Int32(trialDays), param: FlurryParamBuilder.trialDays())
            .set(stringVal: predictedLTV, param: FlurryParamBuilder.predictedLTV())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: subscriptionCountry, param: FlurryParamBuilder.subscriptionCountry())

        Flurry.log(standardEvent: FlurryEvent.subscriptionStarted, param: param)

        call.resolve()
    }

    @objc func logSubscriptionEnded(_ call: CAPPluginCall) {
        // required
        guard let isAnnualSubscription = call.getBool("isAnnualSubscription") else {
            call.reject("Must define whether the subscription is annual or not")
            return
        }

        // recommended
        let currencyType = call.getString("currencyType")!
        let subscriptionCountry = call.getString("subscriptionCountry")!

        let param = FlurryParamBuilder()
            .set(booleanVal: isAnnualSubscription, param: FlurryParamBuilder.isAnnualSubscription())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: subscriptionCountry, param: FlurryParamBuilder.subscriptionCountry())

        Flurry.log(standardEvent: FlurryEvent.subscriptionEnded, param: param)

        call.resolve()
    }

    @objc func logGroupJoined(_ call: CAPPluginCall) {
        let groupName = call.getString("groupName")!

        let param = FlurryParamBuilder()
            .set(stringVal: groupName, param: FlurryParamBuilder.groupName())

        Flurry.log(standardEvent: FlurryEvent.groupJoined, param: param)
    }

    @objc func logGroupLeft(_ call: CAPPluginCall) {
        let groupName = call.getString("groupName")!

        let param = FlurryParamBuilder()
            .set(stringVal: groupName, param: FlurryParamBuilder.groupName())

        Flurry.log(standardEvent: FlurryEvent.groupLeft, param: param)
    }

    @objc func logLogin(_ call: CAPPluginCall) {
        let userId = call.getString("userId")!
        let method = call.getString("method")!

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.login, param: param)
    }
    @objc func logLogout(_ call: CAPPluginCall) {
        let userId = call.getString("userId")!
        let method = call.getString("method")!

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.logout, param: param)
    }
    @objc func logUserRegistered(_ call: CAPPluginCall) {
        let userId = call.getString("userId")!
        let method = call.getString("method")!

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.userRegistered, param: param)
    }

    @objc func logSearchResultViewed(_ call: CAPPluginCall) {
        let query = call.getString("query")!
        let searchType = call.getString("searchType")!

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())
            .set(stringVal: searchType, param: FlurryParamBuilder.searchType())

        Flurry.log(standardEvent: FlurryEvent.searchResultViewed, param: param)
    }

    @objc func logKeywordSearched(_ call: CAPPluginCall) {
        let query = call.getString("query")!
        let searchType = call.getString("searchType")!

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())
            .set(stringVal: searchType, param: FlurryParamBuilder.searchType())

        Flurry.log(standardEvent: FlurryEvent.keywordSearched, param: param)
    }

    @objc func logLocationSearched(_ call: CAPPluginCall) {
        let query = call.getString("query")!

        let param = FlurryParamBuilder()
            .set(stringVal: query, param: FlurryParamBuilder.query())

        Flurry.log(standardEvent: FlurryEvent.locationSearched, param: param)
    }

    @objc func logInvite(_ call: CAPPluginCall) {
        let userId = call.getString("userId")!
        let method = call.getString("method")!

        let param = FlurryParamBuilder()
            .set(stringVal: userId, param: FlurryParamBuilder.userId())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.invite, param: param)
    }

    @objc func logShare(_ call: CAPPluginCall) {
        guard let socialContentId = call.getString("socialContentId") else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")!
        let method = call.getString("method")!

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())
            .set(stringVal: method, param: FlurryParamBuilder.method())

        Flurry.log(standardEvent: FlurryEvent.share, param: param)

        call.resolve()
    }
    @objc func logLike(_ call: CAPPluginCall) {
        guard let socialContentId = call.getString("socialContentId") else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")!
        let likeType = call.getString("likeType")!

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())
            .set(stringVal: likeType, param: FlurryParamBuilder.likeType())

        Flurry.log(standardEvent: FlurryEvent.like, param: param)

        call.resolve()
    }
    @objc func logComment(_ call: CAPPluginCall) {
        guard let socialContentId = call.getString("socialContentId") else {
            call.reject("Must provide a social content ID")
            return
        }

        let socialContentName = call.getString("socialContentName")!

        let param = FlurryParamBuilder()
            .set(stringVal: socialContentId, param: FlurryParamBuilder.socialContentId())
            .set(stringVal: socialContentName, param: FlurryParamBuilder.socialContentName())

        Flurry.log(standardEvent: FlurryEvent.comment, param: param)

        call.resolve()
    }

    @objc func logMediaCaptured(_ call: CAPPluginCall) {
        let mediaId = call.getString("mediaId")!
        let mediaName = call.getString("mediaName")!
        let mediaType = call.getString("mediaType")!

        let param = FlurryParamBuilder()
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.mediaCaptured, param: param)
    }

    @objc func logMediaStarted(_ call: CAPPluginCall) {
        let mediaId = call.getString("mediaId")!
        let mediaName = call.getString("mediaName")!
        let mediaType = call.getString("mediaType")!

        let param = FlurryParamBuilder()
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.mediaStarted, param: param)
    }

    @objc func logMediaStopped(_ call: CAPPluginCall) {
        guard let duration = call.getInt("duration") else {
            call.reject("Must provide a duration")
            return
        }

        let mediaId = call.getString("mediaId")!
        let mediaName = call.getString("mediaName")!
        let mediaType = call.getString("mediaType")!

        let param = FlurryParamBuilder()
            .set(integerVal: Int32(duration), param: FlurryParamBuilder.duration())
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.mediaStopped, param: param)

        call.resolve()
    }

    @objc func logMediaPaused(_ call: CAPPluginCall) {
        guard let duration = call.getInt("duration") else {
            call.reject("Must provide a duration")
            return
        }

        let mediaId = call.getString("mediaId")!
        let mediaName = call.getString("mediaName")!
        let mediaType = call.getString("mediaType")!

        let param = FlurryParamBuilder()
            .set(integerVal: Int32(duration), param: FlurryParamBuilder.duration())
            .set(stringVal: mediaId, param: FlurryParamBuilder.mediaId())
            .set(stringVal: mediaName, param: FlurryParamBuilder.mediaName())
            .set(stringVal: mediaType, param: FlurryParamBuilder.mediaType())

        Flurry.log(standardEvent: FlurryEvent.mediaPaused, param: param)

        call.resolve()
    }

    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @objc func logCustomEvent(_ call: CAPPluginCall) {
        guard let eventName = call.getString("eventName") else {
            call.reject("Must provide an event name")
            return
        }
        let eventParams = call.getObject("eventParams", [:])
        let eventTimed = call.getBool("eventTimed", false)
        Flurry.log(eventName: eventName, parameters: eventParams, timed: eventTimed)
        call.resolve()
    }

    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @objc func setUserId(_ call: CAPPluginCall) {
        guard let userId = call.getString("userId") else {
            call.reject("Must provide a user ID")
            return
        }
        
        Flurry.set(userId: userId)
        call.resolve()
    }

    @objc func setAge(_ call: CAPPluginCall) {
        guard let userAge = call.getInt("userAge") else {
            call.reject("Must provide a user age")
            return
        }
        
        Flurry.set(age: Int32(userAge))
        call.resolve()
    }

    @objc func setGender(_ call: CAPPluginCall) {
        guard let userGender = call.getString("userGender") else {
            call.reject("Must provide a user gender")
            return
        }
        
        Flurry.set(gender: userGender)
        call.resolve()
    }

    @objc func logError(_ call: CAPPluginCall) {
        let errorId = call.getString("errorId")!
        let errorMessage = call.getString("errorMessage", "An error occurred")
        Flurry.log(errorId: errorId, message: errorMessage, error: "Oh no!" as? any Error)
    }
    
    @objc func logAdClick(_ call: CAPPluginCall){
        let adType = call.getString("adType")!
        let param = FlurryParamBuilder()
            .set(stringVal: adType, param: FlurryParamBuilder.adType())
        
        Flurry.log(standardEvent: FlurryEvent.adClick, param: param)
    }

    @objc func logAdImpression(_ call: CAPPluginCall){
        let adType = call.getString("adType")!
        let param = FlurryParamBuilder()
            .set(stringVal: adType, param: FlurryParamBuilder.adType())
        
        Flurry.log(standardEvent: FlurryEvent.adImpression, param: param)
    }

    @objc func logAdRewarded(_ call: CAPPluginCall){
        let adType = call.getString("adType")!
        let param = FlurryParamBuilder()
            .set(stringVal: adType, param: FlurryParamBuilder.adType())
        
        Flurry.log(standardEvent: FlurryEvent.adRewarded, param: param)
    }

    @objc func logAdSkipped(_ call: CAPPluginCall){
        let adType = call.getString("adType")!
        let param = FlurryParamBuilder()
            .set(stringVal: adType, param: FlurryParamBuilder.adType())
        
        Flurry.log(standardEvent: FlurryEvent.adSkipped, param: param)
    }

    @objc func logCreditsSpent(_ call: CAPPluginCall){
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        let levelNumber = call.getInt("levelNumber")!
        let isCurrencySoft = call.getBool("isCurrencySoft")!
        let creditType = call.getString("creditType")!
        let creditId = call.getString("creditId")!
        let creditName = call.getString("creditName")!
        let currencyType = call.getString("currencyType")!
        
        let param = FlurryParamBuilder()
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(booleanVal: isCurrencySoft, param: FlurryParamBuilder.isCurrencySoft())
            .set(stringVal: creditType, param: FlurryParamBuilder.creditType())
            .set(stringVal: creditId, param: FlurryParamBuilder.creditId())
            .set(stringVal: creditName, param: FlurryParamBuilder.creditName())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
        
        Flurry.log(standardEvent: FlurryEvent.creditsSpent, param: param)
        call.resolve()
    }


    @objc func logCreditsPurchased(_ call: CAPPluginCall){
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        let levelNumber = call.getInt("levelNumber")!
        let isCurrencySoft = call.getBool("isCurrencySoft")!
        let creditType = call.getString("creditType")!
        let creditId = call.getString("creditId")!
        let creditName = call.getString("creditName")!
        let currencyType = call.getString("currencyType")!

        
        let param = FlurryParamBuilder()
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(booleanVal: isCurrencySoft, param: FlurryParamBuilder.isCurrencySoft())
            .set(stringVal: creditType, param: FlurryParamBuilder.creditType())
            .set(stringVal: creditId, param: FlurryParamBuilder.creditId())
            .set(stringVal: creditName, param: FlurryParamBuilder.creditName())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
        
        Flurry.log(standardEvent: FlurryEvent.creditsPurchased, param: param)
        call.resolve()
    }

    @objc func logCreditsEarned(_ call: CAPPluginCall){
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        let levelNumber = call.getInt("levelNumber")!
        let isCurrencySoft = call.getBool("isCurrencySoft")!
        let creditType = call.getString("creditType")!
        let creditId = call.getString("creditId")!
        let creditName = call.getString("creditName")!
        let currencyType = call.getString("currencyType")!
        
        let param = FlurryParamBuilder()
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(booleanVal: isCurrencySoft, param: FlurryParamBuilder.isCurrencySoft())
            .set(stringVal: creditType, param: FlurryParamBuilder.creditType())
            .set(stringVal: creditId, param: FlurryParamBuilder.creditId())
            .set(stringVal: creditName, param: FlurryParamBuilder.creditName())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
        
        Flurry.log(standardEvent: FlurryEvent.creditsEarned, param: param)
        call.resolve()
    }

    @objc func logAchievementUnlocked(_ call: CAPPluginCall){
        let achievementId = call.getString("achievementId")!
        
        let param = FlurryParamBuilder()
            .set(stringVal: achievementId, param: FlurryParamBuilder.achievementId())

        Flurry.log(standardEvent: FlurryEvent.achievementUnlocked, param: param)
    }

    @objc func logLevelCompleted(_ call: CAPPluginCall){
        guard let levelNumber = call.getInt("levelNumber") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelName = call.getString("levelName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(stringVal: levelName, param: FlurryParamBuilder.levelName())

        Flurry.log(standardEvent: FlurryEvent.levelCompleted, param: param)
        call.resolve()
    }

    @objc func logLevelFailed(_ call: CAPPluginCall){
        guard let levelNumber = call.getInt("levelNumber") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelName = call.getString("levelName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(stringVal: levelName, param: FlurryParamBuilder.levelName())

        Flurry.log(standardEvent: FlurryEvent.levelFailed, param: param)
        call.resolve()
    }

    @objc func logLevelUp(_ call: CAPPluginCall){
        guard let levelNumber = call.getInt("levelNumber") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelName = call.getString("levelName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(stringVal: levelName, param: FlurryParamBuilder.levelName())

        Flurry.log(standardEvent: FlurryEvent.levelUp, param: param)
        call.resolve()
    }

    @objc func logLevelStarted(_ call: CAPPluginCall){
        guard let levelNumber = call.getInt("levelNumber") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelName = call.getString("levelName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(stringVal: levelName, param: FlurryParamBuilder.levelName())

        Flurry.log(standardEvent: FlurryEvent.levelStarted, param: param)
        call.resolve()
    }

    @objc func logLevelSkip(_ call: CAPPluginCall){
        guard let levelNumber = call.getInt("levelNumber") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelName = call.getString("levelName")!

        let param = FlurryParamBuilder()
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            .set(stringVal: levelName, param: FlurryParamBuilder.levelName())

        Flurry.log(standardEvent: FlurryEvent.levelSkip, param: param)
        call.resolve()
    }

    @objc func logScorePosted(_ call: CAPPluginCall){
        guard let score = call.getInt("score") else {
            call.reject("Must provide a level number")
            return
        }
        
        let levelNumber = call.getInt("levelNumber")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(score), param: FlurryParamBuilder.score())
            .set(integerVal: Int32(levelNumber), param: FlurryParamBuilder.levelNumber())
            
        Flurry.log(standardEvent: FlurryEvent.scorePosted, param: param)
        call.resolve()
    }

    @objc func logAppActivated(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.appActivated, param: nil)
    }

    @objc func logApplicationSubmitted(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.applicationSubmitted, param: nil)
    }

    @objc func logAddItemToCart(_ call: CAPPluginCall){
        guard let itemCount = call.getInt("itemCount") else {
            call.reject("Must provide an item count")
            return
        }
        
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        
        let itemId = call.getString("itemId")!
        let itemName = call.getString("itemName")!
        let itemType = call.getString("itemType")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(itemCount), param: FlurryParamBuilder.itemCount())
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemType, param: FlurryParamBuilder.itemType())
        
        Flurry.log(standardEvent: FlurryEvent.addItemToCart, param: param)
        call.resolve()
        
    }

    @objc func logAddItemToWishList(_ call: CAPPluginCall){
        guard let itemCount = call.getInt("itemCount") else {
            call.reject("Must provide an item count")
            return
        }
        
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        
        let itemId = call.getString("itemId")!
        let itemName = call.getString("itemName")!
        let itemType = call.getString("itemType")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(itemCount), param: FlurryParamBuilder.itemCount())
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemType, param: FlurryParamBuilder.itemType())
        
        Flurry.log(standardEvent: FlurryEvent.addItemToWishList, param: param)
        call.resolve()
    }

    @objc func logCompletedCheckout(_ call: CAPPluginCall){
        guard let itemCount = call.getInt("itemCount") else {
            call.reject("Must provide an item count")
            return
        }
        
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        let currencyType = call.getString("currencyType")!
        let transactionId = call.getString("transactionId")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(itemCount), param: FlurryParamBuilder.itemCount())
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: transactionId, param: FlurryParamBuilder.transactionId())
        
        Flurry.log(standardEvent: FlurryEvent.completedCheckout, param: param)
        call.resolve()
    }

    @objc func logPaymentInfoAdded(_ call: CAPPluginCall){
        guard let success = call.getBool("success") else {
            call.reject("Must provide a success flag")
            return
        }
        
        guard let paymentType = call.getString("paymentType") else {
            call.reject("Must provide a payment type")
            return
        }
        
        let param = FlurryParamBuilder()
            .set(booleanVal: success, param: FlurryParamBuilder.success())
            .set(stringVal: paymentType, param: FlurryParamBuilder.paymentType())
        
        Flurry.log(standardEvent: FlurryEvent.paymentInfoAdded, param: param)
        call.resolve()
    }

    @objc func logItemViewed(_ call: CAPPluginCall){
        guard let itemId = call.getString("itemId") else {
            call.reject("Must provide an item ID")
            return
        }
        
        let price = call.getDouble("price")!
        let itemName = call.getString("itemName")!
        let itemType = call.getString("itemType")!

        
        let param = FlurryParamBuilder()
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemType, param: FlurryParamBuilder.itemType())
        
        Flurry.log(standardEvent: FlurryEvent.itemViewed, param: param)
        call.resolve()
    }

    @objc func logItemListViewed(_ call: CAPPluginCall){
        guard let itemListType = call.getString("itemListType") else {
            call.reject("Must provide an item list type")
            return
        }
        
        let param = FlurryParamBuilder()
            .set(stringVal: itemListType, param: FlurryParamBuilder.itemListType())
        
        Flurry.log(standardEvent: FlurryEvent.itemListViewed, param: param)
        call.resolve()
    }

    @objc func logPurchased(_ call: CAPPluginCall){
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        guard let success = call.getBool("success") else {
            call.reject("Must provide a success flag")
            return
        }
        
        let itemCount = call.getInt("itemCount")!
        let itemId = call.getString("itemId")!
        let itemName = call.getString("itemName")!
        let itemType = call.getString("itemType")!
        let currencyType = call.getString("currencyType")!
        let transactionId = call.getString("transactionId")!
        
        let param = FlurryParamBuilder()
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(booleanVal: success, param: FlurryParamBuilder.success())
            .set(integerVal: Int32(itemCount), param: FlurryParamBuilder.itemCount())
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemType, param: FlurryParamBuilder.itemType())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
            .set(stringVal: transactionId, param: FlurryParamBuilder.transactionId())
        
        Flurry.log(standardEvent: FlurryEvent.purchased, param: param)
        call.resolve()
    }

    @objc func logPurchaseRefunded(_ call: CAPPluginCall){
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        
        let currencyType = call.getString("currencyType")!
        
        let param = FlurryParamBuilder()
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())

        Flurry.log(standardEvent: FlurryEvent.purchaseRefunded, param: param)
        call.resolve()
    }

    @objc func logRemoveItemFromCart(_ call: CAPPluginCall){
        guard let itemId = call.getString("itemId") else {
            call.reject("Must provide an item ID")
            return
        }
        
        let price = call.getDouble("price")!
        let itemName = call.getString("itemName")!
        let itemType = call.getString("itemType")!
        
        let param = FlurryParamBuilder()
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemType, param: FlurryParamBuilder.itemType())

        Flurry.log(standardEvent: FlurryEvent.removeItemFromCart, param: param)
        call.resolve()
    }

    @objc func logCheckoutInitiated(_ call: CAPPluginCall){
        guard let totalAmount = call.getDouble("totalAmount") else {
            call.reject("Must provide a total amount")
            return
        }
        
        guard let itemCount = call.getInt("itemCount") else {
            call.reject("Must provide an item count")
            return
        }
        
        let param = FlurryParamBuilder()
            .set(doubleVal: totalAmount, param: FlurryParamBuilder.totalAmount())
            .set(integerVal: Int32(itemCount), param: FlurryParamBuilder.itemCount())

        
        Flurry.log(standardEvent: FlurryEvent.checkoutInitiated, param: param)
        call.resolve()
    }

    @objc func logFundsDonated(_ call: CAPPluginCall){
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        
        let currencyType = call.getString("currencyType")!
        
        let param = FlurryParamBuilder()
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: currencyType, param: FlurryParamBuilder.currencyType())
        
        Flurry.log(standardEvent: FlurryEvent.fundsDonated, param: param)
        call.resolve()
    }

    @objc func logUserScheduled(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.userScheduled, param: nil)
    }

    @objc func logOfferPresented(_ call: CAPPluginCall){
        guard let itemId = call.getString("itemId") else {
            call.reject("Must provide an item ID")
            return
        }
        
        guard let price = call.getDouble("price") else {
            call.reject("Must provide a price")
            return
        }
        
        let itemName = call.getString("itemName")!
        let itemCategory = call.getString("itemCategory")!
        
        let param = FlurryParamBuilder()
            .set(stringVal: itemId, param: FlurryParamBuilder.itemId())
            .set(doubleVal: price, param: FlurryParamBuilder.price())
            .set(stringVal: itemName, param: FlurryParamBuilder.itemName())
            .set(stringVal: itemCategory, param: FlurryParamBuilder.itemCategory())

        Flurry.log(standardEvent: FlurryEvent.offerPresented, param: param)
        call.resolve()
    }

    @objc func logTutorialStarted(_ call: CAPPluginCall){
        let tutorialName = call.getString("tutorialName")!
        
        let param = FlurryParamBuilder()
            .set(stringVal: tutorialName, param: FlurryParamBuilder.tutorialName())

        Flurry.log(standardEvent: FlurryEvent.tutorialStarted, param: param)
    }

    @objc func logTutorialCompleted(_ call: CAPPluginCall){
        let tutorialName = call.getString("tutorialName")!
        
        let param = FlurryParamBuilder()
            .set(stringVal: tutorialName, param: FlurryParamBuilder.tutorialName())

        Flurry.log(standardEvent: FlurryEvent.tutorialCompleted, param: param)
    }

    @objc func logTutorialStepCompleted(_ call: CAPPluginCall){
        guard let stepNumber = call.getInt("stepNumber") else {
            call.reject("Must provide a step number")
            return
        }
        
        let tutorialName = call.getString("tutorialName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(stepNumber), param: FlurryParamBuilder.stepNumber())
            .set(stringVal: tutorialName, param: FlurryParamBuilder.tutorialName())

        Flurry.log(standardEvent: FlurryEvent.tutorialStepCompleted, param: param)
        call.resolve()
    }

    @objc func logTutorialSkipped(_ call: CAPPluginCall){
        guard let stepNumber = call.getInt("stepNumber") else {
            call.reject("Must provide a step number")
            return
        }
        
        let tutorialName = call.getString("tutorialName")!
        
        let param = FlurryParamBuilder()
            .set(integerVal: Int32(stepNumber), param: FlurryParamBuilder.stepNumber())
            .set(stringVal: tutorialName, param: FlurryParamBuilder.tutorialName())

        Flurry.log(standardEvent: FlurryEvent.tutorialSkipped, param: param)
        call.resolve()
    }

    @objc func logPrivacyPromptDisplayed(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.privacyPromptDisplayed, param: nil)
    }

    @objc func logPrivacyOptIn(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.privacyOptIn, param: nil)
    }

    @objc func logPrivacyOptOut(_ call: CAPPluginCall){
        Flurry.log(standardEvent: FlurryEvent.privacyOptOut, param: nil)
    }
}
