import QtQuick
import QtQuick.Controls
import QtCharts
import QtQuick.Layouts

import "views"
import "common"

Window {
    property var currentView: null

    id: root

    minimumHeight: Common.__minimumWindowHeight__
    minimumWidth: Common.__minimumWindowWidth__

    visible: true

    title: qsTr("Hello World")

    WelcomView {
        id: welcomView
        onExit: {
            Qt.quit()
        }
        onNext: {
            replace(licenseAgreement)
        }
    }

    LicenseAgreement {
        id: licenseAgreement
        onBack: {
            replace(welcomView)
        }
        onNext: {
            replace(licensesSecurlogon)
        }
    }

    LicensesSecurlogon {
        id: licensesSecurlogon
        onBack: {
            replace(welcomView)
        }
        onNext: {
            replace(chososingTypeSettings)
        }
    }

    ChoosingTypeSetting {
        id: chososingTypeSettings
        onTwoFactorAuthentidication:{
            replace(choosingTypeSettingAuthentication)
        }
        onRemoteDesktopProtocol:{
            replace(choosingTypeSettingRDP)
        }
        onWorkProfiles:{
            replace(settingsElectronicKeyNoPKI)
        }
        onAdditionalSettings:{
            replace(additionalSettingsAll)
        }
        onLicenseSettings: {
            replace(licensesSecurlogonChososingTypeSettings)
        }
        onBack: {
            replace(welcomView)
        }
    }

    LicensesSecurlogon {
        id: licensesSecurlogonChososingTypeSettings

        textInNexButton: "Завершить"

        onBack: {
            replace(chososingTypeSettings)
        }
        onNext: {
            Qt.quit()
        }
    }

    SettingsElectronicKeyNoPKI {
        id: settingsElectronicKeyNoPKI

        isSettings: 0

        textInNexButton: "Завершить"

        onNext: {
            Qt.quit()
        }
        onBack: {
            replace(chososingTypeSettings)
        }
    }

    AdditionalSettingsAll {
        id: additionalSettingsAll

        isVisibleActionRDP: true
        isVisibleActionSystem: true
        isVisibleResetCheck: true
        isVisibleCheckSwitchWindows: true

        onExit: {
            Qt.quit()
        }
        onBack: {
            replace(chososingTypeSettings)
        }
    }

    ChoosingTypeSettingAuthentication {
        id: choosingTypeSettingAuthentication
        onNetTwoFactorAuthentification: {
            replace(choosingTypeSettingAuthenticationNet)
        }
        onLocalTwoFactorAuthentification: {
            replace(choosingTypeSettingAuthenticationLocal)
        }
        onBack: {
            replace(chososingTypeSettings)
        }
    }

    ChoosingTypeSettingAuthenticationLocal {
        id: choosingTypeSettingAuthenticationLocal
        onLocalTwoFactorAuthentificationNoPKI: {
            replace(localNoPKIAuthenticationSetting)
        }
        onBack: {
            replace(choosingTypeSettingAuthentication)
        }
    }

    LocalNoPKIAuthenticationSetting {
        id: localNoPKIAuthenticationSetting
        onNext: {
            replace(settingsElectronicKeyNoPKILocal)
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationLocal)
        }
    }

    SettingsElectronicKeyNoPKI {
        id: settingsElectronicKeyNoPKILocal
        isSettings: 2
        onNext: {
            replace(additionalSettingsAllSettingsElectronicKeyNoPKILocal)
        }
        onBack: {
            replace(localNoPKIAuthenticationSetting)
        }
    }

    AdditionalSettingsAll {
        id: additionalSettingsAllSettingsElectronicKeyNoPKILocal

        isVisibleActionSystem: true
        isVisibleResetCheck: true
        isVisibleCheckSwitchWindows: true

        onExit: {
            Qt.quit()
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationLocal)
        }
    }

    ChoosingTypeSettingAuthenticationNet {
        id: choosingTypeSettingAuthenticationNet
        onNetTwoFactorAuthentificationPKI: {
            replace(netPKIAuthenticationSetting)
        }
        onNetTwoFactorAuthentificationNoPKI: {
            replace(netNoPKIAuthenticationSetting)
        }
        onNetTwoFactorAuthentificationOTP: {
            replace(netOTPAuthenticationSetting)
        }
        onBack: {
            replace(choosingTypeSettingAuthentication)
        }
    }

    NetPKIAuthenticationSetting {
        id: netPKIAuthenticationSetting
        onNext: {
            replace(additionalSettingsAllNet)
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationNet)
        }
        onToOTP: {
            replace(netOTPAuthenticationSetting)
        }
    }

    NetNoPKIAuthenticationSetting {
        id: netNoPKIAuthenticationSetting
        onNext: {
            replace(settingsElectronicKeyNoPKINetNoPKIAuthenticationSetting)
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationNet)
        }
    }

    SettingsElectronicKeyNoPKI {
        id: settingsElectronicKeyNoPKINetNoPKIAuthenticationSetting
        isSettings: 1
        onNext: {
            replace(additionalSettingsAllNet)
        }
        onBack: {
            replace(netNoPKIAuthenticationSetting)
        }
    }

    NetOTPAuthenticationSetting {
        id: netOTPAuthenticationSetting
        onNext: {
            replace(additionalSettingsAllNet)
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationNet)
        }
    }

    AdditionalSettingsAll {
        id: additionalSettingsAllNet

        isVisibleActionSystem: true
        isVisibleResetCheck: true
        isVisibleCheckSwitchWindows: true

        onExit: {
            Qt.quit()
        }
        onBack: {
            replace(choosingTypeSettingAuthenticationNet)
        }
    }

    ChoosingTypeSettingRDP {
        id: choosingTypeSettingRDP
        onRemoteRDPTwoFactorAuthentificationPKI: {
            replace(remoteRDPPKIAuthenticationSetting)
        }
        onRemoteRDPTwoFactorAuthentificationNoPKI: {
            replace(remoteRDPNoPKIAuthenticationSetting)
        }
        onBack: {
            replace(chososingTypeSettings)
        }
    }

    RemoteRDPNoPKIAuthenticationSetting {
        id: remoteRDPNoPKIAuthenticationSetting
        onNext: {
            replace(additionalSettingsAllRemoteRDP)
        }
        onBack: {
            replace(choosingTypeSettingRDP)
        }
    }

    RemoteRDPPKIAuthenticationSetting {
        id: remoteRDPPKIAuthenticationSetting
        onNext: {
            replace(additionalSettingsAllRemoteRDP)
        }
        onBack: {
            replace(choosingTypeSettingRDP)
        }
    }

    AdditionalSettingsAll {
        id: additionalSettingsAllRemoteRDP

        isVisibleActionRDP: true

        onExit: {
            Qt.quit()
        }
        onBack: {
            replace(choosingTypeSettingRDP)
        }
    }

    Component.onCompleted: replace(netOTPAuthenticationSetting)

    function replace(newView) {
        if (currentView !== null) {currentView.visible = false}
        currentView = newView
        if (currentView !== null) {currentView.visible = true}
    }

    Binding {
        target: Common
        property: "__height__"
        value: root.height
    }

    Binding {
        target: Common
        property: "__width__"
        value: root.width
    }
}
