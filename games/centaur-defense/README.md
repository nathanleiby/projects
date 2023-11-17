# centaur-defense

Tower defense with centaurs.

![Screenshot](screenshot.png)

https://nathanleiby.itch.io/centaur-defense

## Releasing

### Making a release build

Donwload the required version of Love, if you don't yet have it

```
boon love download 11.3
```

Update the version in `Boon.toml`

```
version = "<NEW VERSION>"
```

Then build some releases: Love, Windows (32bit and 64bit), MacOS

```
make build
```

(NOTE: There's temporarily a bug where in my WSL setup the macos isn't getting renamed, so it's just `release/love.app` instead of `release/CentaurDefense.app`)

### Ship the release build to itch.io

Use `butler` to ship the release. https://itch.io/docs/butler/pushing.html

Login

```
butler login
```

Update the `VERSION` file to include your new version.

```
<NEW VERSION>
```

Push release(s), setting the version as needed.

```
make push
```


## Attributions

Thank you artists for creating this game art!

Visuals

- https://opengameart.org/content/medieval-rts-120
- https://opengameart.org/content/centaur-0

Music

- https://opengameart.org/content/cheerful-degrade

Creators: if you'd ever like me fix anything about an attribution, please let me know via email / Github issue / etc.
