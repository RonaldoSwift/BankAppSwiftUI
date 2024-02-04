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
  internal enum Pay {
    internal enum Service {
      internal enum Empresa {
        /// Company
        internal static let text = L10n.tr("Localizable", "pay.service.empresa.text", fallback: "Company")
      }
      internal enum Horario {
        /// This operation can be performed during the following hours: 09:00 a.m. to 09:00 p.m.
        internal static let text = L10n.tr("Localizable", "pay.service.horario.text", fallback: "This operation can be performed during the following hours: 09:00 a.m. to 09:00 p.m.")
      }
      internal enum Luz {
        /// Light
        internal static let text = L10n.tr("Localizable", "pay.service.luz.text", fallback: "Light")
      }
      internal enum PagarServicioRapido {
        /// Pay your bill fast and easy
        internal static let text = L10n.tr("Localizable", "pay.service.pagarServicioRapido.text", fallback: "Pay your bill fast and easy")
      }
      internal enum Recibos {
        /// Search my receipts
        internal static let text = L10n.tr("Localizable", "pay.service.recibos.text", fallback: "Search my receipts")
      }
      internal enum Servicio {
        /// Service
        internal static let text = L10n.tr("Localizable", "pay.service.servicio.text", fallback: "Service")
      }
      internal enum Suministro {
        /// Enter the supply
        internal static let text = L10n.tr("Localizable", "pay.service.suministro.text", fallback: "Enter the supply")
      }
      internal enum WebService {
        internal enum Electro {
          internal enum Noro {
            internal enum East {
              /// Electro Noro East
              internal static let text = L10n.tr("Localizable", "pay.service.webService.electro.Noro.East.text", fallback: "Electro Noro East")
            }
          }
          internal enum Puno {
            /// Electro Puno
            internal static let text = L10n.tr("Localizable", "pay.service.webService.electro.Puno.text", fallback: "Electro Puno")
          }
        }
        internal enum ElectroCenter {
          /// Electro Center
          internal static let text = L10n.tr("Localizable", "pay.service.webService.electroCenter.text", fallback: "Electro Center")
        }
        internal enum Enel {
          /// Enel
          internal static let text = L10n.tr("Localizable", "pay.service.webService.enel.text", fallback: "Enel")
        }
        internal enum Hydrandina {
          /// Hydrandina
          internal static let text = L10n.tr("Localizable", "pay.service.webService.hydrandina.text", fallback: "Hydrandina")
        }
        internal enum Sello {
          /// Sello
          internal static let text = L10n.tr("Localizable", "pay.service.webService.sello.text", fallback: "Sello")
        }
        internal enum South {
          internal enum Light {
            /// South Light
            internal static let text = L10n.tr("Localizable", "pay.service.webService.south.Light.text", fallback: "South Light")
          }
        }
      }
    }
  }
  internal enum Register {
    internal enum Modal {
      internal enum Empresa {
        /// Company
        internal static let text = L10n.tr("Localizable", "register.modal.Empresa.text", fallback: "Company")
      }
      internal enum Luz {
        /// Light
        internal static let text = L10n.tr("Localizable", "register.modal.Luz.text", fallback: "Light")
      }
      internal enum Retail {
        /// Retail
        internal static let text = L10n.tr("Localizable", "register.modal.Retail.text", fallback: "Retail")
      }
      internal enum Telecomunicacion {
        /// Telecommunication
        internal static let text = L10n.tr("Localizable", "register.modal.Telecomunicacion.text", fallback: "Telecommunication")
      }
      internal enum Telefono {
        /// Phone
        internal static let text = L10n.tr("Localizable", "register.modal.Telefono.text", fallback: "Phone")
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
        /// Go to the website
        internal static let text = L10n.tr("Localizable", "register.modal.irWeb.text", fallback: "Go to the website")
      }
      internal enum OtrosPagos {
        /// Other payments
        internal static let text = L10n.tr("Localizable", "register.modal.otrosPagos.text", fallback: "Other payments")
      }
      internal enum PagarServicios {
        /// Pay for services
        internal static let text = L10n.tr("Localizable", "register.modal.pagarServicios.text", fallback: "Pay for services")
      }
      internal enum Pagos {
        internal enum Terceros {
          /// Pay loans to third parties
          internal static let text = L10n.tr("Localizable", "register.modal.pagos.terceros.text", fallback: "Pay loans to third parties")
        }
      }
      internal enum ServicioQueDesea {
        /// Choose the service you wish to pay for
        internal static let text = L10n.tr("Localizable", "register.modal.servicioQueDesea.text", fallback: "Choose the service you wish to pay for")
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
