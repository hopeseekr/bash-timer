# Bash Timer

Shows a human-readable execution time for every command run in bash.

You might also find my [**Amazing Linux, PHP, and Git Aliases**](https://gist.github.com/hopeseekr/fb85b7a179e3b9c97212925a2bd8400b) quite useful as well.

## Installation

### Use the Installer

```bash
curl https://raw.githubusercontent.com/hopeseekr/bash-timer/v1.0.0/install | bash
```

### Manual

1. Download the files:

```bash
curl https://raw.githubusercontent.com/hopeseekr/bash-timer/v1.0.0/bash-timer.sh -o $HOME/.bash-timer.sh
echo "c2e66332be7fe055d684c47a8f68b56926f7b03703f9e0c0aca95dbe310ec7c3  $HOME/.bash-timer.sh" | sha256sum -c -

curl https://raw.githubusercontent.com/bash-timer/bash-timer/v1.0.0/assets/bash-preexec.sh -o $HOME/.bash-preexec.sh
echo "04947faeb7f735d37cce12d820a1766ce0eb8288b64ee119e3ca1b00c4ed69ebce  $HOME/.bash-preexec.sh" | sha256sum -c -
```

2. Add the following to the very bottom of your `~/.bash_rc`.

```bash
# Bash Timer
# See https://github.com/hopeseekr/bash-timer
[[ -f ~/.bash-timer.sh ]] && source ~/.bash-timer.sh

# See https://github.com/rcaloras/bash-preexec
# **WARNING:** This must be the last line of your .bashrc.
# Source our file at the end of our bash profile (e.g. ~/.bashrc, ~/.profile, or ~/.bash_profile)
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
```
## License

This project is licensed under the Apache v2.0 License (see LICENSE.md).

![License Summary](https://user-images.githubusercontent.com/1125541/93617603-cd6de580-f99b-11ea-9da4-f79c168c97df.png)

## Contributors

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.
