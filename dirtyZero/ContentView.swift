//
//  ContentView.swift
//  dirtyZero
//  ZeroCalories
//
//  Created by Skadz on 5/8/25.
//  Modified by Candy (@c4ndyf1sh)

import SwiftUI
import DeviceKit
import QuickLook

struct ZeroTweak: Identifiable, Codable {
    var id: String { name }
    var icon: String
    var name: String
    var paths: [String]
    
    enum CodingKeys: String, CodingKey {
        case icon, name, paths
    }
}

extension Array: @retroactive RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
var springBoard: [ZeroTweak] = [
    ZeroTweak(icon: "dock.rectangle", name: "Hide Dock", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/dockDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/dockLight.materialrecipe"]),
    ZeroTweak(icon: "folder", name: "Hide Folder Backgrounds", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderDark.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderLight.materialrecipe"]),
    ZeroTweak(icon: "list.bullet.rectangle", name: "Hide Alert & Touch Backgrounds", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentLight.materialrecipe"]),
    ZeroTweak(icon: "magnifyingglass.circle", name: "Disable App Library Search Blur", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/homeScreenOverlayLibrarySearch.descendantrecipe"]),
    ZeroTweak(icon: "magnifyingglass", name: "Disable Spotlight Blur", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/knowledgeBackgroundDark.materialrecipe"]),
    ZeroTweak(icon: "rectangle.stack", name: "Disable App Switcher Blur", paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-application.materialrecipe",
                                                                                  "/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-switcher.materialrecipe"]),
    ZeroTweak(icon: "repeat.circle", name: "Hide Respring Animation", paths: ["/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@3x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@1x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@2x.png",
                                                                              "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@3x.png"]),
]


var lockScreen: [ZeroTweak] = [
    ZeroTweak(icon: "ellipsis.rectangle", name: "Hide Passcode Background", paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/dashBoardPasscodeBackground.materialrecipe"]),
    ZeroTweak(icon: "lock", name: "Hide Lock Icon", paths: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-812h.ca/main.caml",
                                                            "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-896h.ca/main.caml",
                                                            "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-812h.ca/main.caml",
                                                            "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-896h.ca/main.caml",
                                                            "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-d73.ca/main.caml"]),
    ZeroTweak(icon: "bolt", name: "Hide Large Battery Icon", paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"]),
    ZeroTweak(icon: "eye.slash", name: "Hide Noti/Music Player BG", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeLight.visualstyleset",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeDark.visualstyleset",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/plattersDark.materialrecipe",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/platters.materialrecipe"]),
    ZeroTweak(icon: "minus.circle", name: "Hide Flash/Camera(<17)", paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"]),
    
]

var systemWideCustomization: [ZeroTweak] = [
    ZeroTweak(icon: "bell", name: "Hide Notification & Widget BGs", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeLight.visualstyleset",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeDark.visualstyleset",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/plattersDark.materialrecipe",
                                                                            "/System/Library/PrivateFrameworks/CoreMaterial.framework/platters.materialrecipe"]),
    ZeroTweak(icon: "rectangle.topthird.inset.filled", name: "Remove Top Blur In Apps", paths:
                ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeDark.materialrecipe",
                 "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeDarkReduceTransparencyLayer1.descendantrecipe",
                 "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeFillDark.descendantstyleset",
                 "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeFillLight.descendantstyleset",
                 "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeLight.materialrecipe",
                 "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformChromeLightReduceTransparency.materialrecipe"]),
    
    ZeroTweak(icon: "highlighter", name: "Disable Selected Text BG", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentThickDark.materialrecipe",
                                                                             "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentThickLight.materialrecipe"]),
    ZeroTweak(icon: "command.circle", name: "Disable Shortcuts Banner", paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/BannersAuthorizedBundleIDs.plist"]),
    ZeroTweak(icon: "line.3.horizontal", name: "Hide Home Bar", paths: ["/System/Library/PrivateFrameworks/MaterialKit.framework/Assets.car"]),
    ZeroTweak(icon: "character.cursor.ibeam", name: "Enable 𝖧𝖾𝗅𝗏𝖾𝗍𝗂𝖼𝖺 Font", paths: ["/System/Library/Fonts/Core/SFUI.ttf"]),
    ZeroTweak(icon: "questionmark.app.dashed", name: "Enable ?⃞ Font", paths: ["/System/Library/Fonts/Core/Helvetica.ttc",
                                                                              "/System/Library/Fonts/Core/SFUI.ttf"]),
    ZeroTweak(icon: "questionmark.app.dashed", name: "Enable Fancy ?⃞ Font", paths: ["/System/Library/Fonts/Core/LastResort.otf",
                                                                                     "/System/Library/Fonts/Core/Helvetica.ttc",
                                                                                     "/System/Library/Fonts/Core/SFUI.ttf"]),
    ZeroTweak(icon: "circle.slash", name: "Remove Emojis", paths: ["/System/Library/Fonts/CoreAddition/AppleColorEmoji-160px.ttc"]),
]
   
var soundEffects: [ZeroTweak] = [
    ZeroTweak(icon: "dot.radiowaves.left.and.right", name: "Disable AirDrop Ping", paths: ["/System/Library/Audio/UISounds/Modern/airdrop_invite.cat"]),
    ZeroTweak(icon: "bolt", name: "Disable Charge Sound", paths: ["/System/Library/Audio/UISounds/connect_power.caf"]),
    ZeroTweak(icon: "battery.25", name: "Disable Low Battery Sound", paths: ["/System/Library/Audio/UISounds/low_power.caf"]),
    ZeroTweak(icon: "creditcard", name: "Disable Payment Sounds", paths: ["/System/Library/Audio/UISounds/payment_success.caf",
                                                                          "/System/Library/Audio/UISounds/payment_failure.caf"])
]

var controlCenter: [ZeroTweak] = [
    ZeroTweak(icon: "square", name: "Disable CC Blur", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesBackground.materialrecipe"]),
    ZeroTweak(icon: "minus.circle", name: "Disable CC(<17)", paths: ["/System/Library/PrivateFrameworks/ControlCenterServices.framework/ModuleAllowedList.plist"]),
    ZeroTweak(icon: "circle.grid.2x2", name: "Disable CC Module Background(May not work)", paths:
                ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesSheer.descendantrecipe"]),
    
    ZeroTweak(icon: "sun.min", name: "Disable Brightness Icon", paths: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/main.caml"]),
    ZeroTweak(icon: "moon", name: "Disable Focus Icon", paths: ["/System/Library/PrivateFrameworks/FocusUI.framework/dnd_cg_02.ca/main.caml"]),
    ZeroTweak(icon: "rectangle.3.offgrid", name: "Disable Connectivity CC Module", paths: ["/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/Info.plist"]),
    ZeroTweak(icon: "airplane.circle", name: "Disable Airplane Submodule(>18)", paths: ["/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/Assets.car"]),
    ZeroTweak(icon: "playpause", name: "Disable Media Control CC Module", paths: ["/System/Library/ControlCenter/Bundles/MediaControlsModule.bundle/Info.plist"]),
    ZeroTweak(icon: "sun.max", name: "Disable Brightness Slider CC Module", paths: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Info.plist"]),
    ZeroTweak(icon: "speaker", name: "Disable Volume Slider CC Module", paths:
        ["/System/Library/ControlCenter/Bundles/MediaControlsAudioModule.bundle/Info.plist"]),
    ZeroTweak(icon: "rectangle", name: "Disable Screen Mirroring CC Module", paths:
        ["/System/Library/ControlCenter/Bundles/AirPlayMirroringModule.bundle/Info.plist"]),
    ZeroTweak(icon: "lock.rotation", name: "Disable Orientation Lock CC Module", paths:
        ["/System/Library/ControlCenter/Bundles/OrientationLockModule.bundle/Info.plist"]),
    ZeroTweak(icon: "moon.fill", name: "Disable Focus CC Module", paths: ["/System/Library/ControlCenter/Bundles/ConnectivityModule.bundle/Info.plist"]),
]

var localizationKeys: [ZeroTweak] = [
    ZeroTweak(icon: "person.crop.circle", name: "Enable for Memoji Editor", paths: ["/System/Library/PrivateFrameworks/AvatarKit.framework/memoji_editor.loctable",
                                                                                           ]),
    
    ZeroTweak(icon: "gearshape", name: "Enable for Settings", paths:
                    ["/System/Library/PrivateFrameworks/Settings/SoundsAndHapticsSettings.framework/Sounds.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ColorSchedule.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ColorTemperature.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/DeviceAppearanceSchedule.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/Display.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/ExternalDisplays.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/FineTune.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/LargeFontsSettings.loctable",
                     "/System/Library/PrivateFrameworks/Settings/DisplayAndBrightnessSettings.framework/Magnify.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/About.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/AutomaticContentDownload.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/BackupAlert.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/BackupInfo.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Date & Time.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/General.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/HomeButton-sshb.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Localizable.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/LOTX.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Matter.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/ModelNames.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Nfc.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Nfc.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Pointers.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Reset-Simulator.loctable",
                     "/System/Library/PrivateFrameworks/Settings/GeneralSettingsUI.framework/Reset.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Privacy.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Almanac-ALMANAC.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/AppleAdvertising.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/AppReport.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Dim-Sum.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Localizable.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Location Services.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/LocationServicesPrivacy.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/LockdownMode.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Privacy.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Restrictions.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Safety.loctable",
                     "/System/Library/PrivateFrameworks/Settings/PrivacySettingsUI.framework/Trackers.loctable",
                     "System/Library/PrivateFrameworks/SettingsFoundation.framework/CountryOfOriginAssembledIn.loctable" ]),
    ZeroTweak(icon: "lock", name: "Enable for LS Code Entry", paths: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/SpringBoardUIServices.loctable"]),
]

var dangerousTweaks: [ZeroTweak] = [
    ZeroTweak(icon: "exclamationmark.triangle", name: "Black Screen/Respring loop", paths: ["/System/Library/CoreServices/SystemVersion.plist"]),]

func dirtyZeroHide(path: String) {
    do {
        try zeroPoC(path: path)
    } catch {
        Alertinator.shared.alert(title: "Exploit Failed", body: "There was an error while running the exploit: \(error).")
    }
}

struct ContentView: View {
    let device = Device.current
    @AppStorage("enabledTweaks") private var enabledTweakIds: [String] = []
    @State private var showFloatingLog = false
    @State private var pipOffset = CGSize(width: 20, height: 100)
    @State private var lastDragOffset = CGSize.zero
    @State private var hasShownWelcome = false
    @State private var customZeroPath: String = ""
    @State private var addedCustomPaths: [String] = []
    @State private var showColorPicker = false
    @AppStorage("accentColorComponents") private var accentColorData: Data = try! JSONEncoder().encode(ColorComponents(color: .orange))

    var currentAccentColor: Color {
        (try? JSONDecoder().decode(ColorComponents.self, from: accentColorData))?.color ?? .accentColor
    }
    
    struct ColorComponents: Codable {
        var red: Double
        var green: Double
        var blue: Double
        var alpha: Double

        var color: Color {
            Color(red: red, green: green, blue: blue, opacity: alpha)
        }

        init(color: Color) {
            let uiColor = UIColor(color)
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
            self.red = Double(r)
            self.green = Double(g)
            self.blue = Double(b)
            self.alpha = Double(a)
        }
    }
    
    func isUsingDefaultAccentColor() -> Bool {
        let defaultColor = ColorComponents(color: .orange)
        if let current = try? JSONDecoder().decode(ColorComponents.self, from: accentColorData) {
            return current.red == defaultColor.red &&
                   current.green == defaultColor.green &&
                   current.blue == defaultColor.blue &&
                   current.alpha == defaultColor.alpha
        }
        return true
    }
 
    var revertButtonColor: Color {
        isUsingDefaultAccentColor() ? .red : currentAccentColor.brighten(by: 0.4)
    }

    
    private var tweaks: [ZeroTweak] {
        springBoard + lockScreen + systemWideCustomization + soundEffects + controlCenter + localizationKeys + dangerousTweaks
    }
    
    private var enabledTweaks: [ZeroTweak] {
        tweaks.filter { tweak in enabledTweakIds.contains(tweak.id) }
    }
    
    private func isTweakEnabled(_ tweak: ZeroTweak) -> Bool {
        enabledTweakIds.contains(tweak.id)
    }
    
    private func toggleTweak(_ tweak: ZeroTweak) {
        if isTweakEnabled(tweak) {
            enabledTweakIds.removeAll { $0 == tweak.id }
        } else {
            enabledTweakIds.append(tweak.id)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                VStack {
                    List {
                        
                        Section(header: HStack {
                            Image(systemName: "terminal")
                            Text("Logs")
                        }, footer: VStack(alignment: .leading) {
                            Text("(ZeroCalories ONLY supports iOS/iPadOS 18.3.2 and lower!)\n\nAll tweaks are done in memory, so if something goes wrong, you can reboot or force reboot to revert changes(https://support.apple.com/guide/iphone/force-restart-iphone-iph8903c3ee6/ios).\n\nExploit discovered by Ian Beer of Google Project Zero. Created by the jailbreak.party team. Improved by @c4ndyf1sh.\n\nTo respring, check https://github.com/C4ndyF1sh/ZeroCalories?tab=readme-ov-file#how-can-i-respring-after-i-apply-the-changes or sideload this .ipa file (does NOT work with LiveContainer) https://github.com/C4ndyF1sh/ZeroCalories/blob/main/respringapp.ipa\n\nApp Version: 0.4.0")
                            Text("[Join My Discord Server! :) ](https://discord.gg/WFZZRGC9Ar)")
                                .foregroundStyle(.accent)
                        }) {
                            if !showFloatingLog {
                                LogView()
                                    .frame(width: 340, height: 260)
                                    .onAppear(perform: {
                                        if !hasShownWelcome {
                                            print("[*] Welcome to ZeroCalories!\n[*] Running on \(device.systemName!) \(device.systemVersion!), \(device.description)")
                                            hasShownWelcome = true
                                        }
                                    })
                                    .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            }
                            
                            Button(action: {
                                withAnimation {
                                    showFloatingLog.toggle()
                                }
                            }) {
                                Label(
                                    showFloatingLog ? "Collapse PIP" : "Enable PIP",
                                    systemImage: showFloatingLog ? "rectangle" : "rectangle.inset.filled.and.person.filled"
                                )
                            }
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "house")
                            Text("SpringBoard & BackBoard")
                        }) {
                            VStack {
                                ForEach(springBoard) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "lock")
                            Text("Lock Screen")
                        }) {
                            VStack {
                                ForEach(lockScreen) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor)
                                                    .tint(currentAccentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        } .foregroundStyle(currentAccentColor)
                                        .tint(currentAccentColor)
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        } .tint(currentAccentColor)
                        
                        Section(header: HStack {
                            Image(systemName: "gear")
                            Text("Systemwide Customization")
                        }) {
                            VStack {
                                ForEach(systemWideCustomization) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "speaker.wave.2")
                            Text("Sound Effects")
                        }) {
                            VStack {
                                ForEach(soundEffects) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "square.grid.2x2")
                            Text("Control Center")
                        }) {
                            VStack {
                                ForEach(controlCenter) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "key")
                            Text("Internal Localization Keys")
                        }) {
                            VStack {
                                ForEach(localizationKeys) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "exclamationmark.triangle")
                            Text("Dangerous")
                        }) {
                            VStack {
                                ForEach(dangerousTweaks) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(currentAccentColor) .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: currentAccentColor, fullWidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "folder.fill")
                            Text("Filesystem Viewer")
                        }) {
                            NavigationLink(destination: FileBrowserView(url: URL(fileURLWithPath: "/"))) {
                                Label("Browse iOS/iPadOS Filesystem", systemImage: "externaldrive")
                            }
                        }

                        Section(header: HStack {
                            Image(systemName: "gear")
                            Text("Custom Tweaks")
                            
                        }) {
                            VStack {
                                TextField("File Path", text: $customZeroPath)
                                    .padding(.bottom, 10)
                                
                                Button(action: {
                                    dirtyZeroHide(path: customZeroPath)
                                }) {
                                    HStack {
                                        Image(systemName: "plus.circle")
                                        Text("Apply Custom Tweak")
                                    } .foregroundStyle(currentAccentColor) }
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                                .background(customZeroPath.isEmpty ? .accent.opacity(0.06) : .accent.opacity(0.2))
                                .background(.ultraThinMaterial)
                                
                                .foregroundStyle(currentAccentColor) .cornerRadius(80)
                                .foregroundStyle(customZeroPath.isEmpty ? .accent.opacity(0.7) : .accent)
                                .disabled(customZeroPath.isEmpty)
                            }
                            
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .safeAreaInset(edge: .bottom) {
                        VStack {
                            HStack {
                                Button(action: {
                                    var applyingString = "[*] Applying the selected tweaks: "
                                    let tweakNames = enabledTweaks.map { $0.name }.joined(separator: ", ")
                                    applyingString += tweakNames
                                    
                                    print(applyingString)
                                    
                                    for tweak in enabledTweaks {
                                        for path in tweak.paths {
                                            dirtyZeroHide(path: path)
                                        }
                                    }
                                    
                                    print("[!] All tweaks applied successfully!")
                                }) {
                                    HStack {
                                        Image(systemName: "checkmark.circle")
                                        Text("Apply")
                                    }
                                }
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                                .background(enabledTweaks.isEmpty ? currentAccentColor.opacity(0.06) : currentAccentColor.opacity(0.2))
                                .background(.ultraThinMaterial)
                                .cornerRadius(80)
                                .foregroundStyle(enabledTweaks.isEmpty ? currentAccentColor.opacity(0.7) : currentAccentColor)
                                .disabled(enabledTweaks.isEmpty)
                                
                                Button(action: {
                                    Alertinator.shared.alert(title: "Device Will Reboot", body: "To revert all tweaks, your device will now reboot. Tap OK to continue.", action: {
                                        dirtyZeroHide(path: "/usr/lib/dyld")
                                    })
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.counterclockwise.circle")
                                        Text("Revert (Reboot)")
                                    }
                                }
                                .padding(.vertical, 15)
                                .frame(maxWidth: .infinity)
                                .background(revertButtonColor.opacity(0.2))
                                .background(.ultraThinMaterial)
                                .cornerRadius(80)
                                .foregroundStyle(revertButtonColor)

                            }
                            .padding(.horizontal, 25)
                            .contextMenu {
                                Button {
                                    Alertinator.shared.prompt(title: "Custom Path", placeholder: "Path") { path in
                                        if let _ = path, !path!.isEmpty {
                                            dirtyZeroHide(path: path!)
                                        } else {
                                            Alertinator.shared.alert(title: "Invalid Path", body: "Enter a vaild path.")
                                        }
                                    }
                                } label: {
                                    Label("Custom Path", systemImage: "apple.terminal")
                                }
                                
                                Button {
                                    dirtyZeroHide(path: "/usr/lib/dyld")
                                } label: {
                                    Label("Panic", systemImage: "ant")
                                }
                            }
                        }
                        .padding(.top, 50)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.clear,
                                    Color(.systemBackground).opacity(1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                }
                .navigationTitle("ZeroCalories")
                
                .tint(currentAccentColor)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button("About") {
                                Alertinator.shared.alert(title: "ZeroCalories", body: "Created by the jailbreak.party team.\nImproved by @c4ndyf1sh.")
                                Haptic.shared.play(.heavy)
                            }

                            Toggle("Enable PIP Logs", isOn: $showFloatingLog)
                            
                            Button("Customize Accent Color") {
                                showColorPicker.toggle()
                                Haptic.shared.play(.heavy)
                            }

                            Button("Reset Accent Color") {
                                let defaultOrange = ColorComponents(color: .orange)
                                if let data = try? JSONEncoder().encode(defaultOrange) {
                                    accentColorData = data
                                    Haptic.shared.play(.heavy)
                                }
                            }

                        } label: {
                            Label("Settings", systemImage: "gear")
                        }
                    }
                }
                .sheet(isPresented: $showColorPicker) {
                    VStack {
                        ColorPicker("Pick an Accent Color", selection: Binding(
                            get: {
                                (try? JSONDecoder().decode(ColorComponents.self, from: accentColorData))?.color ?? .accentColor
                            },
                            set: { newColor in
                                if let data = try? JSONEncoder().encode(ColorComponents(color: newColor)) {
                                    accentColorData = data
                                }
                            }
                        ))
                        .padding()
                        .presentationDetents([.medium])
                    }
                }
                
                
            } .tint(currentAccentColor)
        }
        
        if showFloatingLog {
            LogView()
                .frame(width: 250, height: 150)
                .background(.ultraThinMaterial)
                .cornerRadius(40)
                .shadow(radius: 50)
                .offset(pipOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            pipOffset = CGSize(
                                width: lastDragOffset.width + value.translation.width,
                                height: lastDragOffset.height + value.translation.height
                            )
                        }
                        .onEnded { _ in
                            lastDragOffset = pipOffset
                        }
                )
        }
    }
}

