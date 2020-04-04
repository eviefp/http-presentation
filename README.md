# Creating a new web project with Haskell and PureScript
Prerequisites:
- [stack](https://docs.haskellstack.org/en/stable/README/)
- npm
- psvm (`npm install -g psvm`)
- spago (`npm install -g spago`)

The above represents the easier way to get these dependencies on your system.
There are several other ways. You can use `ghcup` and `cabal` to manage your
Haskell projects instead of `stack`. Or you can use `nix`. This will not go into
details about how to do either.

`psvm` is PureScript Version Manager. It allows you to download and "install"
multiple versions of the PureScript compiler (similar to how `nvm` works for
NodeJS). In order for it to work, you will have to add `~/.psvm/current/bin` to
your path, and install/use a PureScript compiler (see `psvm --help` for details).

Alternatively, you can grab `PureScript` binaries manually from the PureScript
repository (https://github.com/purescript/purescript) or build it from source.

`spago` is somewhat similar to `stack` in that it has a package set of
known-to-work libraries and makes it easy to install them using the `dhall`
configuration language. One of the differences is that unlike `stack`, it will
not manage your compiler for you, so it needs to have `purs` in path already.

Alternatively, you can grab `spago` binaries from its repository or built it
manually (it's written in Haskell).


## Haskell
Please make sure the following works:
```sh
cd backend
stack build
```

Additionally, it might be useful to have `ghcid` installed:
```sh
cd backend
stack install ghcid
```

## PureScript
Please make sure the following works:
```sh
cd frontend
spago build
```

Please make sure you install the PureScript IDE plugin for your IDE/editor:
- vscode: it should be the top downloaded PureScript plugin
- atom: as above
- vim: this is going to be a bit trickier; the way I have this working is through
    the CoC.nvim plugin, see https://github.com/neoclide/coc.nvim/wiki/Language-servers#purescript

# Running

Build and start the backend:
```sh
cd backend
stack build
stack exec -- backend-exe
```

Bundle the frontend:
```sh
cd frontend
spago bundle-app --to ../public/index.js
```

Browse the result at http://localhost:8080/
