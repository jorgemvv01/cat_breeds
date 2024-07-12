cd android
# # flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/cat_breeds.dart
cd ..

gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --use-orchestrator \
  --timeout 3m \
  --results-bucket=gs://integration_results_mjcoffee \
  --results-dir=tests/firebase

# cd android
# # # flutter build generates files in android/ for building the app
# flutter build apk
# ./gradlew app:assembleAndroidTest
# ./gradlew app:assembleDebug -Ptarget=integration_test/cat_breeds.dart
# cd ..

# # gcloud auth activate-service-account --key-file=cat-breeds-1d9d3-3f1316484441.json
# # gcloud --quiet config set project cat-breeds-1d9d3

# gcloud firebase test android run --type instrumentation \
#   --app build/app/outputs/apk/debug/app-debug.apk \
#   --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
#   --device-ids=SmallPhone.arm \
#   --os-version-ids=34 \
#   --orientations=portrait \
#   --use-orchestrator \
#   --timeout 3m \
# #   --results-bucket=gs://integration_results_mjcoffee \
# #   --results-dir=tests/firebase

# ## > gcloud firebase test android models list
# # gcloud firebase test android run --type instrumentation \
# #   --app build/app/outputs/apk/debug/app-debug.apk \
# #   --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
# #   --device-ids=blueline,OnePlus5T,x1q,redfin,flame \
# #   --os-version-ids=25,26,27,28,29,30 \
# #   --locales=en_GB,es \
# #   --orientations=portrait,landscape \
# #   --use-orchestrator \
# #   --timeout 40m \
# #   --results-bucket=gs://integration_results_mjcoffee \
# #   --results-dir=tests/firebase  