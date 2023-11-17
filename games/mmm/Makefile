game := mmm

build:
	boon build .
	# boon build . --target windows --version 11.3
	# boon build . --target macos --version 11.3

# https://github.com/davidobot/love.js
build-web:
	rm -rf ./release/web
	npm install -g love.js
	# we do weird hackery with the game path, since `.` or `./` don't work.. so `../mmm` it is
	love.js ../mmm ./release/web/ -c -t mmm

push:
	# butler push release/mmm-win32.zip nathanleiby/mmm:win32-alpha --userversion-file VERSION
	# butler push release/mmm-win64.zip nathanleiby/mmm:win64-alpha --userversion-file VERSION
	# butler push release/love.app nathanleiby/mmm:mac-alpha --userversion-file VERSION
	butler push release/mmm.love nathanleiby/mmm:love-alpha --userversion-file VERSION
