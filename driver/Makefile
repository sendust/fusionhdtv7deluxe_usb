# SPDX-License-Identifier: GPL-2.0
# Out-of-tree au0828 build with the DVB-only media-controller fix.
au0828-objs	:= au0828-core.o au0828-i2c.o au0828-cards.o au0828-dvb.o

ifeq ($(CONFIG_VIDEO_AU0828_V4L2),y)
  au0828-objs   += au0828-video.o au0828-vbi.o
endif

ifeq ($(CONFIG_VIDEO_AU0828_RC),y)
  au0828-objs   += au0828-input.o
endif

obj-m += au0828.o

ccflags-y += -I$(src)

KVER ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KVER)/build

all:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules

clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) clean
