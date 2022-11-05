/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb
  extends WebPlugin
  implements FlurryAnalyticsPlugin
{
  initialize(_opts: {
    apiKey: string;
    logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error' | undefined;
    crashReportingEnabled?: boolean | undefined;
    appVersion?: string | undefined;
    iapReportingEnabled?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentRated(_opts: {
    contentId: string;
    contentRating: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentViewed(_opts: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logContentSaved(_opts: {
    contentId: string;
    contentName?: string | undefined;
    contentType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logProductCustomized(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionStarted(_opts: {
    price: number;
    isAnnualSubscription: boolean;
    trialDays?: number | undefined;
    predictedLTV?: string | undefined;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSubscriptionEnded(_opts: {
    isAnnualSubscription: boolean;
    currencyType?: string | undefined;
    subscriptionCountry?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupJoined(_opts: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logGroupLeft(_opts: {
    groupName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogin(_opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLogout(_opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logUserRegistered(_opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logSearchResultViewed(_opts: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logKeywordSearched(_opts: {
    query?: string | undefined;
    searchType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLocationSearched(_opts: {
    query?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logInvite(_opts: {
    userId?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logShare(_opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
    method?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLike(_opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
    likeType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logComment(_opts: {
    socialContentId: string;
    socialContentName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaCaptured(_opts: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStarted(_opts: {
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaStopped(_opts: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logMediaPaused(_opts: {
    duration: number;
    mediaId?: string | undefined;
    mediaName?: string | undefined;
    mediaType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCustomEvent(_opts: {
    eventName: string;
    eventParams?: [Record<string, unknown>] | undefined;
    eventTimed?: boolean | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setUserId(_opts: { userId: string }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setAge(_opts: { userAge: number }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  setGender(_opts: { userGender: 'm' | 'f' }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logError(_opts: {
    errorId?: string | undefined;
    errorMessage?: string | undefined;
    error?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
}
