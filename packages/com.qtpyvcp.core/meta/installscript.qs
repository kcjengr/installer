function Component()
{
}


Component.prototype.createOperations = function()
{
    component.createOperations();

    // Get Version From Updates.xml if available
    var package_version = installer.componentByName("com.qtpyvcp.core").value("Version")

    // component.addElevatedOperation("Execute", "apt", "install", "--assume-yes", "python-pyqt5", "python-pyqt5.qtquick", "python-dbus.mainloop.pyqt5", "python-pyqt5.qtopengl", "python-pyqt5.qsci", "python-pyqt5.qtmultimedia", "qml-module-qtquick-controls", "gstreamer1.0-plugins-bad", "libqt5multimedia5-plugins", "pyqt5-dev-tools", "python-dev", "python-setuptools", "python-pip", "git", "python-pyqtgraph");
    component.addOperation("Execute", "python3", "-m", "pip", "install", "--user", "--upgrade", "@TargetDir@/qtpyvcp-"+ package_version +"-py3-none-any.whl", "UNDOEXECUTE", "python3", "-m", "pip", "uninstall", "--yes", "qtpyvcp");

}
