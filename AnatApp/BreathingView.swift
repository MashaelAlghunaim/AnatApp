//
//  Let’sbreath.swift
//  Anatt
//
//  Created by Sarah Sheikh on 13/02/2023.
//

import SwiftUI

struct BreathingView: View {
    @State var isPrsnt = false
    var body: some View {
        NavigationView{
            ZStack{
                Loading1()
                VStack{
                    
                    
                    NavigationLink {
                        Settings()
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color("blue"))
                       
                    }
                    .offset(x: -150, y: 30)
//                    Button(action: {
//                        isPrsnt = true
//                    },
//                           label:{ Text( "Start")
//                            .bold()
//                            .foregroundColor(Color("blue"))
//
//                    })
//                    .offset(x: 150, y: -10)
//                    .fullScreenCover(isPresented: $isPrsnt){
//                        groundingPage()
//                    }
                    
                    Text("Let’s breath together")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("blue"))
                    
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    NavigationLink {
                        groundingPage()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("start")
                    }
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("blue"))
                    .offset(y: -100)


                   
                        
                    
                }
            }
        }
        
    }
}



struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}

struct Loading1 : View {
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
