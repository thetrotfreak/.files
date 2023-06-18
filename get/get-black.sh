# https://black.readthedocs.io/en/stable/integrations/editors.html#vim-8-native-plugin-management
sh -c "$(curl --create-dirs -fsSLo ~/.vim/pack/python/start/black/plugin/black.vim https://raw.githubusercontent.com/psf/black/stable/plugin/black.vim)"
sh -c "$(curl --create-dirs -fsSLo ~/.vim/pack/python/start/black/autoload/black.vim https://raw.githubusercontent.com/psf/black/stable/autoload/black.vim)"
