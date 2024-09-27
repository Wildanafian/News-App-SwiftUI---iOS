//
//  SplashView.swift
//  News App
//
//  Created by Wildan Nafian on 9/24/24.
//

import SwiftUI

struct SplashView: View {

    @State private var scale = 0.7
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            VStack {
                Image("SplashLogo")
                    .resizable()
                    .frame(
                        width: 350,
                        height: 350
                    )
            }
            .scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.5)) {
                    self.scale = 1.5
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.redSplash)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isActive: .constant(true))
    }
}
