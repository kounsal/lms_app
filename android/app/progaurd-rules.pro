# Keep annotation attributes
-keepattributes *Annotation*

# Don't warn about missing Razorpay classes
-dontwarn com.razorpay.**

# Keep all Razorpay classes and interfaces
-keep class com.razorpay.** { *; }
-keep interface com.razorpay.** { *; }

# Optimize while avoiding method inlining issues
-optimizations !method/inlining/

# Keep payment-related methods
-keepclasseswithmembers class * {
    public void onPayment*(...);
}

# Keep Android and Kotlin standard classes (if used)
-dontwarn kotlin.**
-dontwarn androidx.**
-dontwarn com.google.**
-dontwarn javax.annotation.**

# Suppress warnings about missing Keep annotations (these don't exist)
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers

# Keep generic ProGuard rules for app stability
-keep class * implements android.os.Parcelable { *; }
-keep class androidx.lifecycle.ViewModel { *; }
