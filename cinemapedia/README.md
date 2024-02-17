# cinemapedia

# Dev

1. Copy .env.template file and rename it to .env
2. Change the environment vars (TMDB key) 
3. After change any of the entities, run next command:
```
dart run build_runner build
```



# Prod
To change the app name, run next command:
```
dart run change_app_package_name:main com.lrudenick.cinemapedia-test
```

To change the app icon, run next command:
```
dart run flutter_launcher_icons
```

To change the splash screen, run next command:
```
dart run flutter_native_splash:create
```


Android AAB
```
flutter build appbundle
```
