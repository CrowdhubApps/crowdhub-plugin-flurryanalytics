package com.crowdhubapps.plugin.flurryanalytics

import android.util.Log
import com.getcapacitor.annotation.CapacitorPlugin
import com.crowdhubapps.plugin.flurryanalytics.FlurryAnalytics
import com.flurry.android.Constants
import com.getcapacitor.JSObject
import com.flurry.android.FlurryAgent
import com.flurry.android.FlurryEvent
import com.flurry.android.FlurryPerformance
import com.getcapacitor.Plugin
import com.getcapacitor.PluginMethod
import com.getcapacitor.PluginCall

@CapacitorPlugin(name = "FlurryAnalytics")
class FlurryAnalyticsPlugin : Plugin() {
    private val implementation = FlurryAnalytics()
    @PluginMethod
    fun initialize(call: PluginCall) {
        var logLevel: Int
        var logEnabled: Boolean
        when (call.getString("logLevel")?.lowercase()) {
            "verbose" -> {
                logLevel = Log.VERBOSE
                logEnabled = true
            }
            "debug" ->{
                logLevel = Log.DEBUG
                logEnabled = true
            }
            "info" ->{
                logLevel = Log.INFO
                logEnabled = true
            }
            "warn" ->{
                logLevel = Log.WARN
                logEnabled = true
            }
            "error" ->{
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

        FlurryAgent.logEvent(FlurryEvent.CONTENT_RATED, params)
    }

    @PluginMethod
    fun logContentViewed(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.CONTENT_VIEWED, params)
    }

    @PluginMethod
    fun logContentSaved(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.CONTENT_SAVED, params)
    }

    @PluginMethod
    fun logProductCustomized(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.PRODUCT_CUSTOMIZED, params)
    }

    @PluginMethod
    fun logSubscriptionStarted(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.SUBSCRIPTION_STARTED, params)
    }

    @PluginMethod
    fun logSubscriptionEnded(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.SUBSCRIPTION_ENDED, params)
    }

    @PluginMethod
    fun logGroupJoined(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.GROUP_JOINED, params)
    }

    @PluginMethod
    fun logGroupLeft(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.GROUP_LEFT, params)
    }

    @PluginMethod
    fun logLogin(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.LOGIN, params)
    }

    @PluginMethod
    fun logLogout(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.LOGOUT, params)
    }

    @PluginMethod
    fun logUserRegistered(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.USER_REGISTERED, params)
    }

    @PluginMethod
    fun logSearchResultViewed(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.SEARCH_RESULT_VIEWED, params)
    }

    @PluginMethod
    fun logKeywordSearched(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.KEYWORD_SEARCHED, params)
    }

    @PluginMethod
    fun logLocationSearched(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.LOCATION_SEARCHED, params)
    }

    @PluginMethod
    fun logInvite(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.INVITE, params)
    }

    @PluginMethod
    fun logShare(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.SHARE, params)
    }

    @PluginMethod
    fun logLike(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.LIKE, params)
    }

    @PluginMethod
    fun logComment(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.COMMENT, params)
    }

    @PluginMethod
    fun logMediaCaptured(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.MEDIA_CAPTURED, params)
    }

    @PluginMethod
    fun logMediaStarted(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.MEDIA_STARTED, params)
    }

    @PluginMethod
    fun logMediaStopped(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.MEDIA_STOPPED, params)
    }

    @PluginMethod
    fun logMediaPaused(call: PluginCall) {
        val params = FlurryEvent.Params()

        FlurryAgent.logEvent(FlurryEvent.MEDIA_PAUSED, params)
    }

    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @PluginMethod
    fun logCustomEvent(call: PluginCall) {
        val eventName: String = "Custom event"
        val isTimed: Boolean = false
        var customParams: HashMap<String, String>
        customParams["customParamName"] = "customParamValue"

        FlurryAgent.logEvent(eventName, customParams, isTimed)
    }

    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @PluginMethod
    fun setUserId(call: PluginCall) {
        call.getString("userId")?.let {
            FlurryAgent.setUserId(it)
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

        FlurryAgent.onError("","An error has occurred","")
    }
}