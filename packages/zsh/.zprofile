export PATH="$HOME/homebrew/bin:$PATH"
export PATH="/Applications/Julia-1.6.app/Contents/Resources/julia/bin:$PATH"
export PNPM_HOME="/Users/taka2/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/Users/taka2/Applications/quarto/bin:$PATH"

# fzf
export FZF_COMPLETION_TRIGGER="," # default: '**'
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--reverse --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
