/* eslint-disable @typescript-eslint/no-unused-vars */
import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb
  extends WebPlugin
  implements FlurryAnalyticsPlugin
{
  logAdClick(options: {
    adType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAdImpression(options: {
    adType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAdRewarded(options: {
    adType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAdSkipped(options: {
    adType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCreditsSpent(options: {
    levelNumber?: number | undefined;
    totalAmount: number;
    isCurrencySoft?: boolean | undefined;
    creditType?: string | undefined;
    creditId?: string | undefined;
    creditName?: string | undefined;
    currencyType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCreditsPurchased(options: {
    levelNumber?: number | undefined;
    totalAmount: number;
    isCurrencySoft?: boolean | undefined;
    creditType?: string | undefined;
    creditId?: string | undefined;
    creditName?: string | undefined;
    currencyType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCreditsEarned(options: {
    levelNumber?: number | undefined;
    totalAmount: number;
    isCurrencySoft?: boolean | undefined;
    creditType?: string | undefined;
    creditId?: string | undefined;
    creditName?: string | undefined;
    currencyType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAchievementUnlocked(options: {
    achievementId?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLevelCompleted(options: {
    levelNumber: number;
    levelName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLevelFailed(options: {
    levelNumber: number | undefined;
    levelName?: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLevelUp(options: {
    levelNumber: number | undefined;
    levelName?: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLevelStarted(options: {
    levelNumber: number | undefined;
    levelName?: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logLevelSkip(options: {
    levelNumber: number | undefined;
    levelName?: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logScorePosted(options: {
    levelNumber?: number | undefined;
    score: number;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAppActivated(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logApplicationSubmitted(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAddItemToCart(options: {
    itemCount: number;
    price: number;
    itemId?: string | undefined;
    itemName?: string | undefined;
    itemType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logAddItemToWishList(options: {
    itemCount: number;
    price: number;
    itemId?: string | undefined;
    itemName?: string | undefined;
    itemType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCompletedCheckout(options: {
    itemCount: number;
    totalAmount: number;
    currencyType?: string | undefined;
    transactionId?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPaymentInfoAdded(options: {
    success: boolean;
    paymentType: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logItemViewed(options: {
    price?: number | undefined;
    itemId: string;
    itemName?: string | undefined;
    itemType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logItemListViewed(options: {
    itemListType: string;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPurchased(options: {
    itemCount?: number | undefined;
    totalAmount: number;
    itemId?: string | undefined;
    success: boolean;
    itemName?: string | undefined;
    itemType?: string | undefined;
    currencyType?: string | undefined;
    transactionId?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPurchaseRefunded(options: {
    price: number;
    currencyType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logRemoveItemFromCart(options: {
    price?: number | undefined;
    itemId: string;
    itemName?: string | undefined;
    itemType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logCheckoutInitiated(options: {
    itemCount: number;
    totalAmount: number;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logFundsDonated(options: {
    price: number;
    currencyType?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logUserScheduled(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logOfferPresented(options: {
    price: number;
    itemId: string;
    itemName?: string | undefined;
    itemCategory?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logTutorialStarted(options: {
    tutorialName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logTutorialCompleted(options: {
    tutorialName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logTutorialStepCompleted(options: {
    stepNumber: number;
    tutorialName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logTutorialSkipped(options: {
    stepNumber: number;
    tutorialName?: string | undefined;
  }): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPrivacyPromptDisplayed(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPrivacyOptIn(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
  logPrivacyOptOut(): Promise<{ value: string }> {
    throw new Error('Method not implemented.');
  }
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
