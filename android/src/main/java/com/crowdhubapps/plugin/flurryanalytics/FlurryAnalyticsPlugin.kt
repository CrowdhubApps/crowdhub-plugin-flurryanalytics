package com.crowdhubapps.plugin.flurryanalytics

import android.util.Log
import com.getcapacitor.annotation.CapacitorPlugin
import com.flurry.android.Constants
import com.flurry.android.FlurryAgent
import com.flurry.android.FlurryEvent
import com.flurry.android.FlurryPerformance
import com.getcapacitor.*

@CapacitorPlugin(name = "FlurryAnalytics")
class FlurryAnalyticsPlugin : Plugin() {

    @PluginMethod
    fun initialize(call: PluginCall) {
        val logLevel: Int
        val logEnabled: Boolean
        when (call.getString("logLevel")?.lowercase()) {
            "verbose" -> {
                logLevel = Log.VERBOSE
                logEnabled = true
            }
            "debug" -> {
                logLevel = Log.DEBUG
                logEnabled = true
            }
            "info" -> {
                logLevel = Log.INFO
                logEnabled = true
            }
            "warn" -> {
                logLevel = Log.WARN
                logEnabled = true
            }
            "error" -> {
                logLevel = Log.ERROR
                logEnabled = true
            }
            else -> {
                logLevel = Log.ERROR
                logEnabled = false
            }
        }

        call.getString("apiKey")?.let {
            FlurryAgent.Builder()
                .withLogLevel(logLevel)
                .withLogEnabled(logEnabled)
                .withReportLocation(true)
                .withPerformanceMetrics(FlurryPerformance.ALL)
                .withDataSaleOptOut(true)
                .withIncludeBackgroundSessionsInMetrics(true)
                .build(context, it)
            call.resolve()
        } ?: call.reject("Must provide a Flurry API key")
    }

