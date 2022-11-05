#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(FlurryAnalyticsPlugin, "FlurryAnalytics",
    CAP_PLUGIN_METHOD(initialize, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentRated, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentViewed, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logContentSaved, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logProductCustomized, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logSubscriptionStarted, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logSubscriptionEnded, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logGroupJoined, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logGroupLeft, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logLogin, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logLogout, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logUserRegistered, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logSearchResultViewed, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logKeywordSearched, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logLocationSearched, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logInvite, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logShare, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logLike, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logComment, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaCaptured, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logMediaStarted, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(logMediaStopped, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logMediaPaused, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logCustomEvent, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setUserId, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setAge, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(setGender, CAPPluginReturnPromise);
    CAP_PLUGIN_METHOD(logError, CAPPluginReturnNone);
)
