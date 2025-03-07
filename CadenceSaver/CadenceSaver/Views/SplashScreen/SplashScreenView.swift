//
//  SwiftUIView.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 07/03/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color("offWhite")
                .ignoresSafeArea()
            
            Image("clefVector")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
        }
    }
}

#Preview {
    SplashScreenView()
}
