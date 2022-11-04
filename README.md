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
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initialize(...)

```typescript
initialize(apiKey: string, logLevel?: "error" | "warn" | "info" | "verbose" | "debug" | undefined, crashReportingEnabled?: boolean | undefined, appVersion?: string | undefined, iapReportingEnabled?: boolean | undefined) => Promise<{ value: string; }>
```

| Param                       | Type                                                             |
| --------------------------- | ---------------------------------------------------------------- |
| **`apiKey`**                | <code>string</code>                                              |
| **`logLevel`**              | <code>'error' \| 'warn' \| 'info' \| 'verbose' \| 'debug'</code> |
| **`crashReportingEnabled`** | <code>boolean</code>                                             |
| **`appVersion`**            | <code>string</code>                                              |
| **`iapReportingEnabled`**   | <code>boolean</code>                                             |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentRated(...)

```typescript
logContentRated(contentId: string, contentRating: string, contentName?: string | undefined, contentType?: string | undefined) => Promise<{ value: string; }>
```

| Param               | Type                |
| ------------------- | ------------------- |
| **`contentId`**     | <code>string</code> |
| **`contentRating`** | <code>string</code> |
| **`contentName`**   | <code>string</code> |
| **`contentType`**   | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentViewed(...)

```typescript
logContentViewed(contentId: string, contentName?: string | undefined, contentType?: string | undefined) => Promise<{ value: string; }>
```

| Param             | Type                |
| ----------------- | ------------------- |
| **`contentId`**   | <code>string</code> |
| **`contentName`** | <code>string</code> |
| **`contentType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logContentSaved(...)

```typescript
logContentSaved(contentId: string, contentName?: string | undefined, contentType?: string | undefined) => Promise<{ value: string; }>
```

| Param             | Type                |
| ----------------- | ------------------- |
| **`contentId`**   | <code>string</code> |
| **`contentName`** | <code>string</code> |
| **`contentType`** | <code>string</code> |

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
logSubscriptionStarted(price: number, isAnnualSubscribtion: boolean, trialDays?: number | undefined, predictedLTV?: string | undefined, currencyType?: string | undefined, subscriptionCountry?: string | undefined) => Promise<{ value: string; }>
```

| Param                      | Type                 |
| -------------------------- | -------------------- |
| **`price`**                | <code>number</code>  |
| **`isAnnualSubscribtion`** | <code>boolean</code> |
| **`trialDays`**            | <code>number</code>  |
| **`predictedLTV`**         | <code>string</code>  |
| **`currencyType`**         | <code>string</code>  |
| **`subscriptionCountry`**  | <code>string</code>  |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSubscriptionEnded(...)

```typescript
logSubscriptionEnded(isAnnualSubscribtion: boolean, currencyType?: string | undefined, subscriptionCountry?: string | undefined) => Promise<{ value: string; }>
```

| Param                      | Type                 |
| -------------------------- | -------------------- |
| **`isAnnualSubscribtion`** | <code>boolean</code> |
| **`currencyType`**         | <code>string</code>  |
| **`subscriptionCountry`**  | <code>string</code>  |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupJoined(...)

