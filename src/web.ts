import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb
  extends WebPlugin
  implements FlurryAnalyticsPlugin
{
  initialize(
    apiKey: string,
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error' | undefined,
    crashReportingEnabled?: boolean | undefined,
    appVersion?: string | undefined,
    iapReportingEnabled?: boolean | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentRated(
    contentId: string,
    contentRating: string,
    contentName?: string | undefined,
    contentType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentViewed(
    contentId: string,
    contentName?: string | undefined,
    contentType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentSaved(
    contentId: string,
    contentName?: string | undefined,
    contentType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logProductCustomized(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionStarted(
    price: number,
    isAnnualSubscribtion: boolean,
    trialDays?: number | undefined,
    predictedLTV?: string | undefined,
    currencyType?: string | undefined,
    subscriptionCountry?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionEnded(
    isAnnualSubscribtion: boolean,
    currencyType?: string | undefined,
    subscriptionCountry?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupJoined(groupName?: string | undefined): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupLeft(groupName?: string | undefined): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogin(
    userId?: string | undefined,
    method?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogout(
    userId?: string | undefined,
    method?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logUserRegistered(
    userId?: string | undefined,
    method?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSearchResultViewed(
    query?: string | undefined,
    searchType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logKeywordSearched(
    query?: string | undefined,
    searchType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLocationSearched(query?: string | undefined): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logInvite(
    userId?: string | undefined,
    method?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logShare(
    socialContentId: string,
    socialContentName?: string | undefined,
    method?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLike(
    socialContentId: string,
    socialContentName?: string | undefined,
    likeType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logComment(
    socialContentId: string,
    socialContentName?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaCaptured(
    mediaId?: string | undefined,
    mediaName?: string | undefined,
    mediaType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStarted(
    mediaId?: string | undefined,
    mediaName?: string | undefined,
    mediaType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStopped(
    duration: number,
    mediaId?: string | undefined,
    mediaName?: string | undefined,
    mediaType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaPaused(
    duration: number,
    mediaId?: string | undefined,
    mediaName?: string | undefined,
    mediaType?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCustomEvent(
    eventName: string,
    eventParams?: [Record<string, unknown>] | undefined,
    eventTimed?: boolean | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setUserId(userId: string): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setAge(userAge: number): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setGender(userGender: 'm' | 'f'): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logError(
    errorId?: string | undefined,
    errorMessage?: string | undefined,
    error?: string | undefined,
  ): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
}
