# dotfiles

### Before the re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing a clean copy of macOS

After going through the checklist above and making sure you backed everything up, we're going to [install macOS](https://www.imore.com/how-do-clean-install-macos) with the latest release.

### Setting up the Mac

1. Update macOS to the latest version
2. Log into the App Store and download Xcode, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Install [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) by running `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
7. Run `. ./fresh-install.sh` to start the installation
8. Setup Sync.com and locate folder at `~/Sync`
9. Restore preferences by running `mackup restore`
10. Restart computer to finalize the process

## Resources

* [Hardening macOS](https://blog.bejarano.io/hardening-macos.html)
* [macOS Security and Privacy Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

## Thanks To...

The initial repo was forked from [medoai](https://github.com/meodai/dotfiles) and [driesvints](https://github.com/driesvints/dotfiles) dotfiles 💙
