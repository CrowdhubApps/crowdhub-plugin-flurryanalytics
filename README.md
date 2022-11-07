# crowdhub-plugin-flurryanalytics

This plugin provides an interface for Capacitor apps to use the Flurry Analytics API

## Install

```bash
npm install crowdhub-plugin-flurryanalytics
npx cap sync
```

## Implementation

# Web App

In order to initialize a session, you simply need to call once within your app's session, so you'd likely want to include this call on a deviceready event.

```typescript
import { FlurryAnalytics } from 'crowdhub-plugin-flurryanalytics';

FlurryAnalytics.initialize({
  apiKey: 'YOUR-API-KEY-HERE',
});
```

Afterwards you can safely call any of the provided methods from the FlurryAnalytics class!

# iOS

# Android

As with many community created Capacitor plugins, you may need to manually register this plugin in your MainActivity.java like so:

```java
package your.app.bundle;

import android.os.Bundle;
import com.crowdhubapps.plugin.flurryanalytics.FlurryAnalyticsPlugin;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {

  @Override
  public void onCreate(Bundle savedInstanceState) {
    registerPlugin(FlurryAnalyticsPlugin.class);
    super.onCreate(savedInstanceState);
  }
}

```

If you get an error related to finding the package, you may also need to Right-Click the crowdhub-flurry-analytics folder in Android Studio and select the 'Convert Java File to Kotlin File' option. This will prompt you to configure Kotlin in the project, which is what the plugin is written in. You only need to configure Single module: android.crowdhubapps-plugin-flurryanalytics.

## API

<docgen-index>

