//
//  ContentView.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel = HomeViewModel(isEmpty: true)

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Bem vindo Gustavo")
                    .fontWeight(.black)
                Spacer()
            }
            Divider()
            if viewmodel.isEmpty {
                Text("Nenhuma progressão salva :c")
            }
            // Progression Card
            Spacer()
            CustomButton(buttonLabel: "Adicionar Progressão") {
                
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
