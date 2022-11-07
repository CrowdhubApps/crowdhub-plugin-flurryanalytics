/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb
  extends WebPlugin
  implements FlurryAnalyticsPlugin
{
  endTimedEvent(_options: { eventName: string }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  initialize(_options: {
    apiKey: string;
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error' | undefined;
    crashReportingEnabled?: boolean | undefined;
    appVersion?: string | undefined;
    iapReportingEnabled?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentRated(_options: {
    contentId: string;
    contentRating: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentViewed(_options: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentSaved(_options: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logProductCustomized(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionStarted(_options: {
    price: number;
    isAnnualSubscription: boolean;
    trialDays?: number | undefined;
    predictedLTV?: string | undefined;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionEnded(_options: {
    isAnnualSubscription: boolean;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupJoined(_options: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupLeft(_options: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogin(_options: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogout(_options: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logUserRegistered(_options: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSearchResultViewed(_options: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logKeywordSearched(_options: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLocationSearched(_options: {
    query?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logInvite(_options: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logShare(_options: {
    socialContentId: string;
    socialContentName?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLike(_options: {
    socialContentId: string;
    socialContentName?: string | undefined;
    likeType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logComment(_options: {
    socialContentId: string;
    socialContentName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaCaptured(_options: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStarted(_options: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStopped(_options: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaPaused(_options: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCustomEvent(_options: {
    eventName: string;
    eventParams?: { [key: string]: string } | undefined;
    eventTimed?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setUserId(_options: { userId: string }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setAge(_options: { userAge: number }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setGender(_options: { userGender: 'm' | 'f' }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logError(_options: {
    errorId?: string | undefined;
    errorMessage?: string | undefined;
    error?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
}
