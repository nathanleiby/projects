build:
	boon build .
	boon build . --target windows --version 11.3
	boon build . --target macos --version 11.3

push:
	butler push release/CentaurDefense-win32.zip nathanleiby/centaur-defense:win32-alpha --userversion-file VERSION
	butler push release/CentaurDefense-win64.zip nathanleiby/centaur-defense:win64-alpha --userversion-file VERSION
	butler push release/love.app nathanleiby/centaur-defense:mac-alpha --userversion-file VERSION
	butler push release/CentaurDefense.love nathanleiby/centaur-defense:love-alpha --userversion-file VERSION