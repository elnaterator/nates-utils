# Short scripts and utilities

To add the `bin` directory to your PATH, simply run:

```bash
./setup-path.sh [zsh|bash]
```

- You can specify `zsh` or `bash` as an argument to update the appropriate shell profile.
- If you omit the argument, the script will try to detect your current shell and update the correct profile.
- After running, restart your terminal or source your profile file as instructed by the script.

Alternatively you can manually add the `bin` directory to your PATH by running the following commands:

```bash
echo "\nexport PATH=\$PATH:$(pwd)/bin" >> ~/.bash_profile
source ~/.bash_profile
```

```bash
echo "\nexport PATH=\$PATH:$(pwd)/bin" >> ~/.zshrc
source ~/.zshrc
```