    // StandardEvents: https://developer.yahoo.com/flurry/docs/analytics/standard_events/iOS/
    @PluginMethod
    fun logContentRated(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("contentId")?.let {
            params.putString(FlurryEvent.Param.CONTENT_ID, it)
        } ?: call.reject("Must provide a content ID")

        call.getString("contentRating")?.let {
            params.putString(FlurryEvent.Param.RATING, it)
        } ?: call.reject("Must provide a content rating")

        call.getString("contentName")?.let {
            params.putString(FlurryEvent.Param.CONTENT_NAME, it)
        }

        call.getString("contentType")?.let {
            params.putString(FlurryEvent.Param.CONTENT_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CONTENT_RATED, params)
        call.resolve()
    }

    @PluginMethod
    fun logContentViewed(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("contentId")?.let {
            params.putString(FlurryEvent.Param.CONTENT_ID, it)
        } ?: call.reject("Must provide a content ID")

        call.getString("contentName")?.let {
            params.putString(FlurryEvent.Param.CONTENT_NAME, it)
        }

        call.getString("contentType")?.let {
            params.putString(FlurryEvent.Param.CONTENT_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CONTENT_VIEWED, params)
        call.resolve()
    }

    @PluginMethod
    fun logContentSaved(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("contentId")?.let {
            params.putString(FlurryEvent.Param.CONTENT_ID, it)
        } ?: call.reject("Must provide a content ID")

        call.getString("contentName")?.let {
            params.putString(FlurryEvent.Param.CONTENT_NAME, it)
        }

        call.getString("contentType")?.let {
            params.putString(FlurryEvent.Param.CONTENT_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CONTENT_SAVED, params)
        call.resolve()
    }

    @PluginMethod
    fun logProductCustomized(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.PRODUCT_CUSTOMIZED, params)
        call.resolve()
    }

    @PluginMethod
    fun logSubscriptionStarted(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: call.reject("Must provide a price")

        call.getBoolean("isAnnualSubscription")?.let {
            params.putBoolean(FlurryEvent.Param.IS_ANNUAL_SUBSCRIPTION, it)
        } ?: call.reject("Must define whether the subscription is annual or not")

        call.getInt("trialDays")?.let {
            params.putInteger(FlurryEvent.Param.TRIAL_DAYS, it)
        }
        call.getString("predictedLTV")?.let {
            params.putString(FlurryEvent.Param.PREDICTED_LTV, it)
        }
        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }
        call.getString("subscriptionCountry")?.let {
            params.putString(FlurryEvent.Param.SUBSCRIPTION_COUNTRY, it)
        }

        FlurryAgent.logEvent(FlurryEvent.SUBSCRIPTION_STARTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logSubscriptionEnded(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getBoolean("isAnnualSubscription")?.let {
            params.putBoolean(FlurryEvent.Param.IS_ANNUAL_SUBSCRIPTION, it)
        } ?: call.reject("Must define whether the subscription is annual or not")

        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }
        call.getString("subscriptionCountry")?.let {
            params.putString(FlurryEvent.Param.SUBSCRIPTION_COUNTRY, it)
        }

        FlurryAgent.logEvent(FlurryEvent.SUBSCRIPTION_ENDED, params)
        call.resolve()
    }

    @PluginMethod
    fun logGroupJoined(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("groupName")?.let {
            params.putString(FlurryEvent.Param.GROUP_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.GROUP_JOINED, params)
        call.resolve()
    }

    @PluginMethod
    fun logGroupLeft(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("groupName")?.let {
            params.putString(FlurryEvent.Param.GROUP_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.GROUP_LEFT, params)
        call.resolve()
    }

    @PluginMethod
    fun logLogin(call: PluginCall) {
        val params = FlurryEvent.Params()


        call.getString("userId")?.let {
            params.putString(FlurryEvent.Param.USER_ID, it)
        }
        call.getString("method")?.let {
            params.putString(FlurryEvent.Param.METHOD, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LOGIN, params)
        call.resolve()
    }

    @PluginMethod
    fun logLogout(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("userId")?.let {
            params.putString(FlurryEvent.Param.USER_ID, it)
        }
        call.getString("method")?.let {
            params.putString(FlurryEvent.Param.METHOD, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LOGOUT, params)
        call.resolve()
    }

    @PluginMethod
    fun logUserRegistered(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("userId")?.let {
            params.putString(FlurryEvent.Param.USER_ID, it)
        }
        call.getString("method")?.let {
            params.putString(FlurryEvent.Param.METHOD, it)
        }

        FlurryAgent.logEvent(FlurryEvent.USER_REGISTERED, params)
        call.resolve()
    }

    @PluginMethod
    fun logSearchResultViewed(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("query")?.let {
            params.putString(FlurryEvent.Param.QUERY, it)
        }
        call.getString("searchType")?.let {
            params.putString(FlurryEvent.Param.SEARCH_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.SEARCH_RESULT_VIEWED, params)
        call.resolve()
    }

    @PluginMethod
    fun logKeywordSearched(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("query")?.let {
            params.putString(FlurryEvent.Param.QUERY, it)
        }
        call.getString("searchType")?.let {
            params.putString(FlurryEvent.Param.SEARCH_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.KEYWORD_SEARCHED, params)
        call.resolve()
    }

    @PluginMethod
    fun logLocationSearched(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("query")?.let {
            params.putString(FlurryEvent.Param.QUERY, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LOCATION_SEARCHED, params)
        call.resolve()
    }

    @PluginMethod
    fun logInvite(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("userId")?.let {
            params.putString(FlurryEvent.Param.USER_ID, it)
        }
        call.getString("method")?.let {
            params.putString(FlurryEvent.Param.METHOD, it)
        }

        FlurryAgent.logEvent(FlurryEvent.INVITE, params)
        call.resolve()
    }

    @PluginMethod
    fun logShare(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("socialContentId")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_ID, it)
        } ?: call.reject("Must provide a social content ID")

        call.getString("socialContentName")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_NAME, it)
        }
        call.getString("method")?.let {
            params.putString(FlurryEvent.Param.METHOD, it)
        }

        FlurryAgent.logEvent(FlurryEvent.SHARE, params)
        call.resolve()
    }

    @PluginMethod
    fun logLike(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("socialContentId")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_ID, it)
        } ?: call.reject("Must provide a social content ID")

        call.getString("socialContentName")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_NAME, it)
        }
        call.getString("likeType")?.let {
            params.putString(FlurryEvent.Param.LIKE_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LIKE, params)
        call.resolve()
    }

    @PluginMethod
    fun logComment(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("socialContentId")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_ID, it)
        } ?: call.reject("Must provide a social content ID")

        call.getString("socialContentName")?.let {
            params.putString(FlurryEvent.Param.SOCIAL_CONTENT_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.COMMENT, params)
        call.resolve()
    }

    @PluginMethod
    fun logMediaCaptured(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("mediaId")?.let {
            params.putString(FlurryEvent.Param.MEDIA_ID, it)
        }
        call.getString("mediaName")?.let {
            params.putString(FlurryEvent.Param.MEDIA_NAME, it)
        }
        call.getString("mediaType")?.let {
            params.putString(FlurryEvent.Param.MEDIA_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.MEDIA_CAPTURED, params)
        call.resolve()
    }

    @PluginMethod
    fun logMediaStarted(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getString("mediaId")?.let {
            params.putString(FlurryEvent.Param.MEDIA_ID, it)
        }
        call.getString("mediaName")?.let {
            params.putString(FlurryEvent.Param.MEDIA_NAME, it)
        }
        call.getString("mediaType")?.let {
            params.putString(FlurryEvent.Param.MEDIA_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.MEDIA_STARTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logMediaStopped(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getInt("duration")?.let {
            params.putInteger(FlurryEvent.Param.DURATION, it)
        } ?: call.reject("Must provide a duration")

        call.getString("mediaId")?.let {
            params.putString(FlurryEvent.Param.MEDIA_ID, it)
        }
        call.getString("mediaName")?.let {
            params.putString(FlurryEvent.Param.MEDIA_NAME, it)
        }
        call.getString("mediaType")?.let {
            params.putString(FlurryEvent.Param.MEDIA_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.MEDIA_STOPPED, params)
        call.resolve()
    }

    @PluginMethod
    fun logMediaPaused(call: PluginCall) {
        val params = FlurryEvent.Params()

        call.getInt("duration")?.let {
            params.putInteger(FlurryEvent.Param.DURATION, it)
        } ?: run {
            call.reject("Must provide a duration")
            return
        }

        call.getString("mediaId")?.let {
            params.putString(FlurryEvent.Param.MEDIA_ID, it)
        }
        call.getString("mediaName")?.let {
            params.putString(FlurryEvent.Param.MEDIA_NAME, it)
        }
        call.getString("mediaType")?.let {
            params.putString(FlurryEvent.Param.MEDIA_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.MEDIA_PAUSED, params)
        call.resolve()
    }

    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @PluginMethod
    fun logCustomEvent(call: PluginCall) {

        var eventName = ""
        call.getString("eventName")?.let {
            eventName = it
        } ?: run {
            call.reject("Must provide a custom event name")
            return
        }

        val isTimed: Boolean = call.getBoolean("eventTimed") == true

        val eventMap: MutableMap<String, String> = mutableMapOf()
        call.getObject("eventParams")?.let {
            val keys = it.names()
            if (keys != null) {
                for (i in 0 until keys.length()) {
                    it.getString(keys.getString(i))
                        ?.let { it1 -> eventMap.put(keys.getString(i), it1) }
                }
            }
        }

        FlurryAgent.logEvent(eventName, eventMap, isTimed)
        call.resolve()
    }

    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @PluginMethod
    fun setUserId(call: PluginCall) {
        call.getString("userId")?.let {
            FlurryAgent.setUserId(it)
            call.resolve()
        } ?: call.reject("Must provide a user ID")
    }

    @PluginMethod
    fun setAge(call: PluginCall) {
        call.getInt("userAge")?.let {
            if (it !in 1..109) {
                call.reject("Must provide an age between 1 and 109")
                return
            }
            FlurryAgent.setAge(it)
            call.resolve()
        } ?: call.reject("Must provide a user age")
    }

    @PluginMethod
    fun setGender(call: PluginCall) {
        call.getString("userGender")?.let {
            val userGender: Byte = when (it) {
                "m" -> Constants.MALE
                "f" -> Constants.FEMALE
                else -> {
                    call.reject("Must provide a user gender of either m or f")
                    return
                }
            }
            FlurryAgent.setGender(userGender)
            call.resolve()
        } ?: call.reject("Must provide a user gender")
    }

    @PluginMethod
    fun logError(call: PluginCall) {
        FlurryAgent.onError("", "An error has occurred", "")
        call.resolve()
    }

    @PluginMethod
    fun logAdClick(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("adType")?.let {
            params.putString(FlurryEvent.Param.AD_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.AD_CLICK, params)
        call.resolve()
    }

    @PluginMethod
    fun logAdImpression(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("adType")?.let {
            params.putString(FlurryEvent.Param.AD_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.AD_IMPRESSION, params)
        call.resolve()
    }

    @PluginMethod
    fun logAdRewarded(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("adType")?.let {
            params.putString(FlurryEvent.Param.AD_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.AD_REWARDED, params)
        call.resolve()
    }

    @PluginMethod
    fun logAdSkipped(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("adType")?.let {
            params.putString(FlurryEvent.Param.AD_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.AD_SKIPPED, params)
        call.resolve()
    }

    @PluginMethod
    fun logCreditsSpent(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("totalAmount")?.let {
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        }
        call.getBoolean("isCurrencySoft")?.let {
            params.putBoolean(FlurryEvent.Param.IS_CURRENCY_SOFT, it)
        }
        call.getString("creditType")?.let {
            params.putString(FlurryEvent.Param.CREDIT_TYPE, it)
        }
        call.getString("creditId")?.let {
            params.putString(FlurryEvent.Param.CREDIT_ID, it)
        }
        call.getString("creditName")?.let {
            params.putString(FlurryEvent.Param.CREDIT_NAME, it)
        }
        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CREDITS_SPENT, params)
        call.resolve()
    }


    @PluginMethod
    fun logCreditsPurchased(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("totalAmount")?.let {
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        }
        call.getBoolean("isCurrencySoft")?.let {
            params.putBoolean(FlurryEvent.Param.IS_CURRENCY_SOFT, it)
        }
        call.getString("creditType")?.let {
            params.putString(FlurryEvent.Param.CREDIT_TYPE, it)
        }
        call.getString("creditId")?.let {
            params.putString(FlurryEvent.Param.CREDIT_ID, it)
        }
        call.getString("creditName")?.let {
            params.putString(FlurryEvent.Param.CREDIT_NAME, it)
        }
        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CREDITS_PURCHASED, params)
        call.resolve()
    }

    @PluginMethod
    fun logCreditsEarned(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("totalAmount")?.let {
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        }
        call.getBoolean("isCurrencySoft")?.let {
            params.putBoolean(FlurryEvent.Param.IS_CURRENCY_SOFT, it)
        }
        call.getString("creditType")?.let {
            params.putString(FlurryEvent.Param.CREDIT_TYPE, it)
        }
        call.getString("creditId")?.let {
            params.putString(FlurryEvent.Param.CREDIT_ID, it)
        }
        call.getString("creditName")?.let {
            params.putString(FlurryEvent.Param.CREDIT_NAME, it)
        }
        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CREDITS_EARNED, params)
        call.resolve()
    }

    @PluginMethod
    fun logAchievementUnlocked(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("achievementId")?.let {
            params.putString(FlurryEvent.Param.ACHIEVEMENT_ID, it)
        }

        FlurryAgent.logEvent(FlurryEvent.ACHIEVEMENT_UNLOCKED,params)
        call.resolve()
    }

    @PluginMethod
    fun logLevelCompleted(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        } ?: run {
            call.reject("Must provide a level number")
            return
        }

        call.getString("levelName")?.let {
            params.putString(FlurryEvent.Param.LEVEL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LEVEL_COMPLETED, params)
        call.resolve()
    }

    @PluginMethod
    fun logLevelFailed(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        } ?: run {
            call.reject("Must provide a level number")
            return
        }

        call.getString("levelName")?.let {
            params.putString(FlurryEvent.Param.LEVEL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LEVEL_FAILED, params)
        call.resolve()
    }

    @PluginMethod
    fun logLevelUp(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        } ?: run {
            call.reject("Must provide a level number")
            return
        }

        call.getString("levelName")?.let {
            params.putString(FlurryEvent.Param.LEVEL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LEVEL_UP, params)
        call.resolve()
    }

    @PluginMethod
    fun logLevelStarted(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        } ?: run {
            call.reject("Must provide a level number")
            return
        }

        call.getString("levelName")?.let {
            params.putString(FlurryEvent.Param.LEVEL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LEVEL_STARTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logLevelSkip(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        } ?: run {
            call.reject("Must provide a level number")
            return
        }

        call.getString("levelName")?.let {
            params.putString(FlurryEvent.Param.LEVEL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.LEVEL_SKIP, params)
        call.resolve()
    }

    @PluginMethod
    fun logScorePosted(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getInt("score")?.let {
            params.putInteger(FlurryEvent.Param.SCORE, it)
        } ?: run {
            call.reject("Must provide a score")
            return
        }

        call.getInt("levelNumber")?.let {
            params.putInteger(FlurryEvent.Param.LEVEL_NUMBER, it)
        }

        FlurryAgent.logEvent(FlurryEvent.SCORE_POSTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logAppActivated(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.APP_ACTIVATED, null)
        call.resolve()
    }

    @PluginMethod
    fun logApplicationSubmitted(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.APPLICATION_SUBMITTED, null)
        call.resolve()
    }

    @PluginMethod
    fun logAddItemToCart(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getInt("itemCount")?.let {
            params.putInteger(FlurryEvent.Param.ITEM_COUNT, it)
        } ?: run {
            call.reject("Must provide an item count")
            return
        }

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: run {
            call.reject("Must provide a price")
            return
        }

        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        }
        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.ADD_ITEM_TO_CART, params)
        call.resolve()
    }

    @PluginMethod
    fun logAddItemToWishList(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getInt("itemCount")?.let {
            params.putInteger(FlurryEvent.Param.ITEM_COUNT, it)
        } ?: run {
            call.reject("Must provide an item count")
            return
        }

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: run {
            call.reject("Must provide a price")
            return
        }

        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        }
        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.ADD_ITEM_TO_WISH_LIST, params)
        call.resolve()
    }

    @PluginMethod
    fun logCompletedCheckout(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getInt("itemCount")?.let {
            params.putInteger(FlurryEvent.Param.ITEM_COUNT, it)
        } ?: run {
            call.reject("Must provide an item count")
            return
        }

        call.getDouble("totalAmount")?.let {
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }
        call.getString("transactionId")?.let {
            params.putString(FlurryEvent.Param.TRANSACTION_ID, it)
        }

        FlurryAgent.logEvent(FlurryEvent.COMPLETED_CHECKOUT, params)
        call.resolve()
    }

    @PluginMethod
    fun logPaymentInfoAdded(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getBoolean("success")?.let{
            params.putBoolean(FlurryEvent.Param.SUCCESS, it)
        } ?: run {
            call.reject("Must provide a success flag")
            return
        }

        call.getString("paymentType")?.let {
            params.putString(FlurryEvent.Param.PAYMENT_TYPE, it)
        } ?: run {
            call.reject("Must provide a payment type")
            return
        }

        FlurryAgent.logEvent(FlurryEvent.PAYMENT_INFO_ADDED, params)
        call.resolve()
    }

    @PluginMethod
    fun logItemViewed(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        } ?: run {
            call.reject("Must provide an item ID")
            return
        }

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        }
        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.ITEM_VIEWED, params)
        call.resolve()
    }

    @PluginMethod
    fun logItemListViewed(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getString("itemListType")?.let {
            params.putString(FlurryEvent.Param.ITEM_LIST_TYPE, it)
        } ?: run {
            call.reject("Must provide an item list type")
            return
        }

        FlurryAgent.logEvent(FlurryEvent.ITEM_LIST_VIEWED, params)
        call.resolve()
    }

    @PluginMethod
    fun logPurchased(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("totalAmount")?.let{
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getBoolean("success")?.let{
            params.putBoolean(FlurryEvent.Param.SUCCESS, it)
        } ?: run {
            call.reject("Must provide a success flag")
            return
        }

        call.getInt("itemCount")?.let {
            params.putInteger(FlurryEvent.Param.ITEM_COUNT, it)
        }
        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        }
        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }
        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }
        call.getString("transactionId")?.let {
            params.putString(FlurryEvent.Param.TRANSACTION_ID, it)
        }

        FlurryAgent.logEvent(FlurryEvent.PURCHASED, params)
        call.resolve()
    }

    @PluginMethod
    fun logPurchaseRefunded(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: run {
            call.reject("Must provide a price")
            return
        }

        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.PURCHASE_REFUNDED, params)
        call.resolve()
    }

