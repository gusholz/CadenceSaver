//
//  CadenceSaverApp.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

@main
struct CadenceSaverApp: App {
    @State private var splashScreenIsActive: Bool = true

    var body: some Scene {
        WindowGroup {
            if splashScreenIsActive {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                            self.splashScreenIsActive = false
                        }
                    }
            } else {
                HomeView()
            }
        }
    }
}
