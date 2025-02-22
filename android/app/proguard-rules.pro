# proguardFiles setting in build.gradle.
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class okio.** { *; }
-keep class in.fortytwo42.enterprise.** { *; }
-keep class okio.** { *; }


-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.conscrypt.OpenSSLProvider
-dontwarn okhttp3.logging.HttpLoggingInterceptor$Level
-dontwarn okhttp3.logging.HttpLoggingInterceptor
-dontwarn org.apache.commons.codec.binary.Base32

-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.conscrypt.OpenSSLProvider
-dontwarn okhttp3.logging.HttpLoggingInterceptor$Level
-dontwarn okhttp3.logging.HttpLoggingInterceptor
-dontwarn org.apache.commons.codec.binary.Base32



-dontwarn io.flutter.**

# OkHttp Library
-dontwarn okio.**
-dontwarn retrofit.**
-dontwarn rx.**

# For Modifier
-dontwarn javax.lang.model.element.**

# For SSLParametersImpl (Harmony)
-dontwarn org.apache.harmony.xnet.provider.jsse.**

# Remove debug information
-optimizationpasses 5
-optimizationpasses 6
