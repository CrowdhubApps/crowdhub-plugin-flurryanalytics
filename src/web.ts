import { WebPlugin } from '@capacitor/core';

import type { FlurryAnalyticsPlugin } from './definitions';

export class FlurryAnalyticsWeb extends WebPlugin implements FlurryAnalyticsPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
