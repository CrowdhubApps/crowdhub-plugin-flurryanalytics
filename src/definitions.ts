export interface FlurryAnalyticsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
