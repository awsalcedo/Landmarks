//
//  ContentView.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData()) //Actualice la vista previa de ContentView para agregar el objeto modelo al entorno, lo que hace que el objeto esté disponible para cualquier subvista.
}
