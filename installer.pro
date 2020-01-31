TEMPLATE = aux

INSTALLER = QtPyVCP-Installer
CONFIG += debug_and_release

INPUT = $$PWD/config/config.xml $$PWD/packages/

INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/package.xml
INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/installscript.qs


qtpyvcp.input = INPUT
qtpyvcp.output = $$INSTALLER
qtpyvcp.commands += $$(HOME)/installer-framework/bin/binarycreator --online-only --config $$PWD/config/config.xml -p $$PWD/packages $$PWD/bin/${QMAKE_FILE_OUT}.run;
qtpyvcp.commands += $$(HOME)/installer-framework/bin/repogen -p $$PWD/packages $$PWD/repo;
qtpyvcp.CONFIG += target_predeps no_link combine

QMAKE_EXTRA_COMPILERS += qtpyvcp

OTHER_FILES = README

DISTFILES +=