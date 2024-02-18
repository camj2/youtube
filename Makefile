PREFIX = /usr/local

all:

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin

	@install -m 755 youtube $(DESTDIR)$(PREFIX)/bin

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/youtube

check:
	-shfmt -w -d -p -i 2 -ci -sr youtube

	-shellcheck youtube

.PHONY: all install uninstall check
