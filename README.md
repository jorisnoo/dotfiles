# my dotfiles 🦚

A home for my mac configuration.

This repository contains:
- a list of [software I use](homebrew/Brewfile) — installed through [Homebrew](https://brew.sh/)
- globally installed [composer](https://getcomposer.org/) [packages](composer/composer.json)
- my [aliases](fish/aliases) for [fish shell](https://fishshell.com)
- [configuration](mackup) for [mackup](https://github.com/lra/mackup)
- [adjusted](macos/.macos) list of [sensible macOS defaults](https://mths.be/macos)
- a [maintenance script](maintenance.fish) that updates installed packages 
- an [install script](install.conf.yaml) to set up all the above on a new machine using [dotbot](https://github.com/anishathalye/dotbot)

## Usage: Setting up a new machine

### Before the re-install

- [ ] Did I commit and push any changes/branches to my git repositories?
- [ ] Did I save all important documents from local directories?
- [ ] Did I update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?
- [ ] Did I back up my [Wavebox](https://wavebox.io) settings?

### Installing a clean copy of macOS

1. Update macOS to the latest version
1. Turn on FileVault and Firewall
1. Install macOS Command Line Tools by running `xcode-select --install`
2. Install Homebrew by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Clone this repo to `~/.dotfiles`
2. Sign into the Mac App Store and download Xcode
3. Accept the Xcode license agreement by running `sudo xcodebuild -license accept`
1. Run `./install` to start the installation
2. Install AlDente from `https://apphousekitchen.com/downloads/AlDente-Pro.dmg`
1. Configure Sync and wait for the 'Backup' folder to download
1. Restore preferences by running `mackup restore`
1. Run `./macos/.macos` to apply "sensible macOS default" settings
1. Restart computer to finalize the process

## Reading

* [Hardening macOS](https://blog.bejarano.io/hardening-macos.html)
* [macOS Security and Privacy Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

## Thanks 💙

- [@medoai](https://github.com/meodai/dotfiles)
- [@driesvints](https://github.com/driesvints/dotfiles)
- [@mathiasbynens](https://mths.be/macos)
