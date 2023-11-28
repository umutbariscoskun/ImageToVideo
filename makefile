build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs


deep-clean-arm:
	$(MAKE) remove-lock-files
	$(MAKE) clean
	cd ios && pod cache clean --all
	cd ios && arch -x86_64 pod install --repo-update

remove-lock-files:
	rm -rf pubspec.lock
	rm -rf ios/Podfile.lock	

clean:
	flutter clean
	$(MAKE) get

get:
	flutter pub get