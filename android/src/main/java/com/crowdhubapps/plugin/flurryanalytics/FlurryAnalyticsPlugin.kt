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
                for (i in 0 until keys.length()){
                    it.getString(keys.getString(i))?.let { it1 -> eventMap.put(keys.getString(i), it1) }
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
        FlurryAgent.onError("","An error has occurred","")
        call.resolve()
    }
}
