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

## ssh tricks

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
