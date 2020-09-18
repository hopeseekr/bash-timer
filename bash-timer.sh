## Bash Timer
##   https://github.com/hopeseekr/bash-timer
##
## Copyright © 2020 Theodore R. Smith <theodore@phpexperts.pro>
##   GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690
##   https://stackoverflow.com/users/story/430062
##
## Based off of the work of 
##  * https://jakemccrary.com/blog/2020/04/21/using-bash-preexec-for-monitoring-the-runtime-of-your-last-command/
##
## This file is licensed under the Apache v2.0 License.

## Set up tput for multi-terminal color support.
if [ $(builtin type -P "tput" 2>&1)  ]; then
  tput init
  BOLD="\[$(tput bold)\]"
  RESET="\[$(tput sgr0)\]"
else
  BOLD="\[\033[1m\]"
  RESET="\[\033[0m\]"
fi

human_time()
{
  local msg
  local s=$1
  local days=$((s / (60*60*24)))
  s=$((s - days*60*60*24))
  local hours=$((s / (60*60)))
  s=$((s - hours*60*60))
  local min=$((s / 60))
  s=$((s - min*60))

  if (($days > 0)); then
    printf "%1d:%02d:%02d:%02d" $days $hours $min $s
    return
  fi

  if (($hours > 0)); then
    printf "%1d:%02d:%02d" $hours $min $s
    return
  fi

  if (($min > 0)); then
    printf "%1d:%02d" $min $s
    return
  fi

  echo $s
}  

preexec() {
    read begin_s begin_ns <<< $(date +"%s %N")
    begin_ns="${begin_ns##+(0)}"
    timer_show="0"
}

precmd() {
  if [ ! -z "$begin_ns" ]; then
    local end_s
    local end_ns
    read end_s end_ns <<< $(date +"%s %N")
    end_ns="${end_ns##+(0)}"

    local s=$((end_s - begin_s))
    local ms
    if [ "$end_ns" -ge "$begin_ns" ]
    then
      ms=$(((end_ns - begin_ns) / 1000000))
    else
      s=$((s - 1))
      ms=$(((1000000000 + end_ns - begin_ns) / 1000000))
    fi

    if (($s > 60)); then
      timer_show="$(human_time $s).$ms"
    else
      timer_show="$s.$ms"
    fi
  fi

  if [ -z "$PS1orig" ]; then
    PS1orig=$PS1
  else
    PS1="${BOLD}$timer_show${RESET} $PS1orig"
  fi
}

