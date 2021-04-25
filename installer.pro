TEMPLATE = aux

INSTALLER = QtPyVCP-Installer-$$(QTPYVCP_VERSION).run

INPUT = $$PWD/config/
INPUT += $$PWD/packages/

INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/package.xml
INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/installscript.qs

qtpyvcp.input = INPUT
qtpyvcp.output = $$INSTALLER

qtpyvcp.commands += $$(HOME)/Qt/QtIFW-4.0.1/bin/repogen --update -p $$PWD/packages $$PWD/repo;
qtpyvcp.commands += $$(HOME)/Qt/QtIFW-4.0.1/bin/binarycreator -p $$PWD/packages --config $$PWD/config/config.xml $$PWD/bin/${QMAKE_FILE_OUT};

qtpyvcp.CONFIG += target_predeps no_link combine

QMAKE_EXTRA_COMPILERS += qtpyvcp

OTHER_FILES = README

DISTFILES +=
