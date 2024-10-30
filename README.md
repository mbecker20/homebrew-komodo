# Komodo Homebrew

This is a homebrew tap to install [Komodo Periphery](https://komo.do/docs/connect-servers) on *Apple silicon* based Macs.
Use alongside [Docker Desktop](https://www.docker.com/products/docker-desktop), [OrbStack](https://orbstack.dev), [Colima](https://github.com/abiosoft/colima), or other Docker-on-Mac tools.

Non-Apple silicon Macs can install this, and replace the binary (`/opt/homebrew/bin/periphery`) with one built [from source](https://github.com/mbecker20/komodo) on their machine.

## Install

```sh
brew tap mbecker20/komodo && \
	brew install periphery && \
	brew services start periphery
```

### Relevant Paths
- periphery (binary)    -> `/opt/homebrew/bin/periphery`
- periphery.config.toml -> `/opt/homebrew/etc/komodo/periphery.config.toml`
- log                   -> `/opt/homebrew/var/log/komodo/periphery.log`
- stack directory       -> `/opt/homebrew/var/komodo/stacks/`
- repo directory        -> `/opt/homebrew/var/komodo/repos/`