* [`initialize(...)`](#initialize)
* [`logContentRated(...)`](#logcontentrated)
* [`logContentViewed(...)`](#logcontentviewed)
* [`logContentSaved(...)`](#logcontentsaved)
* [`logProductCustomized()`](#logproductcustomized)
* [`logSubscriptionStarted(...)`](#logsubscriptionstarted)
* [`logSubscriptionEnded(...)`](#logsubscriptionended)
* [`logGroupJoined(...)`](#loggroupjoined)
* [`logGroupLeft(...)`](#loggroupleft)
* [`logLogin(...)`](#loglogin)
* [`logLogout(...)`](#loglogout)
* [`logUserRegistered(...)`](#loguserregistered)
* [`logSearchResultViewed(...)`](#logsearchresultviewed)
* [`logKeywordSearched(...)`](#logkeywordsearched)
* [`logLocationSearched(...)`](#loglocationsearched)
* [`logInvite(...)`](#loginvite)
* [`logShare(...)`](#logshare)
* [`logLike(...)`](#loglike)
* [`logComment(...)`](#logcomment)
* [`logMediaCaptured(...)`](#logmediacaptured)
* [`logMediaStarted(...)`](#logmediastarted)
* [`logMediaStopped(...)`](#logmediastopped)
* [`logMediaPaused(...)`](#logmediapaused)
* [`logCustomEvent(...)`](#logcustomevent)
* [`endTimedEvent(...)`](#endtimedevent)
* [`setUserId(...)`](#setuserid)
* [`setAge(...)`](#setage)
* [`setGender(...)`](#setgender)
* [`logError(...)`](#logerror)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initialize(...)

```typescript
initialize(options: { apiKey: string; logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error'; crashReportingEnabled?: boolean; appVersion?: string; iapReportingEnabled?: boolean; }) => Promise<{ value: string; }>
```

Initialize Flurry once within the session by passing through an API key

| Param         | Type                                                                                                                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ apiKey: string; logLevel?: 'error' \| 'warn' \| 'info' \| 'verbose' \| 'debug'; crashReportingEnabled?: boolean; appVersion?: string; iapReportingEnabled?: boolean; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentRated(...)

```typescript
logContentRated(options: { contentId: string; contentRating: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user rates a content in the App

| Param         | Type                                                                                                   |
| ------------- | ------------------------------------------------------------------------------------------------------ |
| **`options`** | <code>{ contentId: string; contentRating: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentViewed(...)

```typescript
logContentViewed(options: { contentId: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

Log this event when a specific content is viewed by a user

| Param         | Type                                                                            |
| ------------- | ------------------------------------------------------------------------------- |
| **`options`** | <code>{ contentId: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentSaved(...)

```typescript
logContentSaved(options: { contentId: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user saves the content in the App

| Param         | Type                                                                            |
| ------------- | ------------------------------------------------------------------------------- |
| **`options`** | <code>{ contentId: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logProductCustomized()

```typescript
logProductCustomized() => Promise<{ value: string; }>
```

Log this event when a user customizes the App/product

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSubscriptionStarted(...)

```typescript
logSubscriptionStarted(options: { price: number; isAnnualSubscription: boolean; trialDays?: number; predictedLTV?: string; currencyType?: string; subscriptionCountry?: string; }) => Promise<{ value: string; }>
```

Log this event at the start of a paid subscription for a service or product

| Param         | Type                                                                                                                                                           |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ price: number; isAnnualSubscription: boolean; trialDays?: number; predictedLTV?: string; currencyType?: string; subscriptionCountry?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSubscriptionEnded(...)

```typescript
logSubscriptionEnded(options: { isAnnualSubscription: boolean; currencyType?: string; subscriptionCountry?: string; }) => Promise<{ value: string; }>
```

Log this event when a user unsubscribes from a paid subscription for a service or product

| Param         | Type                                                                                                 |
| ------------- | ---------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ isAnnualSubscription: boolean; currencyType?: string; subscriptionCountry?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupJoined(...)

```typescript
logGroupJoined(options: { groupName?: string; }) => Promise<{ value: string; }>
```

Log this event when user joins a group.

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ groupName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupLeft(...)

```typescript
logGroupLeft(options: { groupName?: string; }) => Promise<{ value: string; }>
```

Log this event when user leaves a group

| Param         | Type                                 |
| ------------- | ------------------------------------ |
| **`options`** | <code>{ groupName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogin(...)

```typescript
logLogin(options: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

Log this event when a user login on the App

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogout(...)

```typescript
logLogout(options: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

Log this event when a user logout of the App

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logUserRegistered(...)

```typescript
logUserRegistered(options: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

Log the event when a user registers (signup). Helps capture the method used to sign-up (signup with google/apple or email address)

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSearchResultViewed(...)

```typescript
logSearchResultViewed(options: { query?: string; searchType?: string; }) => Promise<{ value: string; }>
```

Log this event when user views search results

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code>{ query?: string; searchType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logKeywordSearched(...)

```typescript
logKeywordSearched(options: { query?: string; searchType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user searches for a keyword using Search

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code>{ query?: string; searchType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLocationSearched(...)

```typescript
logLocationSearched(options: { query?: string; }) => Promise<{ value: string; }>
```

Log this event when a user searches for a location using Search

| Param         | Type                             |
| ------------- | -------------------------------- |
| **`options`** | <code>{ query?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logInvite(...)

```typescript
logInvite(options: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

Log this event when a user invites another user

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logShare(...)

```typescript
logShare(options: { socialContentId: string; socialContentName?: string; method?: string; }) => Promise<{ value: string; }>
```

Log this event when a user shares content with another user in the App

| Param         | Type                                                                                   |
| ------------- | -------------------------------------------------------------------------------------- |
| **`options`** | <code>{ socialContentId: string; socialContentName?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLike(...)

```typescript
logLike(options: { socialContentId: string; socialContentName?: string; likeType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user likes a social content. e.g. likeType captures what kind of like is logged (“celebrate”, “insightful”, etc)

| Param         | Type                                                                                     |
| ------------- | ---------------------------------------------------------------------------------------- |
| **`options`** | <code>{ socialContentId: string; socialContentName?: string; likeType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logComment(...)

```typescript
logComment(options: { socialContentId: string; socialContentName?: string; }) => Promise<{ value: string; }>
```

Log this event when a user comments or replies on a social post

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code>{ socialContentId: string; socialContentName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaCaptured(...)

```typescript
logMediaCaptured(options: { mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

Log this event when an image, audio or a video is captured

| Param         | Type                                                                       |
| ------------- | -------------------------------------------------------------------------- |
| **`options`** | <code>{ mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStarted(...)

```typescript
logMediaStarted(options: { mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

Log this event when an audio or video starts

| Param         | Type                                                                       |
| ------------- | -------------------------------------------------------------------------- |
| **`options`** | <code>{ mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStopped(...)

```typescript
logMediaStopped(options: { duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

Log this event when an audio or video is stopped

| Param         | Type                                                                                         |
| ------------- | -------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaPaused(...)

```typescript
logMediaPaused(options: { duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

Log this event when an audio or video is paused

| Param         | Type                                                                                         |
| ------------- | -------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCustomEvent(...)

```typescript
logCustomEvent(options: { eventName: string; eventParams?: { [key: string]: string; } | undefined; eventTimed?: boolean | undefined; }) => Promise<{ value: string; }>
```

Log a custom event in the app.
You may provide up to ten additional parameters as key/value pairs, both of which must be strings
You may also enable this event to be timed, calling endTimedEvent to terminate its logging

| Param         | Type                                                                                                |
| ------------- | --------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ eventName: string; eventParams?: { [key: string]: string; }; eventTimed?: boolean; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### endTimedEvent(...)

```typescript
endTimedEvent(options: { eventName: string; }) => Promise<{ value: string; }>
```

TODO: Swift and Kotlin implementations

| Param         | Type                                |
| ------------- | ----------------------------------- |
| **`options`** | <code>{ eventName: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setUserId(...)

```typescript
setUserId(options: { userId: string; }) => Promise<{ value: string; }>
```

After identifying the user, use this to log the user’s assigned ID or username in your system.
You must call this function prior to starting the Flurry session

| Param         | Type                             |
| ------------- | -------------------------------- |
| **`options`** | <code>{ userId: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setAge(...)

```typescript
setAge(options: { userAge: number; }) => Promise<{ value: string; }>
```

After identifying the user, use this to log the user’s age. Valid inputs are between 1 and 109.
You must call this function prior to starting the Flurry session

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ userAge: number; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setGender(...)

```typescript
setGender(options: { userGender: 'm' | 'f'; }) => Promise<{ value: string; }>
```

After identifying the user, use this to log the user’s gender. Valid inputs are m (male) or f (female).
You must call this function prior to starting the Flurry session

| Param         | Type                                     |
| ------------- | ---------------------------------------- |
| **`options`** | <code>{ userGender: 'm' \| 'f'; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logError(...)

```typescript
logError(options: { errorId?: string; errorMessage?: string; error?: string; }) => Promise<{ value: string; }>
```

Use this to log exceptions and/or errors that occur in your app. Flurry will report the first 10 errors that occur in each session.

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code>{ errorId?: string; errorMessage?: string; error?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>
