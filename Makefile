LUASTATIC ?= luastatic
LUA ?= lua5.1
LUA_INCLUDE ?= /usr/include/$(LUA)

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

SRC = moonvnc.lua src/moonvnc-app.lua src/moonvnc-vnc.lua

moonterm: 
	$(LUASTATIC) $(SRC) -l$(LUA) -I$(LUA_INCLUDE)
	@strip moonvnc

install:
	install -Dm775 moonvnc $(DESTDIR)$(BINDIR)/moonvnc

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)/moonvnc

clean:
	rm -rf moonvnc.luastatic.c
	rm -rf moonvnc

.PHONY: moonvnc