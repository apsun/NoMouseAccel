# NoMouseAccel

This app disables mouse acceleration on macOS.

You've probably already heard of this command:

```
defaults write .GlobalPreferences com.apple.mouse.scaling -1
```

Unfortunately, it also has the side effect of making your mouse movement insanely slow.
Unlike that command, this app disables acceleration with no side effects.

Also want to get rid of scroll acceleration? This app works well when paired with
[Discrete Scroll](https://github.com/emreyolcu/discrete-scroll).

## Usage

Download the release, drag it into /Applications, then go to Settings -> Users & Groups ->
Login Items and add NoMouseAccel.app to the list.

## Credits

This is basically just a cleaned up and packaged version of the code from
https://forums3.armagetronad.net/viewtopic.php?t=3364. All credits to the author.
