macOS Sonoma now has an option to disable Pointer Acceleration built in to the System Settings:

https://apple.stackexchange.com/a/461057/36202

<img src="https://user-images.githubusercontent.com/74698406/268474477-8d7a1382-35bb-4639-87ac-c5e1b737b09d.png" />

---

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

## Technical notes

As it turns out, this works due to a... bug? feature? in
`IOHIDFamily/IOHIDEventSystemPlugIns/IOHIDPointerScrollFilter.cpp`.
The acceleration is reset, then the new acceleration is checked for a negative value.
If it is negative, the function immediately returns without configuring a new acceleration
value, which gives us the "unaccelerated" behavior.

You may notice that this file also handles scroll acceleration. Why doesn't this work for
scroll, you ask? The answer is that for scroll acceleration, the acceleration is checked
before the value is reset, and so setting the scroll acceleration to a negative value has
no effect.
