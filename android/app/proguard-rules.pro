# Mapbox ProGuard configuration
-keep class com.mapbox.** { *; }
-keep interface com.mapbox.** { *; }
-dontwarn com.mapbox.**

# Keep native methods
-keepclassmembers class * {
    native <methods>;
}

# Keep Mapbox specific classes
-keep class com.mapbox.mapboxsdk.** { *; }
-keep class com.mapbox.services.** { *; }
-keep class com.mapbox.turf.** { *; }
-keep class com.mapbox.geojson.** { *; }

# Keep annotation classes used by Mapbox
-keep class * extends java.lang.annotation.Annotation { *; }

# Additional Mapbox Maps SDK rules
-keep class com.mapbox.maps.** { *; }
-keep interface com.mapbox.maps.** { *; }
-dontwarn com.mapbox.maps.**
