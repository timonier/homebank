### Installation

Copy the file `bin/homebank` into your executable folder (like `/usr/local/bin` or `$HOME/bin`):

```bash
sudo curl -sLo /usr/local/bin/homebank https://github.com/mauchede/homebank/raw/master/bin/homebank
sudo chmod +x /usr/local/bin/homebank
```

Ubuntu users can use the [installer](https://github.com/mauchede/homebank/blob/master/bin/installer):

```bash
curl -sSL https://github.com/mauchede/homebank/raw/master/bin/installer | sudo bash -s install
```

### Usage

Run the command `homebank`:

```bash
homebank
# Start Homebank
```

__Note__: By default, the version `5.0.5` will be used. To change the version, define the `TAG` before the command. For example:

```bash
homebank --version
# homebank 5.0.5

TAG="..." homebank
# homebank ...
```

### Contributing

1. Fork it.
2. Create your branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

__Note__: Use the script `bin/build` to test your modifications locally.

### Links

* [image "mauchede/homebank"](https://hub.docker.com/r/mauchede/homebank/)
* [homebank](http://homebank.free.fr/)
