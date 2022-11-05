package com.crowdhubapps.plugin.flurryanalytics

import com.getcapacitor.annotation.CapacitorPlugin
import com.crowdhubapps.plugin.flurryanalytics.FlurryAnalytics
import com.getcapacitor.JSObject
import com.getcapacitor.Plugin
import com.getcapacitor.PluginMethod
import com.getcapacitor.PluginCall

@CapacitorPlugin(name = "FlurryAnalytics")
class FlurryAnalyticsPlugin : Plugin() {
    private val implementation = FlurryAnalytics()
    @PluginMethod
    fun initialize(call: PluginCall) {

    }

    // StandardEvents: https://developer.yahoo.com/flurry/docs/analytics/standard_events/iOS/
    @PluginMethod
    fun logContentRated(call: PluginCall) {

    }

    @PluginMethod
    fun logContentViewed(call: PluginCall) {

    }

    @PluginMethod
    fun logContentSaved(call: PluginCall) {

    }

    @PluginMethod
    fun logProductCustomized(call: PluginCall) {

    }

    @PluginMethod
    fun logSubscriptionStarted(call: PluginCall) {

    }

    @PluginMethod
    fun logSubscriptionEnded(call: PluginCall) {

    }

    @PluginMethod
    fun logGroupJoined(call: PluginCall) {

    }

    @PluginMethod
    fun logGroupLeft(call: PluginCall) {

    }

    @PluginMethod
    fun logLogin(call: PluginCall) {

    }

    @PluginMethod
    fun logLogout(call: PluginCall) {

    }

    @PluginMethod
    fun logUserRegistered(call: PluginCall) {

    }

    @PluginMethod
    fun logSearchResultViewed(call: PluginCall) {

    }

    @PluginMethod
    fun logKeywordSearched(call: PluginCall) {

    }

    @PluginMethod
    fun logLocationSearched(call: PluginCall) {

    }

    @PluginMethod
    fun logInvite(call: PluginCall) {

    }

    @PluginMethod
    fun logShare(call: PluginCall) {

    }

    @PluginMethod
    fun logLike(call: PluginCall) {

    }

    @PluginMethod
    fun logComment(call: PluginCall) {

    }

    @PluginMethod
    fun logMediaCaptured(call: PluginCall) {

    }

    @PluginMethod
    fun logMediaStarted(call: PluginCall) {

    }

    @PluginMethod
    fun logMediaStopped(call: PluginCall) {

    }

    @PluginMethod
    fun logMediaPaused(call: PluginCall) {

    }

    // Custom Events: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/events/ios/
    @PluginMethod
    fun logCustomEvent(call: PluginCall) {

    }

    // Advanced Features: https://developer.yahoo.com/flurry/docs/analytics/gettingstarted/technicalquickstart/ios/
    @PluginMethod
    fun setUserId(call: PluginCall) {

    }

    @PluginMethod
    fun setAge(call: PluginCall) {

    }

    @PluginMethod
    fun setGender(call: PluginCall) {

    }

    @PluginMethod
    fun logError(call: PluginCall) {

    }
}