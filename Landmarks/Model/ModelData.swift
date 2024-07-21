//
//  ModelData.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import Foundation

/*
 Declare un nuevo tipo de modelo usando la macro Observable().

 SwiftUI actualiza una vista solo cuando cambia una propiedad observable y el cuerpo de la vista lee la propiedad directamente.
 */

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) 
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
