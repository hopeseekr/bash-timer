# Bash Timer

Shows a human-readable execution time for every command run in bash.

## Installation

Add the following to the very bottom of your `~/.bash_rc`.

```bash
# Bash Timer
# See https://github.com/hopeseekr/bash-timer
if [ ! -f ~/.bash-timer.sh ]; then
  # Pull down our file from GitHub and write it to our home directory as a hidden file.
  curl https://raw.githubusercontent.com/hopeseekr/bash-timer/master/bash-timer.sh -o ~/.bash-timer.sh
fi
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# Bash Preexec.
# See https://github.com/rcaloras/bash-preexec
# **WARNING:** This must be the last line of your .bashrc.
if [ ! -f ~/.bash-preexec.sh ]; then
  curl https://raw.githubusercontent.com/bash-timer/bash-timer/master/assets/bash-preexec.sh -o ~/.bash-preexec.sh
fi  
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
