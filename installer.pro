TEMPLATE = aux

INSTALLER = QtPyVCP-Installer-$$(QTPYVCP_VERSION).run

CONFIG += qt debug_and_release

INPUT = $$PWD/config/config.xml $$PWD/packages/

INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/package.xml
INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/installscript.qs


qtpyvcp.input = INPUT
qtpyvcp.output = $$INSTALLER
qtpyvcp.commands += $$(HOME)/Qt/QtIFW-3.2.2/bin/binarycreator -p $$PWD/packages --config $$PWD/config/config.xml $$PWD/bin/${QMAKE_FILE_OUT};
qtpyvcp.commands += $$(HOME)/Qt/QtIFW-3.2.2/bin/repogen -p $$PWD/packages -i com.kcjengr.qtpyvcp --update $$PWD/repo;

qtpyvcp.CONFIG += target_predeps no_link combine

QMAKE_EXTRA_COMPILERS += qtpyvcp

OTHER_FILES = README

DISTFILES +=
