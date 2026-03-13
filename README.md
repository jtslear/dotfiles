## My Dotfiles

### Install
* Clone this repo
* cd into the cloned directory
* `./laptop.local`

### Optional: Skip Tool Installation via Mise
To skip installing tools with mise during setup, you can set the `SKIP_MISE_TOOLS` environment variable:

```bash
export SKIP_MISE_TOOLS=true
./setup.sh
```

This will ensure mise is installed but prevent the script from installing any tools using mise.
