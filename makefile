PROJECT_NAME = base

# ------------  name of the executable  ----------------------------------------
EXECUTABLE  = ./products/$(PROJECT_NAME).out
MAP_FILE    = ./products/$(PROJECT_NAME).map
HEX_FILE    = ./products/$(PROJECT_NAME).hex

# ------------  list of all source files  --------------------------------------
ASM_SOURCES = $(wildcard ./sources/*.s)
SOURCES     = $(wildcard ./sources/*.c) $(ASM_SOURCES)
LINKER_FILE = ./sources/linker.ld

# ------------  option files --------------------------------------
CC_OPTIONS = -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -nostdlib --specs=nosys.specs -Wall -pedantic -std=c99 -g3
AS_OPTIONS = -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16
LD_OPTIONS = --warn-common --warn-multiple-gp --warn-section-align --error-unresolved-symbols

# ------------  compiler / tools  ------------------------------------------------------
CC     = arm-none-eabi-gcc
ASM    = arm-none-eabi-as
LINKER = arm-none-eabi-ld
CCLIB  = arm-none-eabi-ar
DDUMP  = arm-none-eabi-objcopy
MOVE   = mv
RM     = rm

BASENAMES   = $(basename $(SOURCES))
OBJECTS     = $(sort $(addprefix ./objects/, $(addsuffix .o,$(notdir $(BASENAMES)))))

# ------------  targets ----------------------------------------
all: $(EXECUTABLE)
clean: 
	$(RM) --force $(EXECUTABLE) $(OBJECTS) $(OUTPUT_LIB) $(MAP_FILE) $(HEX_FILE)

# ------------  make the executable  -------------------------------------------
$(EXECUTABLE): $(OBJECTS)
	@$(LINKER) $(LD_OPTIONS) -o $(EXECUTABLE) $(OBJECTS) -T $(LINKER_FILE) -Map=$(MAP_FILE)
	@$(DDUMP) -O srec $(EXECUTABLE) $(HEX_FILE) 
	@echo ***************************************
	@echo ** $(PROJECT_NAME) BUILD DELIVERY DONE
	@echo ***************************************

# ------------  make the objects  ----------------------------------------------
./objects/%.o: ./sources/%.c
	@echo * compiling $<
	@$(CC) -I./source $(CC_OPTIONS) -c $< -o $@

./objects/%.o: ./sources/%.s
	@echo * compiling $<
	@$(ASM) $(AS_OPTIONS) $< -o $@
