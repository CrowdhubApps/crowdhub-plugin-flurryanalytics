# crowdhub-plugin-flurryanalytics

This plugin provides an interface for Capacitor apps to use the Flurry Analytics API

## Install

```bash
npm install crowdhub-plugin-flurryanalytics
npx cap sync
```

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
* [`setUserId(...)`](#setuserid)
* [`setAge(...)`](#setage)
* [`setGender(...)`](#setgender)
* [`logError(...)`](#logerror)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initialize(...)

```typescript
initialize(opts: { apiKey: string; logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error'; crashReportingEnabled?: boolean; appVersion?: string; iapReportingEnabled?: boolean; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                                                                                                                  |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ apiKey: string; logLevel?: 'error' \| 'warn' \| 'info' \| 'verbose' \| 'debug'; crashReportingEnabled?: boolean; appVersion?: string; iapReportingEnabled?: boolean; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentRated(...)

```typescript
logContentRated(opts: { contentId: string; contentRating: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                                   |
| ---------- | ------------------------------------------------------------------------------------------------------ |
| **`opts`** | <code>{ contentId: string; contentRating: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentViewed(...)

```typescript
logContentViewed(opts: { contentId: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                            |
| ---------- | ------------------------------------------------------------------------------- |
| **`opts`** | <code>{ contentId: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentSaved(...)

```typescript
logContentSaved(opts: { contentId: string; contentName?: string; contentType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                            |
| ---------- | ------------------------------------------------------------------------------- |
| **`opts`** | <code>{ contentId: string; contentName?: string; contentType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logProductCustomized()

```typescript
logProductCustomized() => Promise<{ value: string; }>
```

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSubscriptionStarted(...)

```typescript
logSubscriptionStarted(opts: { price: number; isAnnualSubscription: boolean; trialDays?: number; predictedLTV?: string; currencyType?: string; subscriptionCountry?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                                                                                           |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ price: number; isAnnualSubscription: boolean; trialDays?: number; predictedLTV?: string; currencyType?: string; subscriptionCountry?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSubscriptionEnded(...)

```typescript
logSubscriptionEnded(opts: { isAnnualSubscription: boolean; currencyType?: string; subscriptionCountry?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                                 |
| ---------- | ---------------------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ isAnnualSubscription: boolean; currencyType?: string; subscriptionCountry?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupJoined(...)

```typescript
logGroupJoined(opts: { groupName?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                 |
| ---------- | ------------------------------------ |
| **`opts`** | <code>{ groupName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupLeft(...)

```typescript
logGroupLeft(opts: { groupName?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                 |
| ---------- | ------------------------------------ |
| **`opts`** | <code>{ groupName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogin(...)

```typescript
logLogin(opts: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                               |
| ---------- | -------------------------------------------------- |
| **`opts`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogout(...)

```typescript
logLogout(opts: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                               |
| ---------- | -------------------------------------------------- |
| **`opts`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logUserRegistered(...)

```typescript
logUserRegistered(opts: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                               |
| ---------- | -------------------------------------------------- |
| **`opts`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSearchResultViewed(...)

```typescript
logSearchResultViewed(opts: { query?: string; searchType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                  |
| ---------- | ----------------------------------------------------- |
| **`opts`** | <code>{ query?: string; searchType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logKeywordSearched(...)

```typescript
logKeywordSearched(opts: { query?: string; searchType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                  |
| ---------- | ----------------------------------------------------- |
| **`opts`** | <code>{ query?: string; searchType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLocationSearched(...)

```typescript
logLocationSearched(opts: { query?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                             |
| ---------- | -------------------------------- |
| **`opts`** | <code>{ query?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logInvite(...)

```typescript
logInvite(opts: { userId?: string; method?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                               |
| ---------- | -------------------------------------------------- |
| **`opts`** | <code>{ userId?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logShare(...)

```typescript
logShare(opts: { socialContentId: string; socialContentName?: string; method?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                   |
| ---------- | -------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ socialContentId: string; socialContentName?: string; method?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLike(...)

```typescript
logLike(opts: { socialContentId: string; socialContentName?: string; likeType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                     |
| ---------- | ---------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ socialContentId: string; socialContentName?: string; likeType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logComment(...)

```typescript
logComment(opts: { socialContentId: string; socialContentName?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                  |
| ---------- | --------------------------------------------------------------------- |
| **`opts`** | <code>{ socialContentId: string; socialContentName?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaCaptured(...)

```typescript
logMediaCaptured(opts: { mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                       |
| ---------- | -------------------------------------------------------------------------- |
| **`opts`** | <code>{ mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStarted(...)

```typescript
logMediaStarted(opts: { mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                       |
| ---------- | -------------------------------------------------------------------------- |
| **`opts`** | <code>{ mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStopped(...)

```typescript
logMediaStopped(opts: { duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                         |
| ---------- | -------------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaPaused(...)

```typescript
logMediaPaused(opts: { duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                         |
| ---------- | -------------------------------------------------------------------------------------------- |
| **`opts`** | <code>{ duration: number; mediaId?: string; mediaName?: string; mediaType?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCustomEvent(...)

```typescript
logCustomEvent(opts: { eventName: string; eventParams?: { [key: string]: any; } | undefined; eventTimed?: boolean | undefined; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------ |
| **`opts`** | <code>{ eventName: string; eventParams?: { [key: string]: any; }; eventTimed?: boolean; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setUserId(...)

```typescript
setUserId(opts: { userId: string; }) => Promise<{ value: string; }>
```

| Param      | Type                             |
| ---------- | -------------------------------- |
| **`opts`** | <code>{ userId: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setAge(...)

```typescript
setAge(opts: { userAge: number; }) => Promise<{ value: string; }>
```

| Param      | Type                              |
| ---------- | --------------------------------- |
| **`opts`** | <code>{ userAge: number; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setGender(...)

```typescript
setGender(opts: { userGender: 'm' | 'f'; }) => Promise<{ value: string; }>
```

| Param      | Type                                     |
| ---------- | ---------------------------------------- |
| **`opts`** | <code>{ userGender: 'm' \| 'f'; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logError(...)

```typescript
logError(opts: { errorId?: string; errorMessage?: string; error?: string; }) => Promise<{ value: string; }>
```

| Param      | Type                                                                      |
| ---------- | ------------------------------------------------------------------------- |
| **`opts`** | <code>{ errorId?: string; errorMessage?: string; error?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>
