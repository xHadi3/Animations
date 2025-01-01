//
//  ContentView.swift
//  Animations
//
//  Created by Hadi Al zayer on 28/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var letters = Array("Hello Swift")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = true
    @State private var animationAmount = 1.0
    @State private var secondAnimationAmount = 0.0
    
    var body: some View {
        Spacer()
        HStack(spacing: 0){
            ForEach(0..<letters.count, id: \.self){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .background(enabled ? .red : .blue)
                    .font(.title)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
        DragGesture()
            .onChanged {dragAmount = $0.translation}
            .onEnded { _ in
                dragAmount = .zero
                enabled.toggle()
            }
        )
        Spacer()
        HStack{
            Button("Tap me"){ }
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
                            ,value:  animationAmount
                        )
                    
                    
                )
            
            
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
            
            
        }
        Spacer()
        
        .onAppear{
            animationAmount = 2
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}

