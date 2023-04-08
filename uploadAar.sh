#!/usr/bin/env sh
flutter clean
flutter pub get
#flutter build aar --release
cp upload_aar.gradle .android
cp pubspec.yaml .android

#cd .android
#./gradlew build
cd .android
./gradlew \
-I=upload_aar.gradle \
-Pmaven-url=https://packages.aliyun.com/maven/repository/2190912-release-isEirC/ \
-Psnapshot-maven-url=https://packages.aliyun.com/maven/repository/2190912-snapshot-tG3D3A/ \
-Pis-plugin=false \
-Ptarget-platform=android-arm,android-arm64 \
-Pvariant=release assembleAarRelease \
-Psplit-debug-info=./.symbols_android \
-Pdart-obfuscation=true