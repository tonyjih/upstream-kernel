################################################################################
#
# RTL8188FU
#
################################################################################

RTL8188FU_VERSION = e7f2fcc65407a6a3cbee0ecdabf2aed67ceeae5e
RTL8188FU_SITE = $(call github,kelebek333,rtl8188fu,$(RTL8188FU_VERSION))
RTL8188FU_LICENSE = GPL-2.0

RTL8188FU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8188FU=m \
	TopDIR=$(@D) \
# batocera: setting KVER breaks top level parallelization
	# KVER=$(LINUX_VERSION_PROBED)
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

#RTL8188FU_PRE_CONFIGURE_HOOKS += RTL8188FU_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
