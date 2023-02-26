//
//  Settings.swift
//  Anat
//
//  Created by Ghayah Almadi on 08/02/2023.
//

import SwiftUI
import Contacts

 

struct Settings: View {
    @State private var showSheet = false
    
    //contact
    @State var showPicker = false
    @State var selectedContact: CNContact?
    
    //CalendarView
    @State var isPrsnt = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Button(action: {
                isPrsnt = true
            },label:{
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "calendar")
                        .font(.title)
                    Text("My History")
                        .foregroundColor(Color("blue"))
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("keep track of when and what happened")
                    .foregroundColor(.black)
            }
        })
            .fullScreenCover(isPresented: $isPrsnt){
                CalendarView()
            }
        .frame(width: 350 , height: 100)
        .background(Color("GrayA"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.vertical)
            
            
            
            Text("Settings")
                .font(.system(size: 24))
                .foregroundColor(Color("blue"))
                .padding(.top)
            
            
            
            
            Button {
                self.showPicker.toggle()
            }
        label: {
            HStack{
                Image(systemName: "phone")
                    .foregroundColor(Color("blue"))
                    .font(.title2)
                Text("Speed Dial")
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(selectedContact != nil ? "\((selectedContact?.familyName)!) \((selectedContact?.givenName)!)" : "".localized)
            }
            .sheet(isPresented: self.$showPicker) {
                ContactPickerView(showPicker: self.$showPicker, selectedContact: self.$selectedContact)
            
                
                
            }
            .padding()
            
        }
        .frame(width: 350 , height: 55, alignment: .leading)
        .background(Color("GrayA"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            
            Button {}
            
        label: {
            HStack{
                Image(systemName: "timer")
                    .foregroundColor(Color("blue"))
                    .font(.title2)
                Text("Breathing timer")
                    .foregroundColor(.black)
                    
                
            }
            .padding()
            
        }
        .contextMenu {
            
            Button {
                print("")
            } label: {
                Text("4,7,8")
            }
            
            Button {
                print("")
            } label: {
                Text("4,2,4")
            }
            
            Button {
                print("")
            } label: {
                Text("6,3,7")
            }
        }
            
        .frame(width: 350 , height: 55, alignment: .leading)
        .background(Color("GrayA"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            
            Text("Info")
                .font(.system(size: 24))
                .foregroundColor(Color("blue"))
                .padding(.top)
            
            
            Button {}
        label: {
            HStack{
                Image(systemName: "heart")
                    .foregroundColor(Color("blue"))
                    .font(.title2)
                Text("Share your breathing with Health")
                    .foregroundColor(.black)
                
            }
            .padding()
            
        }
        .frame(width: 350 , height: 55, alignment: .leading)
        .background(Color("GrayA"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            Button {
                showSheet = true
            }
        label: {
            HStack{
                Image(systemName: "info.circle")
                    .foregroundColor(Color("blue"))
                    .font(.title2)
                Text("About us")
                    .foregroundColor(.black)
                
            }
            .padding()
        }
        .frame(width: 350 , height: 55, alignment: .leading)
        .background(Color("GrayA"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
        //sheet/about us info
        .sheet(isPresented: $showSheet, content: {
                    Text("Hello")
                })
            
            
            Button {}
        label: {
            Text("Premium")
                .foregroundColor(.white)
                .font(.system(size: 24))
        }
        .frame(width: 350 , height: 55)
        .background(Color("blue"))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.vertical, 50)
            
            
            
        }//1st VStack end
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
