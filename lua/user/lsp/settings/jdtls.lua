local home = vim.fn.getenv("HOME")

return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
        home .. "/.local/share/nvim/mason/packages/jdtls/workspace",
	},
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
	end,
}
