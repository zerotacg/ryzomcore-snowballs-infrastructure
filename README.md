# ryzomcore-snowballs-infrastructure

setup for the snowballs example project from https://github.com/ryzom/ryzomcore/tree/core4/snowballs2

## preparation
create a directory to download files to
```bash
mkdir build
```

fetch data
```bash
curl --location --output build/client.7z https://dl.kaetemi.be/ryzom/bin/snowballs_client_win_x86-0.8.0.4092.7z
```
unpack
```bash
$(cd build && 7z x client.7z)
```

get required data
```bash
mv build/snowballs*/
```

## TODO
 - [ ] prepare container with script to fetch required files