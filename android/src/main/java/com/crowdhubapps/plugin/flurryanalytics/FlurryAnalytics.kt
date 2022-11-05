package com.crowdhubapps.plugin.flurryanalytics

import android.util.Log

class FlurryAnalytics {
    fun echo(value: String): String {
        Log.i("Echo", value)
        return value
    }
}