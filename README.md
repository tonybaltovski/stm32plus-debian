stm32plus-debian
================

Debian packaging files for [stm32plus](https://github.com/andysworkshop/stm32plus).
If you just want to access the resultant debs, please see the
[launchpad PPA](https://launchpad.net/~mikepurvis/+archive/ubuntu/stm32).


Publishing to Launchpad
-----------------------

Better instructions coming soon, but in short:

 - Create a workspace directory.

 - Set an env var with the version you are releasing:
    ```
    VER=4.0.3
    ```

 - Clone this repo to a path like `stm32plus-x.y.z`:
    ```
    git clone https://github.com/mikepurvis/stm32plus-debian stm32plus-$VER
    ```

 - Download the [stm32plus source tarball](https://github.com/andysworkshop/stm32plus/releases)
   for the version to release, and extract it, overwriting the files from this repo:
    ```
    wget https://github.com/andysworkshop/stm32plus/archive/$VER.tar.gz -O stm32plus_$VER.orig.tar.gz
    tar xvzf stm32plus_$VER.orig.tar.gz
    ```

 - Now inside the workspace/stm32plus-x.y.z/debian folder:

   * run `dch`, and edit the changelog accordingly.
   * run `generate` to create the templated rules file.

 - In the stm32plus-x.y.z folder, build the source package, and upload it to the PPA:
    ```
    debuild -S
    dput ppa:clearpath-robotics/stm32
    ```

To run a local build, instead do:

    debuild -uc -us

When complete, commit your changes back to this repo:

    git checkout .gitignore README.md
    git add .
    git commit -m "Changes for $VER"
