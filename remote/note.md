
```
chachay@EGL:~$ nvidia-smi
Mon Mar 21 15:42:38 2022
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 470.82.01    Driver Version: 470.82.01    CUDA Version: 11.4     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla P100-PCIE...  Off  | 00000001:00:00.0 Off |                    0 |
| N/A   30C    P0    31W / 250W |      0MiB / 16280MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+

chachay@EGL:~$ lspci
0001:00:00.0 3D controller: NVIDIA Corporation GP100GL [Tesla P100 PCIe 16GB] (rev a1)

chachay@EGL:~$ cat /usr/share/glvnd/egl_vendor.d/10_nvidia.json
{
    "file_format_version" : "1.0.0",
    "ICD" : {
        "library_path" : "libEGL_nvidia.so.0"
    }
}

chachay@EGL:~$ ldconfig -p | grep EGL
        libEGL_nvidia.so.0 (libc6,x86-64) => /lib/x86_64-linux-gnu/libEGL_nvidia.so.0
        libEGL_nvidia.so.0 (libc6) => /lib/i386-linux-gnu/libEGL_nvidia.so.0
        libEGL.so.1 (libc6,x86-64) => /lib/x86_64-linux-gnu/libEGL.so.1
        libEGL.so.1 (libc6) => /lib/i386-linux-gnu/libEGL.so.1
        libEGL.so (libc6,x86-64) => /lib/x86_64-linux-gnu/libEGL.so
        libEGL.so (libc6) => /lib/i386-linux-gnu/libEGL.so

chachay@EGL:~$ sudo apt install mesa-utils
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd0
  libglx-mesa0 libglx0 libllvm12 libpciaccess0 libsensors-config libsensors5 libvulkan1 libwayland-client0 libx11-xcb1
  libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0
  libxfixes3 libxshmfence1 libxxf86vm1 mesa-vulkan-drivers


chachay@EGL:~$ sudo apt install mesa-utils-extra
chachay@EGL:~$ eglinfo
...
Wayland platform:
eglinfo: eglInitialize failed

X11 platform:
eglinfo: eglInitialize failed

Device platform:
EGL API version: 1.5
EGL vendor string: NVIDIA
EGL version string: 1.5
EGL client APIs: OpenGL_ES OpenGL
...

chachay@EGL:~$ nvidia-xconfig --query-gpu-info
Number of GPUs: 1

GPU #0:
  Name      : Tesla P100-PCIE-16GB
  UUID      : GPU-32421417-3465-379a-89ce-cb10ee3c04f8
  PCI BusID : PCI:0@1:0:0

  Number of Display Devices: 0
```


/etc/X11/xorg.conf
```
Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection
```
https://no-operand.hateblo.jp/entry/2020/01/03/_headless_%26_x11vnc%E3%82%92%E8%87%AA%E5%8B%95%E8%B5%B7%E5%8B%95%E3%81%AB%E3%81%97%E3%81%A6%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88PC%E3%81%AB%E3%81%99%E3%82%8B
