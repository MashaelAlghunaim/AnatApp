//
//  SplashScreenView.swift
//  AnatApp
//
//  Created by Aljwhra Alnasser on 27/02/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        if isActive{
            Letsbreath()
        }else {
           
            VStack{
                VStack{
                   Image("1024")
                        .resizable()
                        //.fixedSize()
                        .frame(width:180, height: 170)
                       Text("Anat")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                        .bold()
                        .foregroundColor(.black.opacity(0.60))
                        
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.3)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            
        }
        
        
        
     
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
