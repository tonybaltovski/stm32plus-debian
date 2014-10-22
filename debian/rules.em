#!/usr/bin/make -f

SCONS=scons
INSTALLDIR=$$(pwd)/debian/tmp/usr/arm-none-eabi
@{
def to_scons_config(config_string):
	parts = config_string.split("-")
	ret = "mode=" + parts[0] + " mcu=" + parts[1] + " hse=" + parts[2]
	if len(parts) == 4:
	    ret += " float=" + parts[3]
	return ret
}@

%:
	dh $@@


override_dh_auto_build:
@[for config_string in config_strings]@
	$(SCONS) @to_scons_config(config_string) -j4 INSTALLDIR=$(INSTALLDIR)
@[end for]@

override_dh_auto_clean:
	dh_auto_clean
@[for config_string in config_strings]@
	$(SCONS) @to_scons_config(config_string) -j4 INSTALLDIR=$(INSTALLDIR) -c
@[end for]@

override_dh_auto_install:
@[for config_string in config_strings]@
	$(SCONS) @to_scons_config(config_string) -j4 INSTALLDIR=$(INSTALLDIR) install
@[end for]@

