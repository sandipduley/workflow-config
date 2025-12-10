#! bash oh-my-bash.module

# My custom ohmybash theme

# Emoji-Powered Neon Bash Prompt Theme ✨

# ───────────────────────────────────────────────
# ICONS
icon_start="╭─"
icon_user=" 🐦‍🔥 "
icon_host=" ⛳ "
icon_directory=" in 📁 "
icon_branch="🌿"
icon_end="➤➤ "

# ───────────────────────────────────────────────
# GIT SYMBOLS
git_ahead="↑"
git_behind="↓"
git_untracked="⌀"
git_unstaged="•"
git_staged="+"
git_dirty="✗"
git_clean="✓"

# ───────────────────────────────────────────────
# NEON COLORS
neon_red=$'\[\e[1;38;5;196m\]'
neon_green=$'\[\e[1;38;5;46m\]'
neon_yellow=$'\[\e[1;38;5;226m\]'
neon_blue=$'\[\e[1;38;5;51m\]'
neon_cyan=$'\[\e[1;38;5;14m\]'
neon_magenta=$'\[\e[1;38;5;201m\]'
neon_white=$'\[\e[1;97m\]'
neon_reset=$'\[\e[0m\]'

# ───────────────────────────────────────────────
# GIT PROMPT INFO
function git_prompt_info() {
    local ref dirty
    ref=$(git symbolic-ref --short HEAD 2>/dev/null)
    [ -n "$ref" ] || return
    dirty=$(git status --porcelain 2>/dev/null)
    echo " on (${neon_magenta}${icon_branch}${ref}${dirty:+ ${git_dirty}}${neon_reset})"
}

# ───────────────────────────────────────────────
# PROMPT COMMAND
function _omb_theme_PROMPT_COMMAND() {
    PS1='\n'

    # Top Line
    PS1+="${neon_red}${icon_start}"
    PS1+="${neon_green}${icon_user}${neon_yellow}\u${neon_reset}"
    PS1+="${neon_blue}${icon_host}${neon_cyan}\h${neon_reset}"
    PS1+="${icon_directory}${neon_magenta}\${PWD}${neon_reset}" # FULL PATH

    # Git Info
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        PS1+="$(git_prompt_info)"
    fi

    # Bottom Line
    PS1+='\n'"${neon_red}${icon_end}${neon_reset} "
    PS2="${icon_end}"
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