// i skidded this stuff from cowabunga, sorry lemin.
struct MaterialView: UIViewRepresentable {
    let material: UIBlurEffect.Style

    init(_ material: UIBlurEffect.Style) {
        self.material = material
    }

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: material))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: material)
    }
}

struct TintedButton: ButtonStyle {
    var color: Color
    var material: UIBlurEffect.Style?
    var fullWidth: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            if fullWidth {
                configuration.label
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(material == nil ? AnyView(color.opacity(0.2)) : AnyView(MaterialView(material!)))
                    .cornerRadius(80)
                    .foregroundStyle(color)
            } else {
                configuration.label
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(material == nil ? AnyView(color.opacity(0.2)) : AnyView(MaterialView(material!)))
                    .cornerRadius(80)
                    .foregroundStyle(color)
            }
        }
    }
    
    init(color: Color = .blue, fullWidth: Bool = false) {
        self.color = color
        self.fullWidth = fullWidth
    }
    init(color: Color = .blue, material: UIBlurEffect.Style, fullWidth: Bool = false) {
        self.color = color
        self.material = material
        self.fullWidth = fullWidth
    }
}

struct FileBrowserView: View {
    let url: URL
    let textExtensions: Set<String> = [
        "txt", "md", "csv", "json", "xml", "yaml", "yml", "plist", "strings", "conf", "config", "ini", "log",
        "descendantrecipe", "materialrecipe", "visualstyleset", "loctable", "caml"
    ]

