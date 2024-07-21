//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import SwiftUI

struct LandmarkDetail: View {
    /*
     @Environment este atributo se utiliza en vistas que están más abajo en la jerarquía de vistas para recibir datos de vistas que están más arriba, en este caso de la LandmarkList
     */
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    /*
     Calcule el índice del punto de referencia de entrada comparándolo con los datos del modelo.
     */
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        
        /*
         Dentro de la propiedad del cuerpo, agregue los datos del modelo usando un contenedor Bindable. Incruste el nombre del punto de referencia en un HStack con un nuevo botón favorito; proporcione un enlace a la propiedad isFavorite con el signo de dólar ($).

         Utilice LandmarkIndex con el objeto modelData para asegurarse de que el botón actualice la propiedad isFavorite del punto de referencia almacenado en su objeto modelo.
         */
        
        /*
         @Bindable es un nuevo atributo introducido en Swift que facilita la conexión entre los datos y las vistas, simplificando el uso de datos observables dentro de las clases. Es particularmente útil cuando estás trabajando con clases y quieres exponer propiedades que pueden ser observadas por las vistas de SwiftUI.
         */
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                /*
                 Switch back to LandmarkList, and make sure the Live preview is on.

                 As you navigate from the list to the detail and tap the button, those changes persist when you return to the list. Because both views access the same model object in the environment, the two views maintain consistency.
                 */
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
