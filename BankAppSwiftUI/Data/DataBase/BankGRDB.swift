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

class RecetasGRDBDataSource{
    
    static let insertadoPublicador = PassthroughSubject<String,Error>()
    static let obtenerPublicador = PassthroughSubject<Array<RecetaEntity>, Error>()
    
    //iOS 16
    @available(iOS 16, *)
    func inicializadorBaseDeDatosiOS16(){
        let fileManager = FileManager.default
        let dataBaseURL = try! fileManager
            .url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appending(path: "database.sqlite")
        
        let dataBasePath = dataBaseURL.path()
        
        dbQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    //iOS 14
    func inicializadorBaseDeDatosiOS14(){
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
    
    
    func crearTableDeReceta(){
        do{
            try dbQueue.write({ database in
                try database.create(table: "RecetaEntity", body: { tableDefinition in
                    tableDefinition.primaryKey("id", .integer)
                    tableDefinition.column("title", .text).notNull()
                    tableDefinition.column("image", .text).notNull()
                })
            })
            
        } catch let error{
            print("*******ERROR EN LA CREACION DE TABLA*****")
            print(error)
        }
    }
    
    // MARK: Operaciones con la base de datos
    func insertarRecetaEnLaTabla(idDeComida:Int, tituloDeComida:String, imagenDeComida: String){
        let recetaEntity = RecetaEntity(
            id: idDeComida,
            title: tituloDeComida,
            image: imagenDeComida
        )
        
        do{
            try dbQueue.write({ database in
                try recetaEntity.insert(database)
                RecetasGRDBDataSource.insertadoPublicador.send("Se inserto Correctamente")
            })
        } catch let error{
            RecetasGRDBDataSource.insertadoPublicador.send(completion: .failure(error))
        }
    }
    
    
    func obtenerReceta(){
        let recetasEntity: Array<RecetaEntity> = try! dbQueue.read({ database in
            try RecetaEntity.fetchAll(database)
        })
        RecetasGRDBDataSource.obtenerPublicador.send(recetasEntity)
    }
}
