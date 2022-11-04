#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(FlurryAnalyticsPlugin, "FlurryAnalytics",
    CAP_PLUGIN_METHOD(initialize, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentRated, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentViewed, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentSaved, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logProductCustomized, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logSubscriptionStarted, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logSubscriptionEnded, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logGroupJoined, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logGroupLeft, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logLogin, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logLogout, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logUserRegistered, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logSearchResultViewed, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logKeywordSearched, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logLocationSearched, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logInvite, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logShare, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logLike, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logComment, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaCaptured, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaStarted, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaStopped, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaPaused, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logCustomEvent, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setUserId, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setAge, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setGender, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logError, CAPPluginReturnPromise);
)
