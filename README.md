# crowdhub-plugin-flurryanalytics

This plugin provides an interface for Capacitor apps to use the Flurry Analytics API

## Install

```bash
npm install crowdhub-plugin-flurryanalytics
npx cap sync
```

## Implementation

# Web

In order to initialize a session, you simply need to call once within your app's session, so you'd likely want to include this call on a deviceready event.

```typescript
import { FlurryAnalytics } from 'crowdhub-plugin-flurryanalytics';

FlurryAnalytics.initialize({
  apiKey: 'YOUR-API-KEY-HERE',
});
```

Afterwards you can safely call any of the provided methods from the FlurryAnalytics class!

For demographics methods (setAge, setGender, setUserId), these must be called prior to initializing a Flurry session.

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
* [`logAdClick(...)`](#logadclick)
* [`logAdImpression(...)`](#logadimpression)
* [`logAdRewarded(...)`](#logadrewarded)
* [`logAdSkipped(...)`](#logadskipped)
* [`logCreditsSpent(...)`](#logcreditsspent)
* [`logCreditsPurchased(...)`](#logcreditspurchased)
* [`logCreditsEarned(...)`](#logcreditsearned)
* [`logAchievementUnlocked(...)`](#logachievementunlocked)
* [`logLevelCompleted(...)`](#loglevelcompleted)
* [`logLevelFailed(...)`](#loglevelfailed)
* [`logLevelUp(...)`](#loglevelup)
* [`logLevelStarted(...)`](#loglevelstarted)
* [`logLevelSkip(...)`](#loglevelskip)
* [`logScorePosted(...)`](#logscoreposted)
* [`logAppActivated()`](#logappactivated)
* [`logApplicationSubmitted()`](#logapplicationsubmitted)
* [`logAddItemToCart(...)`](#logadditemtocart)
* [`logAddItemToWishList(...)`](#logadditemtowishlist)
* [`logCompletedCheckout(...)`](#logcompletedcheckout)
* [`logPaymentInfoAdded(...)`](#logpaymentinfoadded)
* [`logItemViewed(...)`](#logitemviewed)
* [`logItemListViewed(...)`](#logitemlistviewed)
* [`logPurchased(...)`](#logpurchased)
* [`logPurchaseRefunded(...)`](#logpurchaserefunded)
* [`logRemoveItemFromCart(...)`](#logremoveitemfromcart)
* [`logCheckoutInitiated(...)`](#logcheckoutinitiated)
* [`logFundsDonated(...)`](#logfundsdonated)
* [`logUserScheduled()`](#loguserscheduled)
* [`logOfferPresented(...)`](#logofferpresented)
* [`logTutorialStarted(...)`](#logtutorialstarted)
* [`logTutorialCompleted(...)`](#logtutorialcompleted)
* [`logTutorialStepCompleted(...)`](#logtutorialstepcompleted)
* [`logTutorialSkipped(...)`](#logtutorialskipped)
* [`logPrivacyPromptDisplayed()`](#logprivacypromptdisplayed)
* [`logPrivacyOptIn()`](#logprivacyoptin)
* [`logPrivacyOptOut()`](#logprivacyoptout)

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


### logAdClick(...)

```typescript
logAdClick(options: { adType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user clicks on an Ad

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ adType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAdImpression(...)

```typescript
logAdImpression(options: { adType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user views an Ad impression

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ adType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAdRewarded(...)

```typescript
logAdRewarded(options: { adType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user is granted a reward for viewing a rewarded Ad

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ adType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAdSkipped(...)

```typescript
logAdSkipped(options: { adType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user skips an Ad

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ adType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCreditsSpent(...)

```typescript
logCreditsSpent(options: { levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user spends credit in the app

| Param         | Type                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCreditsPurchased(...)

```typescript
logCreditsPurchased(options: { levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user purchases credit in the app

| Param         | Type                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCreditsEarned(...)

```typescript
logCreditsEarned(options: { levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user earns credit in the app

| Param         | Type                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ levelNumber?: number; totalAmount: number; isCurrencySoft?: boolean; creditType?: string; creditId?: string; creditName?: string; currencyType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAchievementUnlocked(...)

```typescript
logAchievementUnlocked(options: { achievementId?: string; }) => Promise<{ value: string; }>
```

Log this event when a user unlocks an achievement in the app

| Param         | Type                                     |
| ------------- | ---------------------------------------- |
| **`options`** | <code>{ achievementId?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLevelCompleted(...)

```typescript
logLevelCompleted(options: { levelNumber: number; levelName?: string; }) => Promise<{ value: string; }>
```

Log this event when an App user completes a level

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ levelNumber: number; levelName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLevelFailed(...)

```typescript
logLevelFailed(options: { levelNumber: number; levelName?: string; }) => Promise<{ value: string; }>
```

Log this event when an App user fails a level

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ levelNumber: number; levelName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLevelUp(...)

```typescript
logLevelUp(options: { levelNumber: number; levelName?: string; }) => Promise<{ value: string; }>
```

Log this event when an App user levels up

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ levelNumber: number; levelName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLevelStarted(...)

```typescript
logLevelStarted(options: { levelNumber: number; levelName?: string; }) => Promise<{ value: string; }>
```

Log this event when an App user starts a level

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ levelNumber: number; levelName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLevelSkip(...)

```typescript
logLevelSkip(options: { levelNumber: number; levelName?: string; }) => Promise<{ value: string; }>
```

Log this event when an App user skips a level

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code>{ levelNumber: number; levelName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logScorePosted(...)

```typescript
logScorePosted(options: { levelNumber?: number; score: number; }) => Promise<{ value: string; }>
```

Log this event when an App user posts his score

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code>{ levelNumber?: number; score: number; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAppActivated()

```typescript
logAppActivated() => Promise<{ value: string; }>
```

Log this event when the App is activated

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logApplicationSubmitted()

```typescript
logApplicationSubmitted() => Promise<{ value: string; }>
```

Log this event when a user submits an application through the App

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAddItemToCart(...)

```typescript
logAddItemToCart(options: { itemCount: number; price: number; itemId?: string; itemName?: string; itemType?: string; }) => Promise<{ value: string; }>
```

Log this event when an item is added to the cart

| Param         | Type                                                                                                      |
| ------------- | --------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ itemCount: number; price: number; itemId?: string; itemName?: string; itemType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logAddItemToWishList(...)

```typescript
logAddItemToWishList(options: { itemCount: number; price: number; itemId?: string; itemName?: string; itemType?: string; }) => Promise<{ value: string; }>
```

Log this event when an item is added to the wish list

| Param         | Type                                                                                                      |
| ------------- | --------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ itemCount: number; price: number; itemId?: string; itemName?: string; itemType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCompletedCheckout(...)

```typescript
logCompletedCheckout(options: { itemCount: number; totalAmount: number; currencyType?: string; transactionId?: string; }) => Promise<{ value: string; }>
```

Log this event when checkout is completed or transaction is successfully completed

| Param         | Type                                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ itemCount: number; totalAmount: number; currencyType?: string; transactionId?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPaymentInfoAdded(...)

```typescript
logPaymentInfoAdded(options: { success: boolean; paymentType: string; }) => Promise<{ value: string; }>
```

Log this event when payment information is added during a checkout process

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code>{ success: boolean; paymentType: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logItemViewed(...)

```typescript
logItemViewed(options: { price?: number; itemId: string; itemName?: string; itemType?: string; }) => Promise<{ value: string; }>
```

Log this event when an item is viewed

| Param         | Type                                                                                   |
| ------------- | -------------------------------------------------------------------------------------- |
| **`options`** | <code>{ price?: number; itemId: string; itemName?: string; itemType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logItemListViewed(...)

```typescript
logItemListViewed(options: { itemListType: string; }) => Promise<{ value: string; }>
```

Log this event when a list of items is viewed

| Param         | Type                                   |
| ------------- | -------------------------------------- |
| **`options`** | <code>{ itemListType: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPurchased(...)

```typescript
logPurchased(options: { totalAmount: number; success: boolean; itemCount?: number; itemId?: string; itemName?: string; itemType?: string; currencyType?: string; transactionId?: string; }) => Promise<{ value: string; }>
```

Log this event when a user does a purchase in the App

| Param         | Type                                                                                                                                                                              |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ totalAmount: number; success: boolean; itemCount?: number; itemId?: string; itemName?: string; itemType?: string; currencyType?: string; transactionId?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPurchaseRefunded(...)

```typescript
logPurchaseRefunded(options: { price: number; currencyType?: string; }) => Promise<{ value: string; }>
```

Log this event when a purchase is refunded

| Param         | Type                                                   |
| ------------- | ------------------------------------------------------ |
| **`options`** | <code>{ price: number; currencyType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logRemoveItemFromCart(...)

```typescript
logRemoveItemFromCart(options: { price?: number; itemId: string; itemName?: string; itemType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user removes an item from the cart

| Param         | Type                                                                                   |
| ------------- | -------------------------------------------------------------------------------------- |
| **`options`** | <code>{ price?: number; itemId: string; itemName?: string; itemType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCheckoutInitiated(...)

```typescript
logCheckoutInitiated(options: { itemCount: number; totalAmount: number; }) => Promise<{ value: string; }>
```

Log this event when a user starts checkout

| Param         | Type                                                     |
| ------------- | -------------------------------------------------------- |
| **`options`** | <code>{ itemCount: number; totalAmount: number; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logFundsDonated(...)

```typescript
logFundsDonated(options: { price: number; currencyType?: string; }) => Promise<{ value: string; }>
```

Log this event when a user donates fund to your App or through the App

| Param         | Type                                                   |
| ------------- | ------------------------------------------------------ |
| **`options`** | <code>{ price: number; currencyType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logUserScheduled()

```typescript
logUserScheduled() => Promise<{ value: string; }>
```

Log this event when user schedules an appointment using the App

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logOfferPresented(...)

```typescript
logOfferPresented(options: { price: number; itemId: string; itemName?: string; itemCategory?: string; }) => Promise<{ value: string; }>
```

Log this event when an offer is presented to the user

| Param         | Type                                                                                      |
| ------------- | ----------------------------------------------------------------------------------------- |
| **`options`** | <code>{ price: number; itemId: string; itemName?: string; itemCategory?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logTutorialStarted(...)

```typescript
logTutorialStarted(options: { tutorialName?: string; }) => Promise<{ value: string; }>
```

Log this event when a user starts a tutorial

| Param         | Type                                    |
| ------------- | --------------------------------------- |
| **`options`** | <code>{ tutorialName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logTutorialCompleted(...)

```typescript
logTutorialCompleted(options: { tutorialName?: string; }) => Promise<{ value: string; }>
```

Log this event when a user completes a tutorial

| Param         | Type                                    |
| ------------- | --------------------------------------- |
| **`options`** | <code>{ tutorialName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logTutorialStepCompleted(...)

```typescript
logTutorialStepCompleted(options: { stepNumber: number; tutorialName?: string; }) => Promise<{ value: string; }>
```

Log this event when a specific tutorial step is completed

| Param         | Type                                                        |
| ------------- | ----------------------------------------------------------- |
| **`options`** | <code>{ stepNumber: number; tutorialName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logTutorialSkipped(...)

```typescript
logTutorialSkipped(options: { stepNumber: number; tutorialName?: string; }) => Promise<{ value: string; }>
```

Log this event when user skips the tutorial

| Param         | Type                                                        |
| ------------- | ----------------------------------------------------------- |
| **`options`** | <code>{ stepNumber: number; tutorialName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPrivacyPromptDisplayed()

```typescript
logPrivacyPromptDisplayed() => Promise<{ value: string; }>
```

Log this event when a privacy prompt is displayed

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPrivacyOptIn()

```typescript
logPrivacyOptIn() => Promise<{ value: string; }>
```

Log this event when a user opts in (on the privacy prompt)

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logPrivacyOptOut()

```typescript
logPrivacyOptOut() => Promise<{ value: string; }>
```

Log this event when a user opts out (on the privacy prompt)

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>

░░░░▒▒░░░░░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░▒▒░░
░░░░▒▒░░░░░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░▒▒░░
░░▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒
░░▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒
░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░████░░░░░░░░████░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░
░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░████░░░░░░░░████░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░
░░░░░░▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░░░
░░░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒░░░░░░
░░░░░░░░▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒░░░░░░
░░░░░░░░▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒░░░░░░
░░░░░░░░▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▒▒▒▒░░░░░░
░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░
░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░
░░░░░░▒▒▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒░░░░
░░░░▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒░░
░░░░▒▒▒▒░░░░░░░░▒▒▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒░░░░░░░░▒▒▒▒░░
░░░░▒▒▒▒░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░░░▒▒▒▒░░
░░░░░░▒▒░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░░░▒▒░░░░
░░░░░░▒▒░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░░░▒▒░░░░
░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░░░░░░░░░░░░░░
