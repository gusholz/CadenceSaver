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
                List {
                    ForEach(viewModel.progressionList, id: \.id) { progression in
                        ProgressionCard(progression: progression)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    viewModel.deleteProgression(id: progression.id)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                
                                Button("Edit") {
                                    print("Awesome!")
                                }
                                .tint(.blue)
                                
                            }
                    }
                }
                .listStyle(.plain)
            }
            Spacer()
            CustomButton(buttonLabel: "Add Progression") {
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
