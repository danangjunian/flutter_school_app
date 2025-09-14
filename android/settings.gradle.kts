pluginManagement {
    var flutterSdkPath: String? = null
    val properties = java.util.Properties()
    val localPropertiesFile = File(rootDir, "local.properties")
    if (localPropertiesFile.exists()) {
        properties.load(localPropertiesFile.inputStream())
        flutterSdkPath = properties.getProperty("flutter.sdk")
    }
    if (flutterSdkPath == null) {
        throw GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")
    }
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.4.1" apply false
    id("org.jetbrains.kotlin.android") version "1.9.24" apply false
}

include(":app")
