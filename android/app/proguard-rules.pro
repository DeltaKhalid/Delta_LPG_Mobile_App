# Flutter wrapper
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Keep Flutter engine classes
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugin.** { *; }

# Keep XML-related classes used by flutter_svg and Dart's XML parser
-keep class org.xmlpull.** { *; }
-dontwarn org.xmlpull.**
-keep class javax.xml.** { *; }
-dontwarn javax.xml.**
-keep class org.xml.sax.** { *; }
-dontwarn org.xml.sax.**
-keep class org.w3c.dom.** { *; }
-dontwarn org.w3c.dom.**

# Keep AndroidX classes
-keep class androidx.** { *; }
-dontwarn androidx.**

# Keep annotation attributes
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable

# Suppress warnings for missing classes
-dontwarn kotlin.**
-dontwarn kotlinx.**

