return {
    settings = {
        checkOnSave = {
            allFeatures = true,
            command = {
                'cargo', 'clippy', '--workspace', '--message-format=json',
                '--all-targets', '--all-features'
            }
        }
    }
}
