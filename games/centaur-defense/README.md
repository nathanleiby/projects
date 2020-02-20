# centaur-defense

Tower defense with centaurs.

https://nathanleiby.itch.io/centaur-defense

## Releasing

### Making a release build

Donwload the required version of Love, if you don't yet have it

```
boon love download 11.3
```

Make some releases (Love, Windows, MacOS)
```
boon build .
boon build . --target windows --version 11.3
boon build . --target macos --version 11.3
```

(NOTE: There's temporarily a bug where in my WSL setup the macos isn't getting renamed, so it's just `release/love.app` instead of `release/CentaurDefense.app`)

### Ship the release build to itch.io

Use `butler` to ship the release. https://itch.io/docs/butler/pushing.html

Login

```
butler login
```

Push release(s), setting the version as needed.

```
butler push release/CentaurDefense-win32.zip nathanleiby/centaur-defense:win32-alpha --userversion 0.0.1
butler push release/CentaurDefense-win64.zip nathanleiby/centaur-defense:win64-alpha --userversion 0.0.1
butler push release/love.app nathanleiby/centaur-defense:mac-alpha --userversion 0.0.1
butler push release/CentaurDefense.love nathanleiby/centaur-defense:love-alpha --userversion 0.0.1
```
