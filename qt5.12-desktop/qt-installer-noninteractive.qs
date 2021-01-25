// Emacs mode hint: -*- mode: JavaScript -*-

function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton, 30000);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    // click delay here because the next button is initially disabled for ~1 second
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/Qt");
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    widget.deselectAll();
    widget.selectComponent("qt.qt5.5123.gcc_64");
    widget.selectComponent("qt.qt5.5123.qtquickcontrols");
    widget.selectComponent("qt.qt5.5123.qtcharts"); 
    widget.selectComponent("qt.qt5.5123.qtdatavis3d");
    widget.selectComponent("qt.qt5.5123.qtpurchasing");
    widget.selectComponent("qt.qt5.5123.qtvirtualkeyboard");
    widget.selectComponent("qt.qt5.5123.qtwebengine");
    widget.selectComponent("qt.qt5.5123.qtnetworkauth");
    widget.selectComponent("qt.qt5.5123.qtwebglplugin");
    widget.selectComponent("qt.qt5.5123.qtscript");
 

    widget.deselectComponent("qt.tools.qtcreator");
    // widget.deselectComponent("qt.qt5.5123.qt3d");
    // widget.deselectComponent("qt.qt5.5123.qtcanvas3d");
    // widget.deselectComponent("qt.qt5.5123.qtlocation");
    // widget.deselectComponent("qt.qt5.5123.qtquick1");
    // widget.deselectComponent("qt.qt5.5123.qtscript");
    // widget.deselectComponent("qt.qt5.5123.qtwebengine");
    // widget.deselectComponent("qt.extras");
    // widget.deselectComponent("qt.tools.doc");
    // widget.deselectComponent("qt.tools.examples");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton, 30000);
}

Controller.prototype.FinishedPageCallback = function() {
var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm;
if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
    checkBoxForm.launchQtCreatorCheckBox.checked = false;
}
    gui.clickButton(buttons.FinishButton, 30000);
}
