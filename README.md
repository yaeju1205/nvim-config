# dotfile.nvim
예주님의 neovim dotfile 이에요

windows 와 linux 를 동시에 사용하기 때문에 어떤 os 에 맞춘 설정은 아니에요
windows 설정에 맞춘 설정은 `yaeju1205/nvim-config` 와 `yaeju1205/nvim` 을 참고해주세요

사용할때 트리를 설정을 안해두고 보통 fzf 로 파일을 찾아 다니기 때문에 fzf 가 필요해요

```sh
winget install fzf

# fzf 를 더욱 빠르게 사용하고싶다면
winget install fd
```

추가로 사용할수 있는 툴은 ripgrep 이 있어요

```sh
winget install ripgrep
```

cachy os (arch linux)

```
sudo pacman -S fzf ripgrep fd
```