    @PluginMethod
    fun logRemoveItemFromCart(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        } ?: run {
            call.reject("Must provide an item ID")
            return
        }

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        }
        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.REMOVE_ITEM_FROM_CART, params)
        call.resolve()
    }

    @PluginMethod
    fun logCheckoutInitiated(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("totalAmount")?.let{
            params.putDouble(FlurryEvent.Param.TOTAL_AMOUNT, it)
        } ?: run {
            call.reject("Must provide a total amount")
            return
        }

        call.getInt("itemCount")?.let {
            params.putInteger(FlurryEvent.Param.ITEM_COUNT, it)
        }

        FlurryAgent.logEvent(FlurryEvent.CHECKOUT_INITIATED, params)
        call.resolve()
    }

    @PluginMethod
    fun logFundsDonated(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: run {
            call.reject("Must provide a price")
            return
        }

        call.getString("currencyType")?.let {
            params.putString(FlurryEvent.Param.CURRENCY_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.FUNDS_DONATED, params)
        call.resolve()
    }

    @PluginMethod
    fun logUserScheduled(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.USER_SCHEDULED, null)
        call.resolve()
    }

    @PluginMethod
    fun logOfferPresented(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getString("itemId")?.let {
            params.putString(FlurryEvent.Param.ITEM_ID, it)
        } ?: run {
            call.reject("Must provide an item ID")
            return
        }

        call.getDouble("price")?.let {
            params.putDouble(FlurryEvent.Param.PRICE, it)
        } ?: run {
            call.reject("Must provide a price")
            return
        }

        call.getString("itemName")?.let {
            params.putString(FlurryEvent.Param.ITEM_NAME, it)
        }
        call.getString("itemType")?.let {
            params.putString(FlurryEvent.Param.ITEM_TYPE, it)
        }

        FlurryAgent.logEvent(FlurryEvent.OFFER_PRESENTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logTutorialStarted(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getString("tutorialName")?.let {
            params.putString(FlurryEvent.Param.TUTORIAL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.TUTORIAL_STARTED, params)
        call.resolve()
    }

    @PluginMethod
    fun logTutorialCompleted(call: PluginCall){
        val params = FlurryEvent.Params()
        call.getString("tutorialName")?.let {
            params.putString(FlurryEvent.Param.TUTORIAL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.TUTORIAL_COMPLETED, params)
        call.resolve()
    }

    @PluginMethod
    fun logTutorialStepCompleted(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getInt("stepNumber")?.let{
            params.putInteger(FlurryEvent.Param.STEP_NUMBER, it)
        } ?: run {
            call.reject("Must provide a step number")
            return
        }

        call.getString("tutorialName")?.let {
            params.putString(FlurryEvent.Param.TUTORIAL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.TUTORIAL_STEP_COMPLETED, params)
        call.resolve()
    }

    @PluginMethod
    fun logTutorialSkipped(call: PluginCall){
        val params = FlurryEvent.Params()

        call.getInt("stepNumber")?.let{
            params.putInteger(FlurryEvent.Param.STEP_NUMBER, it)
        } ?: run {
            call.reject("Must provide a step number")
            return
        }

        call.getString("tutorialName")?.let {
            params.putString(FlurryEvent.Param.TUTORIAL_NAME, it)
        }

        FlurryAgent.logEvent(FlurryEvent.TUTORIAL_SKIPPED, params)
        call.resolve()
    }

    @PluginMethod
    fun logPrivacyPromptDisplayed(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.PRIVACY_PROMPT_DISPLAYED, null)
        call.resolve()
    }

    @PluginMethod
    fun logPrivacyOptIn(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.PRIVACY_OPT_IN, null)
        call.resolve()
    }

    @PluginMethod
    fun logPrivacyOptOut(call: PluginCall){
        FlurryAgent.logEvent(FlurryEvent.PRIVACY_OPT_OUT, null)
        call.resolve()
    }

}