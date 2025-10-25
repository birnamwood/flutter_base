plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.birnamwood.flutter_base.flutter_base"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
    
    val dartDefines = mutableMapOf<String, String>()

    if (project.hasProperty("dart-defines")) {
        val dartDefinesProperty = project.property("dart-defines") as String
        dartDefinesProperty.split(",").forEach { entry ->
            val decoded = String(Base64.getDecoder().decode(entry), Charsets.UTF_8)
            val pair = decoded.split("=")
            if (pair.size == 2) {
                dartDefines[pair[0]] = pair[1]
            }
        }
    }

    defaultConfig {
        applicationId = dartDefines["appId"] 
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
