def init(config, c):
    c.aliases["q"] = "tab-close"
    config.bind("jk", "mode-leave", mode="command");
    config.bind("jk", "mode-leave", mode="caret");
    config.bind("jk", "mode-leave", mode="hint");
    config.bind("jk", "mode-leave", mode="insert");
    config.bind("jk", "mode-leave", mode="caret")
    #config.bind("jk", "mode-leave", mode="visual")

    # Insert mode arrows
    config.bind("<Ctrl-j>", "fake-key <Down>", mode="insert")
    config.bind("<Ctrl-k>", "fake-key <Up>", mode="insert")
    config.bind("<Ctrl-h>", "fake-key <Left>", mode="insert")
    config.bind("<Ctrl-l>", "fake-key <Right>", mode="insert")
    
    # Toggle statusbar
    config.bind("<Ctrl-n>", "config-cycle tabs.show always never")

    # Caret mode
    #config.bind("é", "mode-leave", mode="visual")
