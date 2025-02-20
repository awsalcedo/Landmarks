//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import SwiftUI

/*
 Las listas funcionan con datos identificables. Puede hacer que sus datos sean identificables de dos maneras: pasando junto con sus datos una ruta clave a una propiedad que identifique de forma única cada elemento, 
 
 List(landmarks, id: \.id) { landmark in
     LandmarkRow(landmark: landmark)
 }
 
 
 o haciendo que su tipo de datos se ajuste al protocolo Identificable.
 
 List(landmarks) { landmark in
     LandmarkRow(landmark: landmark)
 }
 
 */

struct LandmarkList: View {
    /* 
     @Environment es una propiedad que se usa para leer valores del entorno en una vista. Es una forma de acceder a los valores que se han pasado a través de .environment().
     
     Recibimos el valor `ModelData` en la vista hija LandmarkList
     */
    @Environment(ModelData.self) var modelData
    
    /*
     Debido a que utiliza propiedades de estado para contener información específica de una vista y sus subvistas, siempre crea el estado como privado.
     */
    @State private var showFavoritesOnly = false
    
    /*
     Calcule una versión filtrada de la lista de puntos de referencia comprobando la propiedad showFavoritesOnly y cada valor de Landmark.isFavorite.
     */
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
                
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
