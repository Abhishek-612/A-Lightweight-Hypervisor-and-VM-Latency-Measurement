CONFIG_MODULE_SIG=n

MOD = vmxproject
KPATH :=/lib/modules/$(shell uname -r)/build
PWD :=$(shell pwd)
obj-m = $(MOD).o

vmxproject-objs := ./module.o ./api.o ./vmx.o ./guest.o \
                  ./vmentry.o

HAS_BOOL := $(shell grep _Bool $(KPATH)/include/linux/types.h \
			> /dev/null 2>&1 && echo -DHAS_BOOL)

INCLUDE_FLAGS:= -I$(PWD)
EXTRA_CFLAGS += $(HAS_BOOL) $(INCLUDE_FLAGS)
EXTRA_AFLAGS += $(INCLUDE_FLAGS)

all:
	make -C $(KPATH) M=$(PWD) modules

clean:
	make -C $(KPATH) M=$(PWD) clean