## Install

1. Clone the repo to ~/.config/nvim or ~/.vim

2. Install a YAML interpreter. If you have Ruby installed, you can skip this step. Otherwise, either install [yaml2json], or use Python:

```sh
pip3 install --user --upgrade PyYAML
```

3. If you don't have the python-neovim packages, run the provided script:

```sh
cd ~/.config/nvim
./venv.sh
```


[yaml2json]: https://github.com/koraa/large-yaml2json-json2yaml
