SITE = gridlock.gay

sync:
	-rsync -av build/ vps:/home/sammi/www/$(SITE)/