export interface FlurryAnalyticsPlugin {
  /**
   * Initialize Flurry once within the session by passing through an API key
   * @param options
   */
  initialize(options: {
    apiKey: string;
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error';
    crashReportingEnabled?: boolean;
    appVersion?: string;
    iapReportingEnabled?: boolean;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user rates a content in the App
   * @param options
   */
  logContentRated(options: {
    contentId: string;
    contentRating: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a specific content is viewed by a user
   * @param options
   */
  logContentViewed(options: {
    contentId: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user saves the content in the App
   * @param options
   */
  logContentSaved(options: {
    contentId: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user customizes the App/product
   */
  logProductCustomized(): Promise<{ value: string }>;

  /**
   * Log this event at the start of a paid subscription for a service or product
   * @param options
   */
  logSubscriptionStarted(options: {
    price: number;
    isAnnualSubscription: boolean;
    trialDays?: number;
    predictedLTV?: string;
    currencyType?: string;
    subscriptionCountry?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user unsubscribes from a paid subscription for a service or product
   * @param options
   */
  logSubscriptionEnded(options: {
    isAnnualSubscription: boolean;
    currencyType?: string;
    subscriptionCountry?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when user joins a group.
   * @param options
   */
  logGroupJoined(options: { groupName?: string }): Promise<{ value: string }>;

  /**
   * Log this event when user leaves a group
   * @param options
   */
  logGroupLeft(options: { groupName?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user login on the App
   * @param options
   */
  logLogin(options: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user logout of the App
   * @param options
   */
  logLogout(options: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  /**
   * Log the event when a user registers (signup). Helps capture the method used to sign-up (signup with google/apple or email address)
   * @param options
   */
  logUserRegistered(options: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when user views search results
   * @param options
   */
  logSearchResultViewed(options: {
    query?: string;
    searchType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user searches for a keyword using Search
   * @param options
   */
  logKeywordSearched(options: {
    query?: string;
    searchType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user searches for a location using Search
   * @param options
   */
  logLocationSearched(options: { query?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user invites another user
   * @param options
   */
  logInvite(options: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user shares content with another user in the App
   * @param options
   */
  logShare(options: {
    socialContentId: string;
    socialContentName?: string;
    method?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user likes a social content. e.g. likeType captures what kind of like is logged (“celebrate”, “insightful”, etc)
   * @param options
   */
  logLike(options: {
    socialContentId: string;
    socialContentName?: string;
    likeType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user comments or replies on a social post
   * @param options
   */
  logComment(options: {
    socialContentId: string;
    socialContentName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an image, audio or a video is captured
   * @param options
   */
  logMediaCaptured(options: {
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an audio or video starts
   * @param options
   */
  logMediaStarted(options: {
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an audio or video is stopped
   * @param options
   */
  logMediaStopped(options: {
    duration: number;
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an audio or video is paused
   * @param options
   */
  logMediaPaused(options: {
    duration: number;
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log a custom event in the app.
   * You may provide up to ten additional parameters as key/value pairs, both of which must be strings
   * You may also enable this event to be timed, calling endTimedEvent to terminate its logging
   * @param options
   */
  logCustomEvent(options: {
    eventName: string;
    eventParams?: { [key: string]: string };
    eventTimed?: boolean;
  }): Promise<{ value: string }>;

  /**
   * @param options
   */
  endTimedEvent(options: { eventName: string }): Promise<{ value: string }>;

  /**
   * After identifying the user, use this to log the user’s assigned ID or username in your system.
   * You must call this function prior to starting the Flurry session
   * @param options
   */
  setUserId(options: { userId: string }): Promise<{ value: string }>;

  /**
   * After identifying the user, use this to log the user’s age. Valid inputs are between 1 and 109.
   * You must call this function prior to starting the Flurry session
   * @param options
   */
  setAge(options: { userAge: number }): Promise<{ value: string }>;

  /**
   * After identifying the user, use this to log the user’s gender. Valid inputs are m (male) or f (female).
   * You must call this function prior to starting the Flurry session
   * @param options
   */
  setGender(options: { userGender: 'm' | 'f' }): Promise<{ value: string }>;

  /**
   * Use this to log exceptions and/or errors that occur in your app. Flurry will report the first 10 errors that occur in each session.
   * @param options
   */
  logError(options: {
    errorId?: string;
    errorMessage?: string;
    error?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user clicks on an Ad
   * @param options
   */
  logAdClick(options: { adType?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user views an Ad impression
   * @param options
   */
  logAdImpression(options: { adType?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user is granted a reward for viewing a rewarded Ad
   * @param options
   */
  logAdRewarded(options: { adType?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user skips an Ad
   * @param options
   */
  logAdSkipped(options: { adType?: string }): Promise<{ value: string }>;

  /**
   * Log this event when a user spends credit in the app
   * @param options
   */
  logCreditsSpent(options: {
    levelNumber?: number;
    totalAmount: number;
    isCurrencySoft?: boolean;
    creditType?: string;
    creditId?: string;
    creditName?: string;
    currencyType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user purchases credit in the app
   * @param options
   */
  logCreditsPurchased(options: {
    levelNumber?: number;
    totalAmount: number;
    isCurrencySoft?: boolean;
    creditType?: string;
    creditId?: string;
    creditName?: string;
    currencyType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user earns credit in the app
   * @param options
   */
  logCreditsEarned(options: {
    levelNumber?: number;
    totalAmount: number;
    isCurrencySoft?: boolean;
    creditType?: string;
    creditId?: string;
    creditName?: string;
    currencyType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user unlocks an achievement in the app
   * @param options
   */
  logAchievementUnlocked(options: {
    achievementId?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user completes a level
   * @param options
   */
  logLevelCompleted(options: {
    levelNumber: number;
    levelName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user fails a level
   * @param options
   */
  logLevelFailed(options: {
    levelNumber: number;
    levelName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user levels up
   * @param options
   */
  logLevelUp(options: {
    levelNumber: number;
    levelName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user starts a level
   * @param options
   */
  logLevelStarted(options: {
    levelNumber: number;
    levelName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user skips a level
   * @param options
   */
  logLevelSkip(options: {
    levelNumber: number;
    levelName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an App user posts his score
   * @param options
   */
  logScorePosted(options: {
    levelNumber?: number;
    score: number;
  }): Promise<{ value: string }>;

  /**
   * Log this event when the App is activated
   */
  logAppActivated(): Promise<{ value: string }>;

  /**
   * Log this event when a user submits an application through the App
   */
  logApplicationSubmitted(): Promise<{ value: string }>;

  /**
   * Log this event when an item is added to the cart
   * @param options
   */
  logAddItemToCart(options: {
    itemCount: number;
    price: number;
    itemId?: string;
    itemName?: string;
    itemType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an item is added to the wish list
   * @param options
   */
  logAddItemToWishList(options: {
    itemCount: number;
    price: number;
    itemId?: string;
    itemName?: string;
    itemType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when checkout is completed or transaction is successfully completed
   * @param options
   */
  logCompletedCheckout(options: {
    itemCount: number;
    totalAmount: number;
    currencyType?: string;
    transactionId?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when payment information is added during a checkout process
   * @param options
   */
  logPaymentInfoAdded(options: {
    success: boolean;
    paymentType: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when an item is viewed
   * @param options
   */
  logItemViewed(options: {
    price?: number;
    itemId: string;
    itemName?: string;
    itemType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a list of items is viewed
   * @param options
   */
  logItemListViewed(options: {
    itemListType: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user does a purchase in the App
   * @param options
   */
  logPurchased(options: {
    totalAmount: number;
    success: boolean;
    itemCount?: number;
    itemId?: string;
    itemName?: string;
    itemType?: string;
    currencyType?: string;
    transactionId?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a purchase is refunded
   * @param options
   */
  logPurchaseRefunded(options: {
    price: number;
    currencyType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user removes an item from the cart
   * @param options
   */
  logRemoveItemFromCart(options: {
    price?: number;
    itemId: string;
    itemName?: string;
    itemType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user starts checkout
   * @param options
   */
  logCheckoutInitiated(options: {
    itemCount: number;
    totalAmount: number;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user donates fund to your App or through the App
   * @param options
   */
  logFundsDonated(options: {
    price: number;
    currencyType?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when user schedules an appointment using the App
   */
  logUserScheduled(): Promise<{ value: string }>;

  /**
   * Log this event when an offer is presented to the user
   * @param options
   */
  logOfferPresented(options: {
    price: number;
    itemId: string;
    itemName?: string;
    itemCategory?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user starts a tutorial
   * @param options
   */
  logTutorialStarted(options: {
    tutorialName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a user completes a tutorial
   * @param options
   */
  logTutorialCompleted(options: {
    tutorialName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a specific tutorial step is completed
   * @param options
   */
  logTutorialStepCompleted(options: {
    stepNumber: number;
    tutorialName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when user skips the tutorial
   * @param options
   */
  logTutorialSkipped(options: {
    stepNumber: number;
    tutorialName?: string;
  }): Promise<{ value: string }>;

  /**
   * Log this event when a privacy prompt is displayed
   */
  logPrivacyPromptDisplayed(): Promise<{ value: string }>;

  /**
   * Log this event when a user opts in (on the privacy prompt)
   */
  logPrivacyOptIn(): Promise<{ value: string }>;

  /**
   * Log this event when a user opts out (on the privacy prompt)
   */
  logPrivacyOptOut(): Promise<{ value: string }>;
}
