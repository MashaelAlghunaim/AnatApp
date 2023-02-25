//
//  AddNoteView.swift
//  AnatApp
//
//  Created by Aljwhra Alnasser on 25/02/2023.
//

import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.dismiss) var dismiss
    
    //MARK: Note Values
    
    @State var noteTitle: String = ""
    @State var noteDescription: String = ""
    @State var noteDate: Date = Date()
    
    //MARK: Core Data Context
    @Environment(\.managedObjectContext) var context
    
    @EnvironmentObject var dateModel: DateViewModel
    
    var body: some View {
        
        NavigationView{
            
            List{
                
                Section{
                    
                    TextField("write something... ", text: $noteTitle)
                    
                } header: {
                    Text("Note Title")
                    
                }
                
                Section{
                    TextField("write something... ", text: $noteDescription)
                    
                } header: {
                    Text("Note Description")
                }
                
                // Disabling Date For Edit Mode
                
                
                if dateModel.editNote == nil {
                    
                    Section{
                        DatePicker("", selection: $noteDate)
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                        
                    } header: {
                        Text("Note Date")
                    }
                    
                }
                
                
                
            }
            .foregroundColor(Color("Blue"))
            .listStyle(.insetGrouped)
            .navigationTitle("Note")
            //.navigationBarTitleDisplayMode(.inline)
            //MARK: Disbaling Dismiss on Swipe
            .interactiveDismissDisabled()
            // MARK: Action Buttons
            .toolbar{
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        dismiss()
                        
                    },label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20 , height: 20)
                            .foregroundColor(Color("Blue"))
                        
                    })
                }
            }
            
            .overlay(
                Button(action: {
               
                    if let note = dateModel.editNote{
                        note.noteTitle = noteTitle
                        note.noteDescription = noteDescription
                        
                    }
                    else{
                        
                        let note = NotesEntity(context: context)
                        note.noteTitle = noteTitle
                        note.noteDescription = noteDescription
                        note.noteDate = noteDate
                    }
                    // saving
                    try? context.save()
                    
                    // Dismissing View
                    
                    dismiss()
                    
                },label:{
                    Text("Save")
                        .frame(maxWidth: 350 , maxHeight: 48)
                        
                    
                })
                
                .foregroundColor(.white)
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding()
                .disabled(noteTitle == "" || noteDescription == "" )
                
                ,alignment: .bottom
                
            )
            
            // Loading Note date from edite
            
            .onAppear{
                if let note = dateModel.editNote{
                    noteTitle = note.noteTitle ?? ""
                    noteDescription = note.noteDescription ?? ""
                }
                    
            }
        }
        
        
    }
    
}



//struct AddNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNoteView()
//    }
//}
