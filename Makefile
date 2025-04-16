export TERMUX_CORE_PKG__VERSION := 0.3.0
export TERMUX_CORE_PKG__ARCH
export TERMUX_CORE_PKG__INSTALL_PREFIX

export TERMUX__NAME := Termux# Default value: `Termux`
export TERMUX__LNAME := termux# Default value: `termux`

export TERMUX__REPOS_HOST_ORG_NAME := termux# Default value: `termux`
export TERMUX__REPOS_HOST_ORG_URL := https://github.com/$(TERMUX__REPOS_HOST_ORG_NAME)# Default value: `https://github.com/termux`

export TERMUX_APP__NAME := Termux# Default value: `Termux`
export TERMUX_APP__PACKAGE_NAME := com.termux# Default value: `com.termux`
export TERMUX_APP__DATA_DIR := /data/data/$(TERMUX_APP__PACKAGE_NAME)# Default value: `/data/data/com.termux`

export TERMUX__ROOTFS := $(TERMUX_APP__DATA_DIR)/files# Default value: `/data/data/com.termux/files`
export TERMUX__HOME := $(TERMUX__ROOTFS)/home# Default value: `/data/data/com.termux/files/home`
export TERMUX__PREFIX := $(TERMUX__ROOTFS)/usr# Default value: `/data/data/com.termux/files/usr`
export TERMUX__PREFIX__BIN_DIR := $(TERMUX__PREFIX)/bin# Default value: `/data/data/com.termux/files/usr/bin`
export TERMUX__PREFIX__INCLUDE_DIR := $(TERMUX__PREFIX)/include# Default value: `/data/data/com.termux/files/usr/include`
export TERMUX__PREFIX__LIB_DIR := $(TERMUX__PREFIX)/lib# Default value: `/data/data/com.termux/files/usr/lib`
export TERMUX__PREFIX__TMP_DIR := $(TERMUX__PREFIX)/tmp# Default value: `/data/data/com.termux/files/usr/tmp`

export TERMUX_ENV__S_ROOT := TERMUX_# Default value: `TERMUX_`
export TERMUX_ENV__SS_TERMUX := _# Default value: `_`
export TERMUX_ENV__S_TERMUX := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX)# Default value: `TERMUX__`
export TERMUX_ENV__SS_TERMUX_APP := APP__# Default value: `APP__`
export TERMUX_ENV__S_TERMUX_APP := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_APP)# Default value: `TERMUX_APP__`
export TERMUX_ENV__SS_TERMUX_API_APP := API_APP__# Default value: `API_APP__`
export TERMUX_ENV__S_TERMUX_API_APP := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_API_APP)# Default value: `TERMUX_API_APP__`
export TERMUX_ENV__SS_TERMUX_ROOTFS := ROOTFS__# Default value: `ROOTFS__`
export TERMUX_ENV__S_TERMUX_ROOTFS := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_ROOTFS)# Default value: `TERMUX_ROOTFS__`
export TERMUX_ENV__SS_TERMUX_CORE := CORE__# Default value: `CORE__`
export TERMUX_ENV__S_TERMUX_CORE := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_CORE)# Default value: `TERMUX_CORE__`
export TERMUX_ENV__SS_TERMUX_CORE__TESTS := CORE__TESTS__# Default value: `CORE__TESTS__`
export TERMUX_ENV__S_TERMUX_CORE__TESTS := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_CORE__TESTS)# Default value: `TERMUX_CORE__TESTS__`
export TERMUX_ENV__SS_TERMUX_EXEC__TESTS := EXEC__TESTS__# Default value: `EXEC__TESTS__`
export TERMUX_ENV__S_TERMUX_EXEC__TESTS := $(TERMUX_ENV__S_ROOT)$(TERMUX_ENV__SS_TERMUX_EXEC__TESTS)# Default value: `TERMUX_EXEC__TESTS__`

export TERMUX_APP__NAMESPACE := $(TERMUX_APP__PACKAGE_NAME)# Default value: `com.termux`
export TERMUX_APP__SHELL_API__SHELL_API_ACTIVITY__CLASS_NAME := $(TERMUX_APP__NAMESPACE).app.TermuxActivity# Default value: `com.termux.app.TermuxActivity`
export TERMUX_APP__SHELL_API__SHELL_API_SERVICE__CLASS_NAME := $(TERMUX_APP__NAMESPACE).app.TermuxService# Default value: `com.termux.app.TermuxService`

export TERMUX_PKGS__REPO_NAME := termux-packages# Default value: `termux-packages`
export TERMUX_PKGS__REPO_URL := $(TERMUX__REPOS_HOST_ORG_URL)/$(TERMUX_PKGS__REPO_NAME)# Default value: `https://github.com/termux/termux-packages`
export TERMUX_PKGS__BUILD__REPO_ROOT_DIR

