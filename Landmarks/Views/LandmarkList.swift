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
    var body: some View {
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
