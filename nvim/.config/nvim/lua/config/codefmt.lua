vim.api.nvim_exec([[
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /home/seen/bin/jars/google-java-format-1.7-all-deps.jar"
]],false)
