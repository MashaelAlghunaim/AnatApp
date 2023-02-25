//
//  MainQuestionPage.swift
//  Anat
//
//  Created by Mashael Alghunaim on 18/07/1444 AH.
//

import SwiftUI

struct MainQuestionPage: View {
    
    @State private var showGroundingPage = false
    var body: some View {
        NavigationView{
            ZStack{
                HStack{
                    Ellipse().fill(Color("lightBlue")).frame(width: 10, height: 10)
                    Ellipse().fill(Color("lightBlue")).frame(width: 10, height: 10)
                    Ellipse().fill(Color("lightBlue")).frame(width: 10, height: 10)
                }.position(x: 40 , y: 30)
                Text("Can you count 3 things that you love?").font(.title).foregroundColor(Color("lightBlue")).bold().padding().position(x: 200 ,y: 200)
                Spacer()
                Spacer()
                Spacer()
                VStack(spacing: 5){
                    Button{
                        showGroundingPage = true
                    }
                    label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("lightBlue"),lineWidth:1)
                            .padding(.horizontal, 100)
                            .frame(width: 250,height: 50)
                            .overlay(
                                Text("Yes"))
                            .foregroundColor(Color.white)
                            .background(Color("lightBlue"))
                            .cornerRadius(10)
                    } 
                    NavigationLink("", destination:  groundingPage(), isActive: $showGroundingPage)
                    Button{
                        
                    } label: {
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("lightBlue"),lineWidth:1)
                            .frame(width: 250,height: 50)
                            .foregroundColor(Color("lightBlue"))
                            .overlay(
                                Text("No")).foregroundColor(Color("lightBlue"))
                            .cornerRadius(10)
                        
                    }
                }
            }
        }
    }
}

struct MainQuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        MainQuestionPage()
    }
}
