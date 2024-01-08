//
//  RecetaEntity.swift
//  ComidaYProducto
//
//  Created by Ronaldo on 7/01/24.
//

import Foundation
import GRDB

struct UsuarioEntity: Codable, FetchableRecord,PersistableRecord {
    let id: Int
    let title: String
    let image: String
}
