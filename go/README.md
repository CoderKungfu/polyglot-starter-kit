# Go Lang - Quick Start Guide

## Local Development Setup

Here are instructions for setting up your MacBook Pro for local development environment in `Go`.

1. [Download](https://golang.org/dl/) the `Go` installer. Install the package.

2. `Go` should now be installed to: `/usr/local/go`

3. Next, you will need a folder to put the `Go` code you will be working on. The `Go` community [recommends](https://github.com/golang/go/issues/17262) creating a `go` folder in your home directory (i.e. `~/go`).

4. Add the following into your `.bashrc` or `.zshrc`:

	```bash
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

	- `GOROOT` is the folder where `Go` is installed in.
	- `GOPATH` is the local working directory for your source code (i.e. `~/go`).
	- You will need to append the `bin` directories to your `$PATH` so that compiled `Go` binaries can be executable from the terminal.

5. Activate the new configuration by [sourcing](http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x237.html) the file:

	```
source ~/.zshrc
```
	(Or you can just start a new terminal tab/window. 😇)

6. Create a organization for your projects (eg. `coderkungfu`). Use this command to create the working directory for your source code:
	
	```bash
mkdir -p $GOPATH/src/github.com/coderkungfu
```

	* `Go` packages are checked out into a folder with the full `Git` path (ie. `domain`/`organization`/`project_name.git`).
	* eg. `github.com/coderkungfu/my-awesome-project`


7. You can now check out any of the `Go` projects from `coderkungfu` into the working directory:

	Example:

	```
git clone git@github.com:coderkungfu/myproject $GOPATH/src/github.com/coderkungfu/myproject
```

6. Happy hacking!