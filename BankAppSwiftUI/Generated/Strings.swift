// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Login {
    internal enum Button {
      /// Login Here
      internal static let text = L10n.tr("Localizable", "login.button.text", fallback: "Login Here")
    }
    internal enum Title {
      /// Localizable.strings
      ///   BankAppSwiftUI
      /// 
      ///   Created by Ronaldo Andre on 18/12/23.
      internal static let text = L10n.tr("Localizable", "login.title.text", fallback: "First time login?")
    }
    internal enum Title2 {
      /// Already registered?
      internal static let text = L10n.tr("Localizable", "login.title2.text", fallback: "Already registered?")
    }
  }
  internal enum Register {
    internal enum Modal {
      internal enum Empresa {
        /// Empresa
        internal static let text = L10n.tr("Localizable", "register.modal.Empresa.text", fallback: "Empresa")
      }
      internal enum Luz {
        /// Luz
        internal static let text = L10n.tr("Localizable", "register.modal.Luz.text", fallback: "Luz")
      }
      internal enum Retail {
        /// Retail
        internal static let text = L10n.tr("Localizable", "register.modal.Retail.text", fallback: "Retail")
      }
      internal enum Telecomunicacion {
        /// Telecomunicacion
        internal static let text = L10n.tr("Localizable", "register.modal.Telecomunicacion.text", fallback: "Telecomunicacion")
      }
      internal enum Telefono {
        /// Telefono
        internal static let text = L10n.tr("Localizable", "register.modal.Telefono.text", fallback: "Telefono")
      }
      internal enum Debit {
        /// Register with my debit card
        internal static let text = L10n.tr("Localizable", "register.modal.debit.text", fallback: "Register with my debit card")
      }
      internal enum Dni {
        /// Register with my DNI and selfie
        internal static let text = L10n.tr("Localizable", "register.modal.dni.text", fallback: "Register with my DNI and selfie")
      }
      internal enum IrWeb {
        /// Ir a la web
        internal static let text = L10n.tr("Localizable", "register.modal.irWeb.text", fallback: "Ir a la web")
      }
      internal enum OtrosPagos {
        /// Otros pagos
        internal static let text = L10n.tr("Localizable", "register.modal.otrosPagos.text", fallback: "Otros pagos")
      }
      internal enum PagarServicios {
        /// Pagar servicios
        internal static let text = L10n.tr("Localizable", "register.modal.pagarServicios.text", fallback: "Pagar servicios")
      }
      internal enum Pagos {
        internal enum Terceros {
          /// Pagar prestamos a terceros
          internal static let text = L10n.tr("Localizable", "register.modal.pagos.terceros.text", fallback: "Pagar prestamos a terceros")
        }
      }
      internal enum ServicioQueDesea {
        /// Elige el servicio que desea
        internal static let text = L10n.tr("Localizable", "register.modal.servicioQueDesea.text", fallback: "Elige el servicio que desea")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