```typescript
logGroupJoined(groupName?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`groupName`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logGroupLeft(...)

```typescript
logGroupLeft(groupName?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`groupName`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogin(...)

```typescript
logLogin(userId?: string | undefined, method?: string | undefined) => Promise<{ value: string; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`userId`** | <code>string</code> |
| **`method`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLogout(...)

```typescript
logLogout(userId?: string | undefined, method?: string | undefined) => Promise<{ value: string; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`userId`** | <code>string</code> |
| **`method`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logUserRegistered(...)

```typescript
logUserRegistered(userId?: string | undefined, method?: string | undefined) => Promise<{ value: string; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`userId`** | <code>string</code> |
| **`method`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logSearchResultViewed(...)

```typescript
logSearchResultViewed(query?: string | undefined, searchType?: string | undefined) => Promise<{ value: string; }>
```

| Param            | Type                |
| ---------------- | ------------------- |
| **`query`**      | <code>string</code> |
| **`searchType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logKeywordSearched(...)

```typescript
logKeywordSearched(query?: string | undefined, searchType?: string | undefined) => Promise<{ value: string; }>
```

| Param            | Type                |
| ---------------- | ------------------- |
| **`query`**      | <code>string</code> |
| **`searchType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLocationSearched(...)

```typescript
logLocationSearched(query?: string | undefined) => Promise<{ value: string; }>
```

| Param       | Type                |
| ----------- | ------------------- |
| **`query`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logInvite(...)

```typescript
logInvite(userId?: string | undefined, method?: string | undefined) => Promise<{ value: string; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`userId`** | <code>string</code> |
| **`method`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logShare(...)

```typescript
logShare(socialContentId: string, socialContentName?: string | undefined, method?: string | undefined) => Promise<{ value: string; }>
```

| Param                   | Type                |
| ----------------------- | ------------------- |
| **`socialContentId`**   | <code>string</code> |
| **`socialContentName`** | <code>string</code> |
| **`method`**            | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logLike(...)

```typescript
logLike(socialContentId: string, socialContentName?: string | undefined, likeType?: string | undefined) => Promise<{ value: string; }>
```

| Param                   | Type                |
| ----------------------- | ------------------- |
| **`socialContentId`**   | <code>string</code> |
| **`socialContentName`** | <code>string</code> |
| **`likeType`**          | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logComment(...)

```typescript
logComment(socialContentId: string, socialContentName?: string | undefined) => Promise<{ value: string; }>
```

| Param                   | Type                |
| ----------------------- | ------------------- |
| **`socialContentId`**   | <code>string</code> |
| **`socialContentName`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaCaptured(...)

```typescript
logMediaCaptured(mediaId?: string | undefined, mediaName?: string | undefined, mediaType?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`mediaId`**   | <code>string</code> |
| **`mediaName`** | <code>string</code> |
| **`mediaType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStarted(...)

```typescript
logMediaStarted(mediaId?: string | undefined, mediaName?: string | undefined, mediaType?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`mediaId`**   | <code>string</code> |
| **`mediaName`** | <code>string</code> |
| **`mediaType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaStopped(...)

```typescript
logMediaStopped(duration: number, mediaId?: string | undefined, mediaName?: string | undefined, mediaType?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`duration`**  | <code>number</code> |
| **`mediaId`**   | <code>string</code> |
| **`mediaName`** | <code>string</code> |
| **`mediaType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logMediaPaused(...)

```typescript
logMediaPaused(duration: number, mediaId?: string | undefined, mediaName?: string | undefined, mediaType?: string | undefined) => Promise<{ value: string; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`duration`**  | <code>number</code> |
| **`mediaId`**   | <code>string</code> |
| **`mediaName`** | <code>string</code> |
| **`mediaType`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logCustomEvent(...)

```typescript
logCustomEvent(eventName: string, eventParams?: [Record<string, unknown>] | undefined, eventTimed?: boolean | undefined) => Promise<{ value: string; }>
```

| Param             | Type                                         |
| ----------------- | -------------------------------------------- |
| **`eventName`**   | <code>string</code>                          |
| **`eventParams`** | <code>[Record&lt;string, unknown&gt;]</code> |
| **`eventTimed`**  | <code>boolean</code>                         |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setUserId(...)

```typescript
setUserId(userId: string) => Promise<{ value: string; }>
```

| Param        | Type                |
| ------------ | ------------------- |
| **`userId`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setAge(...)

```typescript
setAge(userAge: number) => Promise<{ value: string; }>
```

| Param         | Type                |
| ------------- | ------------------- |
| **`userAge`** | <code>number</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setGender(...)

```typescript
setGender(userGender: 'm' | 'f') => Promise<{ value: string; }>
```

| Param            | Type                    |
| ---------------- | ----------------------- |
| **`userGender`** | <code>'m' \| 'f'</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### logError(...)

```typescript
logError(errorId?: string | undefined, errorMessage?: string | undefined, error?: string | undefined) => Promise<{ value: string; }>
```

| Param              | Type                |
| ------------------ | ------------------- |
| **`errorId`**      | <code>string</code> |
| **`errorMessage`** | <code>string</code> |
| **`error`**        | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### Type Aliases


#### Record

Construct a type with a set of properties K of type T

<code>{ [P in K]: T; }</code>

</docgen-api>
