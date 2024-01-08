//
//  RecetasGRDBDataSource.swift
//  IngredientesStoryboard
//
//  Created by Carlos Vargas on 7/01/24.
//

import Foundation
import GRDB
import Combine

var dbQueue: DatabaseQueue!

class BankGRDB {
    
    let insertadoPublicador = PassthroughSubject<String,Error>()
    let obtenerPublicador = PassthroughSubject<[UsuarioEntity], Error>()
    
    // iOS 16
    @available(iOS 16, *)
    func inicializadorBaseDeDatosiOS16() {
        let fileManager = FileManager.default
        let dataBaseURL = try! fileManager
            .url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appending(path: "database.sqlite")
        
        let dataBasePath = dataBaseURL.path()
        
        dbQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    // iOS 14
    func inicializadorBaseDeDatosiOS14() {
        let fileManager = FileManager.default
        let documentsURL = fileManager
            .urls(
                for: .documentDirectory,
                in: .userDomainMask
            )[0]
        let fileURL = documentsURL.appendingPathComponent("db.sqlite")
        let dataBasePath = fileURL.path
        
        dbQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    func crearTableDeUsuario() {
        do {
            try dbQueue.write({ database in
                try database.create(table: "UsuarioEntity", body: { tableDefinition in
                    tableDefinition.primaryKey("id", .integer)
                    tableDefinition.column("title", .text).notNull()
                    tableDefinition.column("image", .text).notNull()
                })
            })
            
        } catch let error {
            print("*******ERROR EN LA CREACION DE TABLA*****")
            print(error)
        }
    }
    
    // MARK: Operaciones con la base de datos
    func insertUserIntTable(idDeComida: Int, tituloDeComida:String, imagenDeComida: String) {
        let recetaEntity = UsuarioEntity(
            id: idDeComida,
            title: tituloDeComida,
            image: imagenDeComida
        )
        
        do {
            try dbQueue.write({ database in
                try recetaEntity.insert(database)
                insertadoPublicador.send("Se inserto Correctamente")
            })
        } catch let error {
            insertadoPublicador.send(completion: .failure(error))
        }
    }
    
    func ordenarTraerUsuariosBaseDeDatos() {
        let usuariosEntity: [UsuarioEntity] = try! dbQueue.read({ database in
            try UsuarioEntity.fetchAll(database)
        })
        obtenerPublicador.send(usuariosEntity)
    }
    
}