    @State private var contents: [URL] = []
    @State private var selectedFile: URL?
    @State private var isQuickLookPresented = false
    @State private var customPath: String = ""
    @State private var showInvalidPathAlert = false
    @State private var navPath = NavigationPath()
    @State private var sortAlphabetically: Bool = false
    @State private var customNavigationTrigger = false
    @State private var customTargetURL: URL?
    @State private var searchText: String = ""
    @State private var showColorPicker = false
    @AppStorage("accentColorComponents") private var accentColorData: Data = try! JSONEncoder().encode(ColorComponents(color: .accentColor))

    var currentAccentColor: Color {
        (try? JSONDecoder().decode(ColorComponents.self, from: accentColorData))?.color ?? .accentColor
    }
    
    struct ColorComponents: Codable {
        var red: Double
        var green: Double
        var blue: Double
        var alpha: Double

        var color: Color {
            Color(red: red, green: green, blue: blue, opacity: alpha)
        }

        init(color: Color) {
            let uiColor = UIColor(color)
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
            self.red = Double(r)
            self.green = Double(g)
            self.blue = Double(b)
            self.alpha = Double(a)
        }
    }
    
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 0) {
                List {
                    ForEach(filteredContents, id: \.self) { item in
                        if item.hasDirectoryPath {
                            NavigationLink(destination: FileBrowserView(url: item)) {
                                Label(folderLabel(for: item), systemImage: "folder")
                            }
                        } else {
                            Menu {
                                Button("View") {
                                    selectedFile = item
                                    isQuickLookPresented = true
                                }
                                Button("Share") {
                                    shareFile(item)
                                }
                                Button("Copy Path") {
                                    UIPasteboard.general.string = item.path
                                }
                                Button("Zero Out") {
                                    print("[DEBUG] Zeroing out: \(item.path)")
                                    dirtyZeroHide(path: item.path)
                                }
                            } label: {
                                Label(item.lastPathComponent, systemImage: "doc")
                            }
                        }
                    }
                }

                VStack(spacing: 8) {
                    Divider()
                    Text("🔒 = No permission, ❌ = Readable but empty")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text(url.path)
                                .font(.caption)
                                .lineLimit(1)
                                .padding(.horizontal, 4)
                        }
                        Button {
                            UIPasteboard.general.string = url.path
                        } label: {
                            Image(systemName: "doc.on.doc")
                                .padding(.trailing, 8)
                        }
                    }

                    HStack {
                        TextField("Enter custom path", text: $customPath)
                            .textFieldStyle(.roundedBorder)
                        Button("Go") {
                            let trimmedPath = customPath.trimmingCharacters(in: .whitespacesAndNewlines)
                            let target = URL(fileURLWithPath: trimmedPath)
                            var isDir: ObjCBool = false

                            if FileManager.default.fileExists(atPath: target.path, isDirectory: &isDir) {
                                if isDir.boolValue {
                                    customTargetURL = target
                                    customNavigationTrigger = true
                                } else {
                                    selectedFile = target
                                    isQuickLookPresented = true
                                }
                            } else {
                                showInvalidPathAlert = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .padding(.bottom, 10)
                .background(.ultraThinMaterial)

                NavigationLink(
                    destination: FileBrowserView(url: customTargetURL ?? url),
                    isActive: $customNavigationTrigger
                ) {
                    EmptyView()
                }
                .hidden()
                .tint(currentAccentColor)
            }
            .navigationTitle(url.lastPathComponent)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search files and folders in this directory")
            
            .tint(currentAccentColor)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Toggle("Sort Alphabetically", isOn: $sortAlphabetically)
                            .onChange(of: sortAlphabetically) { _ in
                                loadDirectory()
                            }
                        Button("About") {
                            Alertinator.shared.alert(
                                title: "ZeroCalories",
                                body: "Created by the jailbreak.party team.\nImproved by @c4ndyf1sh."
                            )
                        }
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
            } .tint(currentAccentColor)
            
            .onAppear(perform: loadDirectory)
            .sheet(isPresented: $isQuickLookPresented) {
                if let selectedFile = selectedFile {
                    if textExtensions.contains(selectedFile.pathExtension.lowercased()) {
                        TextPreviewView(fileURL: selectedFile)
                    } else {
                        QuickLookPreview(url: selectedFile)
                    }
                }
            }
            .alert("Invalid Path", isPresented: $showInvalidPathAlert) {
                Button("OK", role: .cancel) { }
            }
            .navigationDestination(for: URL.self) { targetURL in
                FileBrowserView(url: targetURL)
            }
        }
    }

    var filteredContents: [URL] {
        if searchText.isEmpty {
            return contents
        } else {
            return contents.filter { $0.lastPathComponent.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func folderLabel(for url: URL) -> String {
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            let visible = contents.filter { !$0.lastPathComponent.hasPrefix(".") }
            return url.lastPathComponent + (visible.isEmpty ? " ❌" : "")
        } catch {
            print("[WARN] Can't read \(url.path): \(error)")
            return url.lastPathComponent + " 🔒"
        }
    }

    func loadDirectory() {
        do {
            var items = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            if sortAlphabetically {
                items.sort { $0.lastPathComponent.lowercased() < $1.lastPathComponent.lowercased() }
            }
            contents = items
        } catch {
            print("Failed to load directory: \(error)")
        }
    }

    func copyToDocuments(_ file: URL) {
        let dest = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(file.lastPathComponent)
        do {
            try FileManager.default.copyItem(at: file, to: dest)
            print("Copied to Documents")
        } catch {
            print("Copy failed: \(error)")
        }
    }

    func shareFile(_ file: URL) {
        let activityVC = UIActivityViewController(activityItems: [file], applicationActivities: nil)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            rootVC.present(activityVC, animated: true)
        }
    }
}

