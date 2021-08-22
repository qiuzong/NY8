ICBODY       := NY8A051F
CLIENT_NAME  := YQD-RGB-CM+ZD-NY8A051F-SOP8
CB_FILE      := YQD-RGB-CM+ZD-NY8A051F-SOP8.cb
HOST_TOOL    := NYIDE 4.31
USER_C       := Init_Sys.c Init_Timer.c Interrupt.c Key.c KeyFunction.c LedBlink.c main.c  
LIBS         :=  
USER_ASM     :=  
OUT_NAME     := YQD-RGB-CM+ZD-NY8A051F-SOP8
CC_PATH      := C:\Nyquest\NYC_NY8
TEMP_FOLDER  := 
OBJDIR       := OBJ
VPATH        := 

#  - small: disable bank ram
#  - bank2: 2 bank ram (1 word BANKSEL)
#  - bank4: 4 bank ram (2 word BANKSEL)
#
# suffix
#  - NONE:  4-bit S-Page and 4-bit R-Page SFR (0~0xF)
#  - 8b:    5-bit S-Pate and 5-bit R-Page SFR (0~0x1F)
#  - type3: 5-bit S-Page and 4-bit R-Page SFR (0~0xF)
#  - type4: 8b with FGOTO, ROM size > 0x800, 4 RAM bank
#  - v2:    clear RAM at bank3 (hardware mapping to bank0)
MODEL := small.19897

ENABLE_INIT_BSS := 1

CC := sdcc
AS := nyas
LD := nylinker
AR := nyar

LDFLAGS     := -p $(ICBODY) --client "$(CLIENT_NAME)" -L "$(CC_PATH)/lib"      \
               -g  --riffbin --elf           \
               --host "$(HOST_TOOL)" --cinit --programchecksum             \
               --codechecksum --opt-banksel  --w-no 32797 --lang zh-cn --fcinit-ram-zero --fcinit-bk0

CFLAGS      := -mny8 --errfmt-ny -p$(ICBODY) -D__CPU_$(ICBODY) --debug \
               -I"$(CC_PATH)/include" -I"C:\Nyquest\NY8_Example_Code\\include\NY8 C"  -MD --stack-size 10  \
                --backup-stk 2 

ASFLAGS     := -p $(ICBODY) --dbgfmt 2 -g  --w-no 32797 --lang zh-cn  \
               -I "$(CC_PATH)/inc"

DEPS        := $(patsubst %.c,%.d, $(USER_C))
ASM_SRC     := $(USER_ASM)
ASM_SRC     := $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.c,%.s,$(USER_C))))
OBJS        := $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.c,%.o,$(USER_C)))) \
               $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.s,%.o,$(USER_ASM))))
OBJS        := $(sort $(OBJS))

LIBS        += $(ICBODY).a
BIN_FILE    := $(strip $(OUT_NAME)).bin

ifneq (,$(findstring small,$(MODEL)))
  ifneq (,$(findstring type4,$(MODEL)))
	LIBS    += libsdcc_small_fgo.a
  else
	LIBS    += libsdcc_small.a
  endif
  CFG_FILE  := $(CC_PATH)/cfg/small/$(ICBODY).cfg
else
  ifneq (,$(findstring type4,$(MODEL)))
	LIBS    += libsdcc_bank4_fgo.a
  else
	LIBS    += libsdcc_bankram.a
  endif
  CFG_FILE  := $(CC_PATH)/cfg/bankram/$(ICBODY).cfg
  ASFLAGS   += -D ENABLE_RAM_BANK=1
endif

ifeq ($(ENABLE_INIT_BSS),1)
  LIBS      += startup/$(strip $(MODEL)).a
else
  LIBS      += startup/no-bss/$(strip $(MODEL)).a
endif

.SUFFIXES:
.SECONDARY:
.PHONY: all clean

all: $(BIN_FILE)

$(BIN_FILE): $(OBJS)
	$(LD) $(OBJS) $(LIBS) "$(CB_FILE)" -s "$(CFG_FILE)" -o "$(TEMP_FOLDER)$(OUT_NAME)" $(LDFLAGS)



$(OBJDIR)/%.s: %.c
	$(CC) -S $< -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(OBJDIR)/%.s
	$(AS) $< $(ASFLAGS)

$(OBJDIR)/%.o: $(OBJDIR)/%.asm
	$(AS) $< $(ASFLAGS)

$(OBJDIR)/%.o: %.asm
	$(AS) $< -o $@ $(ASFLAGS)

$(OBJDIR)/%.o: %.s
	$(AS) $< -o $@ $(ASFLAGS)

-include $(DEPS)

rebuild: clean all

clean:
	-@1>nul 2>nul del "$(OUT_NAME).bin" "$(OUT_NAME).fpga" "$(OUT_NAME).elf" "$(OUT_NAME).link.lst" "$(OUT_NAME).map" "$(OUT_NAME).htm"
	-@1>nul 2>nul del $(patsubst %.c, %.adb, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.p, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.d, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.s, $(USER_C))
	-@1>nul 2>nul del $(subst /,\,$(addsuffix .o, $(basename $(ASM_SRC))))
	-@1>nul 2>nul del $(subst /,\,$(addsuffix .lst, $(basename $(ASM_SRC))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(patsubst %.c,%.adb,$(USER_C))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(patsubst %.c,%.p,$(USER_C))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(patsubst %.c,%.s,$(USER_C))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(patsubst %.c,%.d,$(USER_C))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(addsuffix .o, $(basename $(ASM_SRC)))))
	-@1>nul 2>nul del $(addprefix $(OBJDIR)\,$(subst /,\, $(addsuffix .lst, $(basename $(ASM_SRC)))))
