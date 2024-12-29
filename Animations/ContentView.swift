//
//  ContentView.swift
//  Animations
//
//  Created by Hadi Al zayer on 28/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me"){
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false)
                    ,value:  animationAmount)
            
        )
        .onAppear{
            animationAmount = 2
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
