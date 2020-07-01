# Xcode-v12.0-Beta1

export DEVELOPER_DIR := $(shell xcode-select --print-path)

# iOS
SDK_iOS 		= $(shell xcodebuild -version -sdk iphoneos Path)
MIN_VER_iOS 	= -miphoneos-version-min=14.0
CC_iOS 			= $(shell xcrun --sdk iphoneos --find clang)
# ============================================================================ #

ARCH_iOS 		= -arch arm64e

SDK_SETTINGS_iOS = -isysroot $(SDK_iOS) -I$(SDK_iOS)/usr/include -I$(SDK_iOS)/usr/local/include

COMPILE_iOS_BIN = $(CC_iOS) $(ARCH_iOS) $(MIN_VER_iOS) $(SDK_SETTINGS_iOS)
# ============================================================================ #

HEADER_SEARCH_PATH		= -I.
LIB_SEARCH_PATH			= -L.
FRAMEWORK_SEARCH_PATH 	= -F.

CFLAGS					= 
LDFLAGS					= $(CFLAGS)
FRMKFLAGS				= 
# ============================================================================ #

TARGET		= hello-data-pac
MAIN_FILE	= $(TARGET).c

all: $(MAIN_FILE)
	@$(COMPILE_iOS_BIN) -o $(TARGET) $(MAIN_FILE) $(HEADER_SEARCH_PATH) $(LIB_SEARCH_PATH) $(FRAMEWORK_SEARCH_PATH) $(CFLAGS) $(LDFLAGS) $(FRMKFLAGS)
	
clean:
	@rm -rf $(TARGET) $(TARGET).dSYM
	