export TERMUX_CORE_PKG__REPO_NAME := termux-core-package# Default value: `termux-core-package`
export TERMUX_CORE_PKG__REPO_URL := $(TERMUX__REPOS_HOST_ORG_URL)/$(TERMUX_CORE_PKG__REPO_NAME)# Default value: `https://github.com/termux/termux-core-package`
export TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE := $(TERMUX_PKGS__BUILD__REPO_ROOT_DIR)/packages/termux-core/build/scripts/termux-replace-termux-core-src-scripts



# Check if TERMUX_PKGS__BUILD__REPO_ROOT_DIR and TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE are set and exist
ifeq ($(TERMUX_PKGS__BUILD__REPO_ROOT_DIR),)
    $(error The TERMUX_PKGS__BUILD__REPO_ROOT_DIR variable is not set)
else ifneq ($(patsubst /%,,$(TERMUX_PKGS__BUILD__REPO_ROOT_DIR)),)
    $(error The TERMUX_PKGS__BUILD__REPO_ROOT_DIR variable '$(TERMUX_PKGS__BUILD__REPO_ROOT_DIR)' is not set to an absolute path)
else ifneq ($(shell test -d "$(TERMUX_PKGS__BUILD__REPO_ROOT_DIR)" && echo 1 || echo 0), 1)
    $(error The termux-pacakges build repo directory does not exist at TERMUX_PKGS__BUILD__REPO_ROOT_DIR '$(TERMUX_PKGS__BUILD__REPO_ROOT_DIR)' path)
else ifneq ($(shell test -f "$(TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE)" && echo 1 || echo 0), 1)
    $(error The 'replace-termux-core-src-scripts' file does not exist at TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE '$(TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE)' path)
endif



