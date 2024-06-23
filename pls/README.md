# pls!

## What is this?
This is a simple script that I use to set aliases with a little more *oomph* than the standard 'alias'.
It allows me to set aliases in the form of `pls <alias>` that have some additional functionality, such as pre-filling certain arguments.

For example, I can run `pls open` to open my file explorer in the current directory, or `pls open <dir>` to open the file explorer in `<dir>`. 

## Available aliases

-   `open [path?]` - Open a file or directory with the default file manager. Silences output apart from xdg-open errors.
-   `rok [protocol?] [port?];` - Start ngrok with the specified protocol and port. Defaults to `http` and `5173` respectively.`

## How do I use it?

1. Download `pls.sh` and place it in a directory of your choice, such as `~/pls/pls.sh`.

2. Make `pls.sh` executable: 

```sh
chmod +x <path to pls.sh>
```

3. Add the following line to your `.zshrc`. (Or `.bashrc`, if you're using bash, though I haven't tested all my aliases with bash.)

```sh
alias pls="<path to pls.sh>"
```

4. Source your `.zshrc` (or `.bashrc`).

5. Run `pls <alias>` to run an alias.

## How do I set an alias?

To set an alias, open `pls.sh` and add a new case in the form of:

```sh
<alias>)
   <whatever you want to do>
   exit $? # This is important! It makes sure that the script exits with the same exit code as whatever command executed before it.
   ;; # This is also important! It tells the script that this case is done.
```

Don't forget to add some documentation to the 'Available aliases' section at the end of `pls.sh` file, and this README!
