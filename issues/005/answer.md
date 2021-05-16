You can use `~/.texmf` by adding this line to `~/.profile`:

    TEXMFHOME="$HOME/.texmf"

and then logging out and logging back in to make sure your environment is modified. (You can check this with `env | grep TEXMFHOME` and `kpsewhich -var-value=TEXMFHOME`). More info here:

https://tex.stackexchange.com/questions/71469/texmfhome-setting

You could also do this:

    TEXMFHOME="$HOME/.local/share"

but I would hesitate to recommend this since LaTeX probably has a different idea of path structure than the other applications that use `~/.local/share/fonts`.
