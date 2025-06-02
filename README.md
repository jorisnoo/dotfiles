# my dotfiles 🦚

A home for my mac configuration.

This repository contains:
- a list of [software I use](homebrew/Brewfile)
- globally installed [composer](https://getcomposer.org/) [packages](config/.composer/composer.json)
- my [aliases](.config/fish/aliases) for [fish shell](https://fishshell.com)
- [adjusted](macos/.macos) list of [sensible macOS defaults](https://mths.be/macos)
- a [maintenance script](maintenance.fish) that updates installed packages 
- an [installation script](install.sh) to set up all the above on a new machine

## Usage: Setting up a new machine

### Before the re-install

- [ ] Did I commit and push any changes/branches to my git repositories?
- [ ] Did I save all important documents from local directories?
- [ ] Did I backup all local databases?
- [ ] Did I export Little Snitch Rules
- [ ] Did i copy all `.env` files?

### Installing a clean copy of macOS

1. Update macOS to the latest version
1. Turn on FileVault and Firewall (Stealth mode)
1. Install macOS Command Line Tools by running `xcode-select --install`
1. Install Homebrew by running `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Clone this repo to `~/.dotfiles`
1. Sign in to the Mac App Store and download Xcode
1. Accept the Xcode licence agreement by running `sudo xcodebuild -license accept`
1. Run `. install.sh` to start the installation
1. Switch the default shell to fish using `echo /usr/local/bin/fish | sudo tee -a /etc/shells && chsh -s /usr/local/bin/fish`
1. Run `./macos/.macos` to apply "sensible macOS default" settings
1. Restart computer to finalize the process

## Reading

* [Hardening macOS](https://blog.bejarano.io/hardening-macos.html)
* [macOS Security and Privacy Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

## Thanks 💙

- [@medoai](https://github.com/meodai/dotfiles)
- [@driesvints](https://github.com/driesvints/dotfiles)
- [@mathiasbynens](https://mths.be/macos)
