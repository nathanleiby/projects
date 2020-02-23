game := shadow-duel

build:
	boon build .
	boon build . --target windows --version 11.3
	boon build . --target macos --version 11.3

push:
	butler push release/shadow-duel-win32.zip nathanleiby/shadow-duel:win32-alpha --userversion-file VERSION
	butler push release/shadow-duel-win64.zip nathanleiby/shadow-duel:win64-alpha --userversion-file VERSION
	# butler push release/love.app nathanleiby/shadow-duel:mac-alpha --userversion-file VERSION
	butler push release/shadow-duel.love nathanleiby/shadow-duel:love-alpha --userversion-file VERSION