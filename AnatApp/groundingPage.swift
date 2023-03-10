//
//  groundingPage.swift
//  Anat
//
//  Created by Mashael Alghunaim on 21/07/1444 AH.
//

import SwiftUI

struct groundingPage: View {
    
    @State var text = "5 things you can see"
    @State var mainText = "Look around you for..."
    @State var settings = "Settings"
    
    @State var isPrsnt = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack(spacing: 10){
                    
                    
                    Button(action: {
                        isPrsnt = true
                    },
                           label:{
                        Text( "Done")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("blue"))
                        
                    })
                    .offset(x: -150, y: -345)
                    .fullScreenCover(isPresented: $isPrsnt){
                       BreathingView()
                    }
                    
                }
                
                VStack{
                    Text(mainText)
                        .font(.title)
                        .foregroundColor(Color("blue"))
                        .bold()
                        .position(x: 200 ,y: 150)
                    Text(text)
                        .font(.title)
                        .foregroundColor(Color("blue"))
                        .bold()
                        .position(x: 200, y: -50)
                    
                    Loading1()
                        .position(x: 200, y: -80)
                    
                    
                }
                Spacer()
            }
            
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    text = "4 things you can touch"
                    
                }
            })
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10){
                    text =  "3 things you can hear"
                    
                }
            })
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                    text = "2 things you can smell"
                    
                }
            })
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 20){
                    text = "1 thing you can taste"
                    
                }
            })
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 25){
                    mainText = ""
                    text = "You did great!"
                    
                }
            })
        }
    }
}

struct groundingPage_Previews: PreviewProvider {
    static var previews: some View {
        groundingPage()
    }
}
