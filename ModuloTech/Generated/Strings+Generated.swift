// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// All
  internal static let all = L10n.tr("Localizable", "all")
  /// Cancel
  internal static let cancel = L10n.tr("Localizable", "cancel")
  /// Delete
  internal static let delete = L10n.tr("Localizable", "delete")
  /// Are you sure to remove this device ?
  internal static let deleteDeviceHint = L10n.tr("Localizable", "deleteDeviceHint")
  /// Device deleted successfully
  internal static let deleteDeviceSuccess = L10n.tr("Localizable", "deleteDeviceSuccess")
  /// Heaters
  internal static let heaters = L10n.tr("Localizable", "heaters")
  /// Lights
  internal static let lights = L10n.tr("Localizable", "lights")
  /// Off
  internal static let off = L10n.tr("Localizable", "off")
  /// On
  internal static let on = L10n.tr("Localizable", "on")
  /// Roller shutters
  internal static let rollerShutters = L10n.tr("Localizable", "rollerShutters")
  /// Yes
  internal static let yes = L10n.tr("Localizable", "yes")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
