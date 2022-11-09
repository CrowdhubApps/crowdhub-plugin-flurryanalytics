import { registerPlugin } from "@capacitor/core";

import type { FlurryAnalyticsPlugin } from "./definitions";

const FlurryAnalytics = registerPlugin<FlurryAnalyticsPlugin>(
	"FlurryAnalytics",
	{
		web: () => import("./web").then((m) => new m.FlurryAnalyticsWeb()),
	},
);

export * from "./definitions";
export { FlurryAnalytics };
