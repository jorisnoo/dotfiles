# my dotfiles 🦚

A home for my mac configuration and installer when setting up a new machine.

### Before the re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud/Sync directories?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing a clean copy of macOS

After going through the checklist above and making sure you backed everything up, [install macOS](https://www.imore.com/how-do-clean-install-macos) with the latest release.

### Setting up the Mac

1. Update macOS to the latest version
2. Log into the App Store and download Xcode, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Install [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) by running `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
7. Run `./install` to start the installation
7. Configure Sync and wait for the 'Backup' folder to download
8. Restore preferences by running `mackup restore`
9. Run `./macos/.macos` to apply "sensible macOS default" settings
10. Restart computer to finalize the process

## Reading

* [Hardening macOS](https://blog.bejarano.io/hardening-macos.html)
* [macOS Security and Privacy Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

## Thanks To... 💙

- [medoai](https://github.com/meodai/dotfiles)
- [driesvints](https://github.com/driesvints/dotfiles)
- [mathiasbynens](https://mths.be/macos)
