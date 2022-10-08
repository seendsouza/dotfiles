return {
    formatCommand = "ktlint -F ${INPUT}",
    lintCommand = "ktlint",
    lintFormats = {'%f:%l:%c:%m'}
}
