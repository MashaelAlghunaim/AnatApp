//
//  BreathingView.swift
//  AnatApp
//
//  Created by Sarah Sheikh on 25/02/2023.
//

import SwiftUI

struct BreathingView: View {
    var body: some View {
        ZStack{
            Loading()
            VStack {
                Text("Anat")
                    .font(.largeTitle)
                    .foregroundColor(Color("blue"))
                
            }
            .padding(.top, 380)
        }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}

struct Loading : View {
    @State var animate = false
    var body : some View {
        ZStack{
            ForEach(1...8,id: \.self){index in
                Circle()
                                .fill(Color("blue").gradient.opacity(0.3))
                                .frame(width: 150, height: 150)
                                .scaleEffect(self.animate ? 1:0)
                                // 150 / 9 -> 75
                                .offset(x: 75)
                                .rotationEffect(.init(degrees: Double(index) * 45))
            }
                                .onAppear {
                                    self.animate.toggle()
                                }
                                .animation(Animation.linear(duration: 2.9).repeatForever(autoreverses: true))
            
        }
    }
}
