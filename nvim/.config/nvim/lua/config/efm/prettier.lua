return {
    formatCommand = [[eval $([-n "$(command -v node_modules/.bin/prettier])" && echo "node_modules/.bin/prettier" || [-n "$(command -v ~/.nvm/versions/node/v18.9.0/bin/prettier)"] && echo "~/.nvm/versions/node/v18.9.0/bin/prettier" || echo "prettier") --stdin-filepath ${INPUT}]],
    formatStdin = true
}
