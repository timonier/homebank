# README

## Installation

Copy the file `bin/homebank` into your executable folder (like `/usr/local/bin` or `$HOME/bin`):

```sh
sudo curl -sLo /usr/local/bin/homebank "https://github.com/timonier/homebank/raw/master/bin/homebank"
sudo chmod +x /usr/local/bin/homebank
```

Linux users can use the [installer](https://github.com/timonier/homebank/blob/master/bin/installer):

```sh
curl -sL "https://github.com/timonier/homebank/raw/master/bin/installer" | sudo sh -s install
```

## Usage

Run the command `homebank`:

```sh
homebank
# Start Homebank
```

__Note__: By default, the version `5.0.5` will be used. To change the version, define the `TAG` before the command:

```sh
homebank --version
# homebank 5.0.5

TAG="..." homebank --version
# homebank ...
```

## Contributing

1. Fork it.
2. Create your branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

__Note__: Use the script `bin/build` to test your modifications locally.

## Links

* [homebank](http://homebank.free.fr/)
* [image "timonier/homebank"](https://hub.docker.com/r/timonier/homebank/)
