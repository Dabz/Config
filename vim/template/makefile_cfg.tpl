CC	= gcc
CFLAGS	= -Wall -W -std=c99 -pedantic \
	  -Wfloat-equal -Wundef -Wshadow -Wpointer-arith \
	  -Wbad-function-cast -Wcast-qual -Wcast-align \
	  -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes \
	  -Wmissing-declarations -Wnested-externs \
	  -Wunreachable-code -fstack-protector
CCFLAGS = -Wall -Wcast-align -Wundef -pedantic -fstack-protector
LDFLAGS	= -L/usr/lib -lstdc++
ARFLAGS	= rsc
RMFLAGS = -rf

RM	= rm
CP	= cp
MKDIR	= mkdir
MOUNT	= mount
UMOUNT	= umount
DD	= dd
