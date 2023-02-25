//
//  Let’sbreath.swift
//  Anatt
//
//  Created by Sarah Sheikh on 13/02/2023.
//

import SwiftUI

struct Let_sbreath: View {
    var body: some View {
        ZStack{
            Loading()
            VStack{
                Text("Let’s breath together")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 450)
                    .foregroundColor(Color("Blue"))
                
                Text("Okay")
                    .font(.title)
                    .frame(width:291, height: 48)
                    .foregroundColor(.white)
                    .background(Color("Blue"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))            }
            
        }
       
        }
    }
    


struct Let_sbreath_Previews: PreviewProvider {
    static var previews: some View {
        Let_sbreath()
    }
}
struct Letsbreath : View {
    @State var animate = false
    var body : some View {
        ZStack{
            ForEach(1...8,id: \.self){index in
                Circle()
                                .fill(Color("Blue").gradient.opacity(0.3))
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

