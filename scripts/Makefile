########################################################
# build target filename:
#    source file: filename.c
#    sample solution: s_filename.c
TARGET = $(shell basename $(CURDIR))


# compiler flags:
#    -std: explicitely choose C standard
CFLAGS = -g -Wall

# linker flags
#    add -lm to use mathematical funtions
LDFLAGS = -lm

########################################################

CC = gcc
MD = mkdir
RM = rm
SAMPLEOUT = create_testout.sh
TEST = test.sh
FORMAT = clang-format
FORMATFLAGS = --dry-run --Werror
TIDY = clang-tidy
TIDYFLAGS = --quiet --

BUILDDIR = build
SCRIPTDIR = ../scripts

all: $(TARGET)

# create build directory if it does not exist
$(BUILDDIR):
	$(MD) -p $(BUILDDIR)

# build target
$(TARGET): $(BUILDDIR) $(TARGET).c
	$(CC) $(CFLAGS) -o $(BUILDDIR)/$(TARGET) $(TARGET).c $(LDFLAGS)

# build solution and desired outputs
solution: $(BUILDDIR) s_$(TARGET).c
	$(CC) $(CFLAGS) -o $(BUILDDIR)/$(TARGET) s_$(TARGET).c $(LDFLAGS)
	bash $(SCRIPTDIR)/$(SAMPLEOUT) $(TARGET)

clean:
	$(RM) $(BUILDDIR)/*

# run test script
test: $(TARGET)
	bash $(SCRIPTDIR)/$(TEST) $(TARGET)

# run format check 
format: $(TARGET).c
	$(FORMAT) $(TARGET).c $(FORMATFLAGS)

tidy: $(TARGET).c
	$(TIDY) $(TARGET).c $(TIDYFLAGS)