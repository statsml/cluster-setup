# cluster-setup

## How-to

When you install the cuda GPU library and tensorflow, please check wheather they are compatible. 
You also should check python default version and pip default version. 

SSH login cluser: 

```
ssh `username@hostaddress`
```

Install git on the cluster

```
apt-get install git
```


Setup from the scrtip

```
. `cluster-setup.sh`
```

## SSH tricks & FAQ

### 1. screen

Sometimes you want to run some scripts via command line, and you may close the command line and check the results later. Then you can use `screen`. 

- Start a `screen`
```
screen -S `your-preferred-screen-name`
```

- Use `ctrl+A, ctrl+D` to leave the screen.

- Check results later
```
screen -r `your-preferred-screen-name`
```

- Kill a screen
```
screen -S  `your-preferred-screen-name` -X quit
```

- Alternative: tmux

### 2. error from matplotlib

[Source](https://raspberrypi.stackexchange.com/questions/38294/error-when-attempting-to-create-python-gui-using-tkinter-no-display-name-and-n)

You want to save image, but you may get `_tkinter.TclError: no display name and no $DISPLAY environment variable`. You can simply run the following command before running your code:

```
export MPLBACKEND="agg"
```

### 3. cuda9 not compatible for tensorflow

```
sudo apt autoremove cuda
```

use cuda8 instead

```
sudo apt-get install cuda-8-0
```

## Authors

- [Jun Lu](https://github.com/junlulocky)
- [Wei Ma](https://github.com/Marvinmw)

## References
- CS231n: Google Cloud Tutorial. [link](http://cs231n.github.io/gce-tutorial/)




