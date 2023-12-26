// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all

//
//  BankAppSwiftUIModels+mock.swift
//  BankAppSwiftUITests
//
//  Created by Sourcery on xx/xx/xx.
//

import Foundation

@testable import BankAppSwiftUI

// MARK: - Generated User

extension User {

    static func mock(
        street: String = "",
        city: String = "",
        state: String = "",
        homeNumber: Int = .random(in: 0..<100),
        postalCode: String = "00000-000"
    ) -> User {
        .init(
            street: street,
            city: city,
            state: state,
            homeNumber: homeNumber,
            postalCode: postalCode
        )
    }
}
