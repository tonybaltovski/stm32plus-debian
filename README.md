stm32plus-debian
================

Debian packaging files for [stm32plus](https://github.com/andysworkshop/stm32plus).
If you just want to access the resultant debs, please see the
[launchpad PPA](https://launchpad.net/~mikepurvis/+archive/ubuntu/stm32).


Publishing to Launchpad
-----------------------

Better instructions coming soon, but in short:

 - Create a workspace directory.

 - Clone this repo to a path like `stm32plus-x.y.z` where `x.y.z` is the version to release.
    ```
    git clone https://github.com/mikepurvis/stm32plus-debian stm32plus-3.6.0
    ```

 - Download the [stm32plus source tarball](https://github.com/andysworkshop/stm32plus/releases)
   for the version to release, and extract it, overwriting the files from this repo:
    ```
    wget https://github.com/andysworkshop/stm32plus/archive/3.6.0.tar.gz -O stm32plus_3.6.0.orig.tar.gz
    tar xvzf stm32plus_3.6.0.orig.tar.gz
    ```

 - Now inside the workspace/stm32plus-x.y.z/debian folder:

   * run `dch`, and edit the changelog accordingly.
   * run `generate` to create the templated rules file.

 - In the stm32plus-x.y.z folder, build the source package, and upload it to the PPA:
    ```
    debuild -S
    dput ppa:mikepurvis/stm32
    ```

To run a local build, instead do:

    debuild -uc -us
