# linpack

This repository contains an implementation of the Linpack benchmark obtained from [netlib](http://www.netlib.org/benchmark/linpackc.new). It has been lightly modified to not expect any keyboard input.

To build and use this benchmark via Docker, follow these steps:

- Install Docker (if not already installed)
  - `curl -sSL https://get.docker.com/ | sh`

- Clone this repository (requires git to be installed in your system... Google for your particular OS/distro)
  - `git clone https://github.com/ereyes01/linpack.git`

- Build the Docker image
  - `cd linpack`
  - `sudo docker build -t linpack ./`
  
- Run the benchmark
  - `sudo docker run -it --rm linpack`
  
The results will be printed on the console.

**NOTE**: You need root privileges on your system in order to install/use Docker. The recommended way to do this is to run as a user with sudoer privilege (i.e. able to run commands as root with the `sudo` command).

It is possible to customize the array size use by the benchmark code (size is 200 by default). To do this, set an environment variable when running the container:

`sudo docker run -it --rm -e LINPACK_ARRAY_SIZE=600 linpack`

Here are some sample results from my system with the default array size of 200:

```
$ sudo docker run -it --rm linpack
Memory required:  315K.


LINPACK benchmark, Double precision.
Machine precision:  15 digits.
Array size 200 X 200.
Average rolled and unrolled performance:

    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
----------------------------------------------------
    2048   0.71  78.02%   2.89%  19.09%  4917805.960
    4096   1.43  78.02%   2.88%  19.11%  4870465.484
    8192   2.86  78.00%   2.87%  19.13%  4863107.385
   16384   5.70  77.98%   2.87%  19.14%  4882638.725
   32768  11.41  77.98%   2.87%  19.14%  4878150.976
```
