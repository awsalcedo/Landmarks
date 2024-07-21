//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 21/7/24.
//

import SwiftUI

struct FavoriteButton: View {
    /*
     Agregue un enlace isSet que indique el estado actual del botón y proporcione un valor constante para la vista previa.
     */
    @Binding var isSet: Bool
    
    var body: some View {
        
        /*
         Create a Button with an action that toggles the isSet state, and that changes its appearance based on the state.
         */
        Button {
            isSet.toggle()
        } label: {
            /*
             The title string that you provide for the button’s label doesn’t appear in the UI when you use the iconOnly label style, but VoiceOver uses it to improve accessibility.
             */
            
            Label("Toggle favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    /*
     El contenedor de propiedades de enlace le permite leer y escribir entre una propiedad que almacena datos y una vista que muestra y cambia los datos. Debido a que utiliza un enlace, los cambios realizados dentro de esta vista se propagan nuevamente a la fuente de datos.
     */
    FavoriteButton(isSet: .constant(true))
}