# If architecture not set, find it for the compiler based on which
# predefined architecture macro is defined. The `shell` function
# replaces newlines with a space and a literal space cannot be entered
# in a makefile as its used as a splitter, hence $(SPACE) variable is
# created and used for matching.
ifeq ($(TERMUX_CORE_PKG__ARCH),)
	export override PREDEFINED_MACROS := $(shell $(CC) -x c /dev/null -dM -E)
	override EMPTY :=
	override SPACE := $(EMPTY) $(EMPTY)
	ifneq (,$(findstring $(SPACE)#define __i686__ 1$(SPACE),$(SPACE)$(PREDEFINED_MACROS)$(SPACE)))
		override TERMUX_CORE_PKG__ARCH := i686
	else ifneq (,$(findstring $(SPACE)#define __x86_64__ 1$(SPACE),$(SPACE)$(PREDEFINED_MACROS)$(SPACE)))
		override TERMUX_CORE_PKG__ARCH := x86_64
	else ifneq (,$(findstring $(SPACE)#define __aarch64__ 1$(SPACE),$(SPACE)$(PREDEFINED_MACROS)$(SPACE)))
		override TERMUX_CORE_PKG__ARCH := aarch64
	else ifneq (,$(findstring $(SPACE)#define __arm__ 1$(SPACE),$(SPACE)$(PREDEFINED_MACROS)$(SPACE)))
		override TERMUX_CORE_PKG__ARCH := arm
	else ifneq (,$(findstring $(SPACE)#define __riscv 1$(SPACE),$(SPACE)$(PREDEFINED_MACROS)$(SPACE)))
		override TERMUX_CORE_PKG__ARCH := riscv64
	else
        $(error Unsupported package arch)
	endif
endif


export override IS_ON_DEVICE_BUILD := $(shell test -f "/system/bin/app_process" && echo 1 || echo 0)



export override BUILD_DIR := build# Default value: `build`

export override BUILD_OUTPUT_DIR := $(BUILD_DIR)/output# Default value: `build/output`

export override TMP_BUILD_OUTPUT_DIR := $(BUILD_OUTPUT_DIR)/tmp# Default value: `build/output/tmp`

export override PREFIX_BUILD_OUTPUT_DIR := $(BUILD_OUTPUT_DIR)/usr# Default value: `build/output/usr`
export override BIN_BUILD_OUTPUT_DIR := $(PREFIX_BUILD_OUTPUT_DIR)/bin# Default value: `build/output/usr/bin`
export override LIB_BUILD_OUTPUT_DIR := $(PREFIX_BUILD_OUTPUT_DIR)/lib# Default value: `build/output/usr/lib`
export override LIBEXEC_BUILD_OUTPUT_DIR := $(PREFIX_BUILD_OUTPUT_DIR)/libexec# Default value: `build/output/usr/libexec`
export override TESTS_BUILD_OUTPUT_DIR := $(LIBEXEC_BUILD_OUTPUT_DIR)/installed-tests/termux-core# Default value: `build/output/usr/libexec/installed-tests/termux-core`

export override PACKAGING_BUILD_OUTPUT_DIR := $(BUILD_OUTPUT_DIR)/packaging# Default value: `build/output/packaging`
export override DEBIAN_PACKAGING_BUILD_OUTPUT_DIR := $(PACKAGING_BUILD_OUTPUT_DIR)/debian# Default value: `build/output/packaging/debian`



export override BUILD_INSTALL_DIR := $(BUILD_DIR)/install# Default value: `build/install`
export override PREFIX_BUILD_INSTALL_DIR := $(BUILD_INSTALL_DIR)/usr# Default value: `build/install/usr`

ifeq ($(TERMUX_CORE_PKG__INSTALL_PREFIX),)
	ifeq ($(DESTDIR)$(PREFIX),)
		override TERMUX_CORE_PKG__INSTALL_PREFIX := $(TERMUX__PREFIX)
	else
		override TERMUX_CORE_PKG__INSTALL_PREFIX := $(DESTDIR)$(PREFIX)
	endif
endif
export TERMUX_CORE_PKG__INSTALL_PREFIX



# Escape `&`, `\` and `/` characters to be used as replacement string
# in sed `s/regexp/replacement/` expression.
# The `\` character needs to be escaped twice since used in command
# string with double quoted arguments, which are then passed to `sh`
# as a single quoted argument.
# - https://stackoverflow.com/a/29613573/14686958
export override TERMUX_PKGS__REPO_URL__ESCAPED := $(shell printf '%s' "$(TERMUX_PKGS__REPO_URL)" | sed -e '$$!{:a;N;$$!ba;}; s/[\]/\\\\&/g; s/[&/]/\\&/g; s/\n/\\&/g')
export override TERMUX_CORE_PKG__REPO_URL__ESCAPED := $(shell printf '%s' "$(TERMUX_CORE_PKG__REPO_URL)" | sed -e '$$!{:a;N;$$!ba;}; s/[\]/\\\\&/g; s/[&/]/\\&/g; s/\n/\\&/g')


export override TERMUX__CONSTANTS__MACRO_FLAGS := \
	-DTERMUX_CORE_PKG__VERSION=\"$(TERMUX_CORE_PKG__VERSION)\" \
	-DTERMUX__NAME=\"$(TERMUX__NAME)\" \
	-DTERMUX__LNAME=\"$(TERMUX__LNAME)\" \
	-DTERMUX__REPOS_HOST_ORG_NAME=\"$(TERMUX__REPOS_HOST_ORG_NAME)\" \
	-DTERMUX_APP__DATA_DIR=\"$(TERMUX_APP__DATA_DIR)\" \
	-DTERMUX__ROOTFS=\"$(TERMUX__ROOTFS)\" \
	-DTERMUX__PREFIX=\"$(TERMUX__PREFIX)\" \
	-DTERMUX__PREFIX__BIN_DIR=\"$(TERMUX__PREFIX__BIN_DIR)\" \
	-DTERMUX__PREFIX__TMP_DIR=\"$(TERMUX__PREFIX__TMP_DIR)\" \
	-DTERMUX_ENV__S_TERMUX=\"$(TERMUX_ENV__S_TERMUX)\" \
	-DTERMUX_ENV__S_TERMUX_APP=\"$(TERMUX_ENV__S_TERMUX_APP)\" \
	-DTERMUX_ENV__S_TERMUX_ROOTFS=\"$(TERMUX_ENV__S_TERMUX_ROOTFS)\" \
	-DTERMUX_ENV__S_TERMUX_CORE__TESTS=\"$(TERMUX_ENV__S_TERMUX_CORE__TESTS)\"

export override TERMUX__CONSTANTS__SED_ARGS := \
	-e "s%[@]TERMUX_CORE_PKG__VERSION[@]%$(TERMUX_CORE_PKG__VERSION)%g" \
	-e "s%[@]TERMUX_CORE_PKG__ARCH[@]%$(TERMUX_CORE_PKG__ARCH)%g" \
	-e "s%[@]TERMUX__LNAME[@]%$(TERMUX__LNAME)%g" \
	-e "s%[@]TERMUX__REPOS_HOST_ORG_NAME[@]%$(TERMUX__REPOS_HOST_ORG_NAME)%g" \
	-e "s%[@]TERMUX_APP__NAME[@]%$(TERMUX_APP__NAME)%g" \
	-e "s%[@]TERMUX_APP__PACKAGE_NAME[@]%$(TERMUX_APP__PACKAGE_NAME)%g" \
	-e "s%[@]TERMUX_APP__DATA_DIR[@]%$(TERMUX_APP__DATA_DIR)%g" \
	-e "s%[@]TERMUX__ROOTFS[@]%$(TERMUX__ROOTFS)%g" \
	-e "s%[@]TERMUX__HOME[@]%$(TERMUX__HOME)%g" \
	-e "s%[@]TERMUX__PREFIX[@]%$(TERMUX__PREFIX)%g" \
	-e "s%[@]TERMUX_ENV__S_ROOT[@]%$(TERMUX_ENV__S_ROOT)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX[@]%$(TERMUX_ENV__S_TERMUX)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX_APP[@]%$(TERMUX_ENV__S_TERMUX_APP)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX_API_APP[@]%$(TERMUX_ENV__S_TERMUX_API_APP)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX_CORE[@]%$(TERMUX_ENV__S_TERMUX_CORE)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX_CORE__TESTS[@]%$(TERMUX_ENV__S_TERMUX_CORE__TESTS)%g" \
	-e "s%[@]TERMUX_ENV__S_TERMUX_EXEC__TESTS[@]%$(TERMUX_ENV__S_TERMUX_EXEC__TESTS)%g" \
	-e "s%[@]TERMUX_APP__NAMESPACE[@]%$(TERMUX_APP__NAMESPACE)%g" \
	-e "s%[@]TERMUX_APP__SHELL_API__SHELL_API_ACTIVITY__CLASS_NAME[@]%$(TERMUX_APP__SHELL_API__SHELL_API_ACTIVITY__CLASS_NAME)%g" \
	-e "s%[@]TERMUX_APP__SHELL_API__SHELL_API_SERVICE__CLASS_NAME[@]%$(TERMUX_APP__SHELL_API__SHELL_API_SERVICE__CLASS_NAME)%g" \
	-e "s%[@]TERMUX_PKGS__REPO_URL[@]%$(TERMUX_PKGS__REPO_URL__ESCAPED)%g" \
	-e "s%[@]TERMUX_CORE_PKG__REPO_URL[@]%$(TERMUX_CORE_PKG__REPO_URL__ESCAPED)%g"

define replace-termux-constants
	sed $(TERMUX__CONSTANTS__SED_ARGS) "$1.in" > "$2/$$(basename "$1")"
endef



export override CFLAGS_DEFAULT :=
export override CPPFLAGS_DEFAULT :=
export override LDFLAGS_DEFAULT :=

override CPPFLAGS_DEFAULT += -isystem$(TERMUX__PREFIX__INCLUDE_DIR)
override LDFLAGS_DEFAULT += -L$(TERMUX__PREFIX__LIB_DIR)

ifeq ($(TERMUX_CORE_PKG__ARCH),arm)
	# "We recommend using the -mthumb compiler flag to force the generation of 16-bit Thumb-2 instructions".
	# - https://developer.android.com/ndk/guides/standalone_toolchain.html#abi_compatibility
	override CFLAGS_DEFAULT += -march=armv7-a -mfpu=neon -mfloat-abi=softfp -mthumb
	override LDFLAGS_DEFAULT += -march=armv7-a
else ifeq ($(TERMUX_CORE_PKG__ARCH),i686)
	# From $NDK/docs/CPU-ARCH-ABIS.html:
	override CFLAGS_DEFAULT += -march=i686 -msse3 -mstackrealign -mfpmath=sse
	# i686 seem to explicitly require '-fPIC'.
	# - https://github.com/termux/termux-packages/issues/7215#issuecomment-906154438
	override CFLAGS_DEFAULT += -fPIC
endif

# - https://github.com/termux/termux-packages/commit/b997c4ea
ifeq ($(IS_ON_DEVICE_BUILD), 0)
	override LDFLAGS_DEFAULT += -Wl,-rpath=$(TERMUX__PREFIX__LIB_DIR)
endif

# Android 7 started to support DT_RUNPATH (but not DT_RPATH).
override LDFLAGS_DEFAULT += -Wl,--enable-new-dtags

# Avoid linking extra (unneeded) libraries.
override LDFLAGS_DEFAULT += -Wl,--as-needed

# Basic hardening.
override LDFLAGS_DEFAULT += -Wl,-z,relro,-z,now


# Set default flags if building with make directly without termux-pacakges build infrastructure.
CFLAGS ?= $(CFLAGS_DEFAULT)
CXXFLAGS ?= $(CFLAGS_DEFAULT)
CPPFLAGS ?= $(CPPFLAGS_DEFAULT)
LDFLAGS ?= $(LDFLAGS_DEFAULT)

# Force optimize for speed and do basic hardening.
export override CFLAGS_FORCE := -Wall -Wextra -Werror -Wshadow -O2 -D_FORTIFY_SOURCE=2 -fstack-protector-strong

CFLAGS += $(CFLAGS_FORCE)
CXXFLAGS += $(CFLAGS_FORCE)

FSANTIZE_FLAGS += -fsanitize=address -fsanitize-recover=address -fno-omit-frame-pointer



override LIBTERMUX_CORE__NOS__C__SOURCE_FILES := \
	lib/termux-core_nos_c_tre/src/android/shell/command/environment/AndroidShellEnvironment.c \
	lib/termux-core_nos_c_tre/src/TermuxCoreLibraryConfig.c \
	lib/termux-core_nos_c_tre/src/data/AssertUtils.c \
	lib/termux-core_nos_c_tre/src/data/DataUtils.c \
	lib/termux-core_nos_c_tre/src/logger/FileLoggerImpl.c \
	lib/termux-core_nos_c_tre/src/logger/Logger.c \
	lib/termux-core_nos_c_tre/src/logger/StandardLoggerImpl.c \
	lib/termux-core_nos_c_tre/src/security/SecurityUtils.c \
	lib/termux-core_nos_c_tre/src/termux/file/TermuxFile.c \
	lib/termux-core_nos_c_tre/src/termux/shell/command/environment/TermuxShellEnvironment.c \
	lib/termux-core_nos_c_tre/src/termux/shell/command/environment/termux_core/TermuxCoreShellEnvironment.c \
	lib/termux-core_nos_c_tre/src/unix/file/UnixFileUtils.c \
	lib/termux-core_nos_c_tre/src/unix/os/process/UnixForkUtils.c \
	lib/termux-core_nos_c_tre/src/unix/os/process/UnixSafeStrerror.c \
	lib/termux-core_nos_c_tre/src/unix/os/process/UnixSignalUtils.c \
	lib/termux-core_nos_c_tre/src/unix/os/selinux/UnixSeLinuxUtils.c \
	lib/termux-core_nos_c_tre/src/unix/shell/command/environment/UnixShellEnvironment.c

override LIBTERMUX_CORE__NOS__C__OBJECT_FILES := $(patsubst lib/%.c,$(TMP_BUILD_OUTPUT_DIR)/lib/%.o,$(LIBTERMUX_CORE__NOS__C__SOURCE_FILES))

override LIBTERMUX_CORE__NOS__C__CPPFLAGS := $(CPPFLAGS) -I "lib/termux-core_nos_c_tre/include"

override LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR := $(TESTS_BUILD_OUTPUT_DIR)/lib/termux-core_nos_c_tre



override LIBTERMUX_CORE__NOS__CXX__SOURCE_FILES := \
	lib/termux-core_nos_cxx_tre/src/TermuxCoreLibraryConfig.cxx

override LIBTERMUX_CORE__NOS__CXX__OBJECT_FILES := $(patsubst lib/%.cxx,$(TMP_BUILD_OUTPUT_DIR)/lib/%.o,$(LIBTERMUX_CORE__NOS__CXX__SOURCE_FILES))

override LIBTERMUX_CORE__NOS__CXX__CPPFLAGS := $(CPPFLAGS) -I "lib/termux-core_nos_c_tre/include" -I "lib/termux-core_nos_cxx_tre/include"



override TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR := $(TESTS_BUILD_OUTPUT_DIR)/app/main



# The `-L` flag must come before `$LDFLAGS`, otherwise old library
# installed in system library directory from previous builds
# will get used instead of newly built one in `$LIB_BUILD_OUTPUT_DIR`.
# The `-fvisibility=hidden` flag is passed so that no internal
# functions are exported. All exported functions must explicitly enable
# `default` visibility with `__attribute__((visibility("default")))`,
# like for the `main()` function.
# The `-Wl,--exclude-libs=ALL` flag is passed so that symbols from
# the `libtermux-core_nos_c_tre.a` static library linked are not exported.
# Run `nm --demangle --defined-only --extern-only <executable>` to
# find exported symbols.
override TERMUX_CORE_EXECUTABLE__C__BUILD_COMMAND := \
	$(CC) $(CFLAGS) $(LIBTERMUX_CORE__NOS__C__CPPFLAGS) \
	-L$(LIB_BUILD_OUTPUT_DIR) $(LDFLAGS) -Wl,--exclude-libs=ALL \
	$(TERMUX__CONSTANTS__MACRO_FLAGS) \
	-fPIE -pie -fvisibility=hidden

# The `-l` flags must be passed after object files for proper linking.
# The order of libraries matters too and any dependencies of a library
# must come after it.
override TERMUX_CORE_EXECUTABLE__C__POST_LDFLAGS := -l:libtermux-core_nos_c_tre.a



# - https://www.gnu.org/software/make/manual/html_node/Parallel-Disable.html
.NOTPARALLEL:

all: | pre-build build-termux-core-main-app build-libtermux-core_nos_c_tre build-libtermux-core_nos_cxx_tre
	@printf "\ntermux-core-package: %s\n" "Building packaging/debian/*"
	@mkdir -p $(DEBIAN_PACKAGING_BUILD_OUTPUT_DIR)
	find packaging/debian -mindepth 1 -maxdepth 1 -type f -name "*.in" -exec sh -c \
		'sed $(TERMUX__CONSTANTS__SED_ARGS) "$$1" > $(DEBIAN_PACKAGING_BUILD_OUTPUT_DIR)/"$$(basename "$$1" | sed "s/\.in$$//")"' sh "{}" \;
	find $(DEBIAN_PACKAGING_BUILD_OUTPUT_DIR) -mindepth 1 -maxdepth 1 -type f \
		-regextype posix-extended -regex "^.*/(postinst|postrm|preinst|prerm)$$" \
		-exec chmod 700 {} \;
	find $(DEBIAN_PACKAGING_BUILD_OUTPUT_DIR) -mindepth 1 -maxdepth 1 -type f \
		-regextype posix-extended -regex "^.*/(config|conffiles|templates|triggers|clilibs|fortran_mod|runit|shlibs|starlibs|symbols)$$" \
		-exec chmod 600 {} \;


	@printf "\ntermux-core-package: %s\n\n" "Build termux-core-package successful"

pre-build: | clean
	@printf "termux-core-package: %s\n" "Building termux-core-package"
	@mkdir -p $(BUILD_OUTPUT_DIR)
	@mkdir -p $(TMP_BUILD_OUTPUT_DIR)

build-termux-core-main-app:
	@printf "\ntermux-core-package: %s\n" "Building app/main"

	@printf "\ntermux-core-package: %s\n" "Building app/main/scripts/*"
	@mkdir -p $(BIN_BUILD_OUTPUT_DIR)
	find app/main/scripts -type f -name "*.in" -exec sh -c \
		'sed $(TERMUX__CONSTANTS__SED_ARGS) "$$1" > $(BIN_BUILD_OUTPUT_DIR)/"$$(basename "$$1" | sed "s/\.in$$//")"' sh "{}" \;
	find $(BIN_BUILD_OUTPUT_DIR) -maxdepth 1 -type f -exec chmod 700 "{}" \;
	find app/main/scripts -type l -exec cp -a "{}" $(BIN_BUILD_OUTPUT_DIR)/ \;
	"$(TERMUX_CORE__TERMUX_REPLACE_TERMUX_CORE_SRC_SCRIPTS_FILE)" $(BIN_BUILD_OUTPUT_DIR)/*


	@printf "\ntermux-core-package: %s\n" "Building app/main/tests/*"
	@mkdir -p $(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR)
	find app/main/tests -maxdepth 1 -type f -name "*.in" -print0 | xargs -0 -n1 sh -c \
		'output_file="$(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR)/$$(printf "%s" "$$0" | sed -e "s|^app/main/tests/||" -e "s/\.in$$//")" && mkdir -p "$$(dirname "$$output_file")" && sed $(TERMUX__CONSTANTS__SED_ARGS) "$$0" > "$$output_file"'
	find $(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR) -maxdepth 1 -type f -exec chmod 700 "{}" \;

	@printf "\ntermux-core-package: %s\n" "Building app/main/tests/scripts/*"
	@mkdir -p $(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR)/scripts
	find app/main/tests/scripts -type f -name "*.in" -print0 | xargs -0 -n1 sh -c \
		'output_file="$(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR)/scripts/$$(printf "%s" "$$0" | sed -e "s|^app/main/tests/scripts/||" -e "s/\.in$$//")" && mkdir -p "$$(dirname "$$output_file")" && sed $(TERMUX__CONSTANTS__SED_ARGS) "$$0" > "$$output_file"'
	find $(TERMUX_CORE__MAIN_APP__TESTS_BUILD_OUTPUT_DIR)/scripts -type f -exec chmod 700 "{}" \;

build-libtermux-core_nos_c_tre:
	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_c_tre"
	@mkdir -p $(LIB_BUILD_OUTPUT_DIR)

	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_c_tre/lib/*.o"
	for source_file in $(LIBTERMUX_CORE__NOS__C__SOURCE_FILES); do \
		mkdir -p "$$(dirname "$(TMP_BUILD_OUTPUT_DIR)/$$source_file")" || exit $$?; \
		$(CC) -c $(CFLAGS) $(LIBTERMUX_CORE__NOS__C__CPPFLAGS) \
			$(TERMUX__CONSTANTS__MACRO_FLAGS) \
			-fPIC -fvisibility=default \
			-o $(TMP_BUILD_OUTPUT_DIR)/"$$(echo "$$source_file" | sed -E "s/(.*)\.c$$/\1.o/")" \
			"$$source_file" || exit $$?; \
	done

	@# `nm --demangle --dynamic --defined-only --extern-only /home/builder/.termux-build/termux-core/src/build/output/usr/lib/libtermux-core_nos_c_tre.so`
	@printf "\ntermux-core-package: %s\n" "Building lib/libtermux-core_nos_c_tre.so"
	$(CC) $(CFLAGS) $(LIBTERMUX_CORE__NOS__C__CPPFLAGS) \
		$(LDFLAGS) \
		$(TERMUX__CONSTANTS__MACRO_FLAGS) \
		-fPIC -shared -fvisibility=default \
		-o $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_c_tre.so \
		$(LIBTERMUX_CORE__NOS__C__OBJECT_FILES)

	@printf "\ntermux-core-package: %s\n" "Building lib/libtermux-core_nos_c_tre.a"
	$(AR) rcs $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_c_tre.a $(LIBTERMUX_CORE__NOS__C__OBJECT_FILES)



	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_c_tre/tests/*"
	@mkdir -p $(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR)


	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_c_tre/tests/libtermux-core_nos_c_tre_tests"
	$(call replace-termux-constants,lib/termux-core_nos_c_tre/tests/libtermux-core_nos_c_tre_tests,$(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR))
	chmod 700 $(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR)/libtermux-core_nos_c_tre_tests


	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_c_tre/tests/bin/libtermux-core_nos_c_tre_unit-binary-tests"
	@mkdir -p $(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR)/bin

	@# `nm --demangle --defined-only --extern-only /home/builder/.termux-build/termux-core/src/build/output/usr/libexec/installed-tests/termux-core/lib/termux-core_nos_c_tre/bin/libtermux-core_nos_c_tre_unit-binary-tests-fsanitize`
	$(TERMUX_CORE_EXECUTABLE__C__BUILD_COMMAND) -O0 -g \
		$(FSANTIZE_FLAGS) \
		-o $(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR)/bin/libtermux-core_nos_c_tre_unit-binary-tests-fsanitize \
		lib/termux-core_nos_c_tre/tests/src/libtermux-core_nos_c_tre_unit-binary-tests.c \
		$(TERMUX_CORE_EXECUTABLE__C__POST_LDFLAGS)

	@# `nm --demangle --defined-only --extern-only /home/builder/.termux-build/termux-core/src/build/output/usr/libexec/installed-tests/termux-core/lib/termux-core_nos_c_tre/bin/libtermux-core_nos_c_tre_unit-binary-tests-nofsanitize`
	$(TERMUX_CORE_EXECUTABLE__C__BUILD_COMMAND) -O0 -g \
		-o $(LIBTERMUX_CORE__NOS__C__TESTS_BUILD_OUTPUT_DIR)/bin/libtermux-core_nos_c_tre_unit-binary-tests-nofsanitize \
		lib/termux-core_nos_c_tre/tests/src/libtermux-core_nos_c_tre_unit-binary-tests.c \
		$(TERMUX_CORE_EXECUTABLE__C__POST_LDFLAGS)

build-libtermux-core_nos_cxx_tre:
	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_cxx_tre"
	@mkdir -p $(LIB_BUILD_OUTPUT_DIR)

	@printf "\ntermux-core-package: %s\n" "Building lib/termux-core_nos_cxx_tre/lib/*.o"
	for source_file in $(LIBTERMUX_CORE__NOS__CXX__SOURCE_FILES); do \
		mkdir -p "$$(dirname "$(TMP_BUILD_OUTPUT_DIR)/$$source_file")" || exit $$?; \
		$(CXX) -c $(CXXFLAGS) $(LIBTERMUX_CORE__NOS__CXX__CPPFLAGS) \
			$(TERMUX__CONSTANTS__MACRO_FLAGS) \
			-fPIC -fvisibility=default \
			-o $(TMP_BUILD_OUTPUT_DIR)/"$$(echo "$$source_file" | sed -E "s/(.*)\.cxx$$/\1.o/")" \
			"$$source_file" || exit $$?; \
	done

	@# `nm --demangle --dynamic --defined-only --extern-only /home/builder/.termux-build/termux-core/src/build/output/usr/lib/libtermux-core_nos_cxx_tre.so`
	@printf "\ntermux-core-package: %s\n" "Building lib/libtermux-core_nos_cxx_tre.so"
	$(CXX) $(CXXFLAGS) $(LIBTERMUX_CORE__NOS__CXX__CPPFLAGS) \
		-L$(LIB_BUILD_OUTPUT_DIR) $(LDFLAGS) -Wl,--exclude-libs=ALL \
		$(TERMUX__CONSTANTS__MACRO_FLAGS) \
		-fPIC -shared -fvisibility=default \
		-o $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_cxx_tre.so \
		$(LIBTERMUX_CORE__NOS__CXX__OBJECT_FILES) \
		-l:libtermux-core_nos_c_tre.a

	@printf "\ntermux-core-package: %s\n" "Building lib/libtermux-core_nos_cxx_tre.a"
	$(AR) rcs $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_cxx_tre.a $(LIBTERMUX_CORE__NOS__CXX__OBJECT_FILES)



clean:
	rm -rf $(BUILD_OUTPUT_DIR)

install:
	@printf "termux-core-package: %s\n" "Installing termux-core-package in $(TERMUX_CORE_PKG__INSTALL_PREFIX)"
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/bin
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/libexec


	find $(BIN_BUILD_OUTPUT_DIR) -maxdepth 1 \( -type f -o -type l \) -exec cp -a "{}" $(TERMUX_CORE_PKG__INSTALL_PREFIX)/bin/ \;


	rm -rf $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core/termux

	cp -a lib/termux-core_nos_c_tre/include/termux/termux_core__nos__c $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core/termux/termux_core__nos__c
	install $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_c_tre.so $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_c_tre.so
	install $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_c_tre.a $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_c_tre.a

	cp -a lib/termux-core_nos_cxx_tre/include/termux/termux_core__nos__cxx $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core/termux/termux_core__nos__cxx
	install $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_cxx_tre.so $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_cxx_tre.so
	install $(LIB_BUILD_OUTPUT_DIR)/libtermux-core_nos_cxx_tre.a $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_cxx_tre.a

	find $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core -type d -exec chmod 700 {} \;
	find $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core -type f -exec chmod 600 {} \;


	rm -rf $(TERMUX_CORE_PKG__INSTALL_PREFIX)/libexec/installed-tests/termux-core
	install -d $(TERMUX_CORE_PKG__INSTALL_PREFIX)/libexec/installed-tests
	cp -a $(TESTS_BUILD_OUTPUT_DIR) $(TERMUX_CORE_PKG__INSTALL_PREFIX)/libexec/installed-tests/termux-core

	@printf "\ntermux-core-package: %s\n\n" "Install termux-core-package successful"

uninstall:
	@printf "termux-core-package: %s\n" "Uninstalling termux-core-package from $(TERMUX_CORE_PKG__INSTALL_PREFIX)"

	find app/main/scripts \( -type f -o -type l \) -exec sh -c \
		'rm -f "$(TERMUX_CORE_PKG__INSTALL_PREFIX)/bin/$$(basename "$$1" | sed "s/\.in$$//")"' sh "{}" \;

	rm -rf $(TERMUX_CORE_PKG__INSTALL_PREFIX)/include/termux-core


	rm -f $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_c_tre.so
	rm -f $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_c_tre.a

	rm -f $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_cxx_tre.so
	rm -f $(TERMUX_CORE_PKG__INSTALL_PREFIX)/lib/libtermux-core_nos_cxx_tre.a


	rm -rf $(TERMUX_CORE_PKG__INSTALL_PREFIX)/libexec/installed-tests/termux-core

	@printf "\ntermux-core-package: %s\n\n" "Uninstall termux-core-package successful"



packaging-debian-build: all
	termux-create-package $(DEBIAN_PACKAGING_BUILD_OUTPUT_DIR)/termux-core-package.json



test: all
	$(MAKE) TERMUX_CORE_PKG__INSTALL_PREFIX=$(PREFIX_BUILD_INSTALL_DIR) install

	@printf "\ntermux-core-package: %s\n" "Executing termux-core-package tests"
	bash $(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core/app/main/termux-core-tests \
		--tests-path="$(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core" \
		--only-termux-core-tests \
		-vvv all

test-unit: all
	$(MAKE) TERMUX_CORE_PKG__INSTALL_PREFIX=$(PREFIX_BUILD_INSTALL_DIR) install

	@printf "\ntermux-core-package: %s\n" "Executing termux-core-package unit tests"
	bash $(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core/app/main/termux-core-tests \
		--tests-path="$(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core" \
		--only-termux-core-tests \
		-vvv unit

test-runtime: all
	$(MAKE) TERMUX_CORE_PKG__INSTALL_PREFIX=$(PREFIX_BUILD_INSTALL_DIR) install

	@printf "\ntermux-core-package: %s\n" "Executing termux-core-package runtime tests"
	bash $(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core/app/main/termux-core-tests \
		--tests-path="$(PREFIX_BUILD_INSTALL_DIR)/libexec/installed-tests/termux-core" \
		--only-termux-core-tests \
		-vvv runtime



.PHONY: all pre-build build-termux-core-main-app build-libtermux-core_nos_c_tre build-libtermux-core_nos_cxx_tre clean install uninstall packaging-debian-build test test-unit test-runtime
