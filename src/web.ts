import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb
  extends WebPlugin
  implements FlurryAnalyticsPlugin
{
  initialize(opts: {
    apiKey: string;
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error' | undefined;
    crashReportingEnabled?: boolean | undefined;
    appVersion?: string | undefined;
    iapReportingEnabled?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentRated(opts: {
    contentId: string;
    contentRating: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentViewed(opts: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentSaved(opts: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logProductCustomized(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionStarted(opts: {
    price: number;
    isAnnualSubscribtion: boolean;
    trialDays?: number | undefined;
    predictedLTV?: string | undefined;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionEnded(opts: {
    isAnnualSubscribtion: boolean;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupJoined(opts: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupLeft(opts: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogin(opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogout(opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logUserRegistered(opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSearchResultViewed(opts: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logKeywordSearched(opts: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLocationSearched(opts: {
    query?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logInvite(opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logShare(opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLike(opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
    likeType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logComment(opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaCaptured(opts: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStarted(opts: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStopped(opts: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaPaused(opts: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCustomEvent(opts: {
    eventName: string;
    eventParams?: [Record<string, unknown>] | undefined;
    eventTimed?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setUserId(opts: { userId: string }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setAge(opts: { userAge: number }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setGender(opts: { userGender: 'm' | 'f' }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logError(opts: {
    errorId?: string | undefined;
    errorMessage?: string | undefined;
    error?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
}
