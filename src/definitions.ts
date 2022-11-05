export interface FlurryAnalyticsPlugin {
  initialize(opts: {
    apiKey: string;
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error';
    crashReportingEnabled?: boolean;
    appVersion?: string;
    iapReportingEnabled?: boolean;
  }): Promise<{ value: string }>;

  logContentRated(opts: {
    contentId: string;
    contentRating: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  logContentViewed(opts: {
    contentId: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  logContentSaved(opts: {
    contentId: string;
    contentName?: string;
    contentType?: string;
  }): Promise<{ value: string }>;

  logProductCustomized(): Promise<{ value: string }>;

  logSubscriptionStarted(opts: {
    price: number;
    isAnnualSubscription: boolean;
    trialDays?: number;
    predictedLTV?: string;
    currencyType?: string;
    subscriptionCountry?: string;
  }): Promise<{ value: string }>;

  logSubscriptionEnded(opts: {
    isAnnualSubscription: boolean;
    currencyType?: string;
    subscriptionCountry?: string;
  }): Promise<{ value: string }>;

  logGroupJoined(opts: { groupName?: string }): Promise<{ value: string }>;

  logGroupLeft(opts: { groupName?: string }): Promise<{ value: string }>;

  logLogin(opts: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  logLogout(opts: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  logUserRegistered(opts: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  logSearchResultViewed(opts: {
    query?: string;
    searchType?: string;
  }): Promise<{ value: string }>;

  logKeywordSearched(opts: {
    query?: string;
    searchType?: string;
  }): Promise<{ value: string }>;

  logLocationSearched(opts: { query?: string }): Promise<{ value: string }>;

  logInvite(opts: {
    userId?: string;
    method?: string;
  }): Promise<{ value: string }>;

  logShare(opts: {
    socialContentId: string;
    socialContentName?: string;
    method?: string;
  }): Promise<{ value: string }>;

  logLike(opts: {
    socialContentId: string;
    socialContentName?: string;
    likeType?: string;
  }): Promise<{ value: string }>;

  logComment(opts: {
    socialContentId: string;
    socialContentName?: string;
  }): Promise<{ value: string }>;

  logMediaCaptured(opts: {
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  logMediaStarted(opts: {
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  logMediaStopped(opts: {
    duration: number;
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  logMediaPaused(opts: {
    duration: number;
    mediaId?: string;
    mediaName?: string;
    mediaType?: string;
  }): Promise<{ value: string }>;

  logCustomEvent(opts: {
    eventName: string;
    eventParams?: { [key: string]: any };
    eventTimed?: boolean;
  }): Promise<{ value: string }>;

  setUserId(opts: { userId: string }): Promise<{ value: string }>;
  setAge(opts: { userAge: number }): Promise<{ value: string }>;
  setGender(opts: { userGender: 'm' | 'f' }): Promise<{ value: string }>;

  logError(opts: {
    errorId?: string;
    errorMessage?: string;
    error?: string;
  }): Promise<{ value: string }>;
}
