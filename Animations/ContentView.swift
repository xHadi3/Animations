//
//  ContentView.swift
//  Animations
//
//  Created by Hadi Al zayer on 28/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    var letters = Array("Hello Swift")
    @State private var enabled = true
    var body: some View {
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
        
        
        
    }
}

#Preview {
    ContentView()
}
