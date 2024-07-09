all: clean-get gen

clean-get:
	clear
	@echo "[clean-get]"

	flutter clean
	flutter pub get

gen:
	clear
	@echo "[gen]"

	dart run build_runner build --delete-conflicting-outputs