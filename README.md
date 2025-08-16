# MEP Dubai App (Final Fix v2)
- CardThemeData fix (Flutter 3.32+)
- CI scaffolds Android then patches NDK 27.0.12077973
- Build APK in Actions → artifact download

## Steps
1. New empty GitHub repo.
2. Upload ALL files (keep `.github/` at root).
3. Actions → run Build Flutter APK.
4. Download `mep-dubai-apk` → `app-release.apk`.
