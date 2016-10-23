PKGS = --pkg gtk+-3.0 --pkg cairo --pkg gdk-3.0

main: src/main.vala src/NotePad.vala
	valac $(PKGS) \
	./src/NotePad.vala \
	./src/main.vala -o main

.PHONY: clean

clean:
	rm main
