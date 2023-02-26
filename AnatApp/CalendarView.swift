//
//  CalendarView.swift
//  AnatApp
//
//  Created by Aljwhra Alnasser on 25/02/2023.
//





import SwiftUI

struct CalendarView: View {
    
    
    @StateObject var dateModel: DateViewModel = DateViewModel()
    @Namespace var animation
    
    
    // MARK: Core Data Context
    @Environment(\.managedObjectContext) var context
    
    // MARK: Edit Button Context
    @Environment(\.editMode) var editButton
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            // MARK: Lazy Stack
            
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
                Section {
                    
                    // MARK: Current Week
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            
                            ForEach(dateModel.currentWeek,id: \.self){ day in
                                
                                VStack(spacing:2){
                                    
                                    Text(dateModel.extractDate(date: day, format:"dd" ))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    // EEE will return days as Mon,Tue..
                                    Text(dateModel.extractDate(date: day, format:"EEE" ))
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                    
                                    // MARK: circle shape
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(dateModel.isToday(date: day) ? 1 : 0)
                                    
                                    
                                }
                                // MARK: Foreground Style
                                // .foregroundStyle(dateModel.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(dateModel.isToday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                        
                                        // MARK: Matched Geomeetry Effect
                                        
                                        
                                        if dateModel.isToday(date: day){
                                            Capsule()
                                                .fill(Color("blue"))
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                        
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    // Updating Current Day
                                    
                                    withAnimation{
                                        dateModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    NotesView()
                    
                    
                }header: {
                    HeaderView()
                }
                
                
            }
            
        }
        
        .ignoresSafeArea(.container, edges: .top)
        
        .overlay(
            Button(action: {
                dateModel.addNote.toggle()
            },label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("blue"), in: Circle())
                   
            })
            .padding()
            
            ,alignment: .bottomTrailing
            
            
        )
        .sheet(isPresented: $dateModel.addNote){
            // Clearing Edit Date
            
            dateModel.editNote = nil
           
        } content: {
            AddNoteView()
                .environmentObject(dateModel)
        }
        
    }
    
    
    
    // MARK: Note View
    
    func NotesView()-> some View {
        
        LazyVStack(spacing: 20){
            
            DynamicFilteredView(dateToFilter: dateModel.currentDay){ (object: NotesEntity) in
                NoteCardView(note: object)
            }
            
        }
        .padding()
        .padding(.top)
        
    }
    
    
    // MARK: Note Card View
    
    func NoteCardView(note: NotesEntity)->some View{
        
        // MARK: CoreData Values
        HStack(alignment: editButton?.wrappedValue == .active ? .center: .top, spacing: 30){
            
        // if Edit mode enabled then showing Delete Button
            
            if editButton?.wrappedValue == .active{
                
                
                Button{
                    dateModel.editNote = note
                    dateModel.addNote.toggle()
                    
                } label:{
                    Image(systemName: "pencil.circle.fill")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                
              
                Button{
                    // MARK: Deleting Note
                    context.delete(note)
                    
                    // Saving
                    try? context.save()
                    
                } label:{
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
            }

            
            VStack{
                
                HStack(alignment: .top, spacing: 10){
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(note.noteTitle ?? "" )
                            .font(.title2.bold())
                        
                        Text(note.noteDescription ?? "" )
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                    }
                    .hLeading()
                    
                    Text(note.noteDate?.formatted(date: .omitted, time: .shortened) ?? "")
                    
                }
                
                
                
                
            }
            .foregroundColor(.white)
            .padding()
            .hLeading()
            .background(
                Color("blue")
                    .cornerRadius(25)
            )
        }
        .hLeading()
    }
    
    
    // MARK: Header
    
    func HeaderView() -> some View {
        
        HStack(spacing: 10){
            
            
            VStack(alignment: .leading, spacing: 10){
                
                
                Text("My History ")
                    .font(.largeTitle.bold())
                    .padding(.bottom)
                    .foregroundColor(Color("blue"))
                
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                
            }
            .hLeading()
            
            //            Button(action: {
            //                dateModel.addNote.toggle()
            //            },label: {
            //                Image(systemName: "plus")
            //                    .resizable()
            //                    .frame(width: 25 , height: 25)
            //                    .foregroundColor(Color("lightBlue"))
            //                    .padding(.bottom)
            //            })
            //            .sheet(isPresented: $dateModel.addNote){
            //
            //                AddNoteView()
            //            }
            
            
            // MARK: Edit Button
            
            EditButton()
            
            
        }
        .padding()
        .padding(.top,getSafeArea().top)
        .background(Color.white)
        
    }
    
    
}


struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



// MARK: UI Design Helper Functions


extension View{
    
    func hLeading() -> some View {
        
        self
            .frame(maxWidth: .infinity , alignment: .leading)
    }
    
    
    func hTrailing() -> some View {
        
        self
            .frame(maxWidth: .infinity , alignment: .trailing)
    }
    
    
    func hCenter() -> some View {
        
        self
            .frame(maxWidth: .infinity , alignment: .center)
    }
    
    // MARK: Safe Area
    
    func getSafeArea()-> UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
            
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
    
}








