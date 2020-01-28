TEMPLATE = aux

INSTALLER = ProbeBasic-Installer

INPUT = $$PWD/config/config.xml $$PWD/packages/

INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/package.xml
INPUT += $$PWD/packages/com.kcjengr.qtpyvcp/meta/installscript.qs


probebasic.input = INPUT
probebasic.output = $$INSTALLER
probebasic.commands = $$(HOME)/installer-framework/bin/binarycreator --online-only --config $$PWD/config/config.xml -p $$PWD/packages ${QMAKE_FILE_OUT}
probebasic.CONFIG += target_predeps no_link combine

QMAKE_EXTRA_COMPILERS += probebasic

OTHER_FILES = README

DISTFILES +=
