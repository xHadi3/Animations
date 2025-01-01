//
//  ContentView.swift
//  Animations
//
//  Created by Hadi Al zayer on 28/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
   
    @State private var isShowingRed = false
    
    var body: some View {
        VStack{
            Button("Tap me"){
                isShowingRed.toggle()
            }
            
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
        }
    }
}

#Preview {
    ContentView()
}

