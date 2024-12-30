//
//  ContentView.swift
//  Animations
//
//  Created by Hadi Al zayer on 28/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var secondAnimationAmount = 0.0
    
    var body: some View {
        Spacer()
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
                    .easeIn(duration: 1)
                    .repeatForever(autoreverses: false)
                    ,value:  animationAmount)
            
        )
        Spacer()
        
        Button("Tap Me"){
            withAnimation(.spring(duration: 1, bounce: 0.5)){
                secondAnimationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(secondAnimationAmount),
         axis: (x: 1.0, y: 1.0, z: 0.0)
        )
        
        
        Spacer()
        
        .onAppear{
            animationAmount = 2
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
