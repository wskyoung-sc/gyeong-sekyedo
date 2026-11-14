# 경씨 세계도 (Flutter)

청주경씨 석촌공 여주종회 세계도를 앱으로 보여주는 Flutter 프로젝트입니다.
화면은 `assets/index.html`을 WebView로 띄웁니다.

## APK 만들기

```bash
cd gyeong_sekyedo
flutter create . --platforms=android --org kr.gyeong --project-name gyeong_sekyedo
flutter pub get
flutter build apk --release
```

결과물: `build/app/outputs/flutter-apk/app-release.apk`

- `flutter create .`는 android 폴더만 새로 만들고 `lib/main.dart`, `pubspec.yaml`은 그대로 둡니다.
- 앱 이름을 바꾸려면 `android/app/src/main/AndroidManifest.xml`의 `android:label`을 "경씨 세계도"로 고치세요.
- release 빌드는 기본으로 디버그 키로 서명되므로 바로 설치할 수 있습니다(스토어 배포 시엔 별도 서명 필요).
- 내용 수정은 `assets/index.html`만 고치고 다시 빌드하면 됩니다.
- 인터넷이 없으면 글꼴만 기본 글꼴로 바뀌고 나머지는 그대로 동작합니다.
