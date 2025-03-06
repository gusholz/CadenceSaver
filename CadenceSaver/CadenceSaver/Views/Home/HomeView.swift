//
//  ContentView.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel(progressionManager: ProgressionManager.shared)
    @State private var isSheetActive = false;

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Bem vindo Gustavo")
                    .fontWeight(.black)
                Spacer()
            }
            Divider()
            if viewModel.progressionList.isEmpty {
                Text("Nenhuma progressão salva :c")
            } else {
                ForEach(viewModel.progressionList, id: \.id) { progression in
                    ProgressionCard(progression: progression)
                }
            }
            Spacer()
            CustomButton(buttonLabel: "Adicionar Progressão") {
                isSheetActive = true;
            }
            .sheet(isPresented: $isSheetActive) {
                AddProgressionView(homeViewModel: viewModel)
            }
        }
        .onAppear {
            viewModel.updateList()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
