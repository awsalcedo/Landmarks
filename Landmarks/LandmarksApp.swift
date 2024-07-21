//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    /*
     Actualice LandmarksApp para crear una instancia de modelo y proporciónela a ContentView usando el modificador de entorno (_:).

     Utilice el atributo @State para inicializar un objeto modelo de la misma manera que lo utiliza para inicializar propiedades dentro de una vista. Al igual que SwiftUI inicializa el estado en una vista solo una vez durante la vida útil de la vista, inicializa el estado en una aplicación solo una vez durante la vida útil de la aplicación.
     */
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            /*
             Es un modificador de vista que permite pasar valores a través de la jerarquía de vistas sin tener que inyectar explícitamente datos en cada vista hija. Es útil para compartir datos globales como temas, configuraciones de usuario o datos que necesitan ser accesibles por muchas vistas.
             */
                .environment(modelData)
        }
    }
}