struct QuickLookPreview: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(_ controller: QLPreviewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(url: url)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let url: URL

        init(url: URL) {
            self.url = url
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int { 1 }

        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            url as QLPreviewItem
        }
    }
}

struct TextPreviewView: View {
    let fileURL: URL
    @State private var fileContent: String = "Loading..."

    var body: some View {
        ScrollView {
            Text(fileContent)
                .padding()
                .font(.system(.body, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(fileURL.lastPathComponent)
        .onAppear {
            loadFileContent()
        }
    }

    //loadFileContent function
    func loadFileContent() {
        // Try to read the file as plain text
        if let plainText = try? String(contentsOf: fileURL, encoding: .utf8) {
            self.fileContent = plainText
            return
        }

        do {
            let data = try Data(contentsOf: fileURL)
            let plistObject = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)

            if let dict = plistObject as? [String: Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [.prettyPrinted])
                self.fileContent = String(data: jsonData, encoding: .utf8) ?? "Couldn't format dictionary."
            } else if let array = plistObject as? [Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: array, options: [.prettyPrinted])
                self.fileContent = String(data: jsonData, encoding: .utf8) ?? "Couldn't format array."
            } else {
                self.fileContent = "Plist is not a dictionary or array."
            }

        } catch {
            self.fileContent = "Unable to preview file:\n\n\(error.localizedDescription)"
        }
    }
}

extension Color {
    func brighten(by percentage: Double) -> Color {
        let uiColor = UIColor(self)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        return Color(
            red: min(Double(r) * (1 + percentage), 1.0),
            green: min(Double(g) * (1 + percentage), 1.0),
            blue: min(Double(b) * (1 + percentage), 1.0),
            opacity: Double(a)
        )
    }
}

#Preview {
    ContentView()
}
