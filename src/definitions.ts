export interface FlurryAnalyticsPlugin {
  initialize(
    apiKey: string,
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error',
    crashReportingEnabled?: boolean,
    appVersion?: string,
    iapReportingEnabled?: boolean,
  ): Promise<{ value: string }>;

  logContentRated(
    contentId: string,
    contentRating: string,
    contentName?: string,
    contentType?: string,
  ): Promise<{ value: string }>;

  logContentViewed(
    contentId: string,
    contentName?: string,
    contentType?: string,
  ): Promise<{ value: string }>;

  logContentSaved(
    contentId: string,
    contentName?: string,
    contentType?: string,
  ): Promise<{ value: string }>;

  logProductCustomized(): Promise<{ value: string }>;

  logSubscriptionStarted(
    price: number,
    isAnnualSubscribtion: boolean,
    trialDays?: number,
    predictedLTV?: string,
    currencyType?: string,
    subscriptionCountry?: string,
  ): Promise<{ value: string }>;

  logSubscriptionEnded(
    isAnnualSubscribtion: boolean,
    currencyType?: string,
    subscriptionCountry?: string,
  ): Promise<{ value: string }>;

  logGroupJoined(groupName?: string): Promise<{ value: string }>;

  logGroupLeft(groupName?: string): Promise<{ value: string }>;

  logLogin(userId?: string, method?: string): Promise<{ value: string }>;

  logLogout(userId?: string, method?: string): Promise<{ value: string }>;

  logUserRegistered(
    userId?: string,
    method?: string,
  ): Promise<{ value: string }>;

  logSearchResultViewed(
    query?: string,
    searchType?: string,
  ): Promise<{ value: string }>;
  logKeywordSearched(
    query?: string,
    searchType?: string,
  ): Promise<{ value: string }>;

  logLocationSearched(query?: string): Promise<{ value: string }>;

  logInvite(userId?: string, method?: string): Promise<{ value: string }>;

  logShare(
    socialContentId: string,
    socialContentName?: string,
    method?: string,
  ): Promise<{ value: string }>;

  logLike(
    socialContentId: string,
    socialContentName?: string,
    likeType?: string,
  ): Promise<{ value: string }>;

  logComment(
    socialContentId: string,
    socialContentName?: string,
  ): Promise<{ value: string }>;

  logMediaCaptured(
    mediaId?: string,
    mediaName?: string,
    mediaType?: string,
  ): Promise<{ value: string }>;

  logMediaStarted(
    mediaId?: string,
    mediaName?: string,
    mediaType?: string,
  ): Promise<{ value: string }>;

  logMediaStopped(
    duration: number,
    mediaId?: string,
    mediaName?: string,
    mediaType?: string,
  ): Promise<{ value: string }>;

  logMediaPaused(
    duration: number,
    mediaId?: string,
    mediaName?: string,
    mediaType?: string,
  ): Promise<{ value: string }>;

  logCustomEvent(
    eventName: string,
    eventParams?: [Record<string, unknown>],
    eventTimed?: boolean,
  ): Promise<{ value: string }>;

  setUserId(userId: string): Promise<{ value: string }>;
  setAge(userAge: number): Promise<{ value: string }>;
  setGender(userGender: 'm' | 'f'): Promise<{ value: string }>;
  logError(
    errorId?: string,
    errorMessage?: string,
    error?: string,
  ): Promise<{ value: string }>;
}
