//
//  DynamicFilteredView.swift
//  AnatApp
//
//  Created by Aljwhra Alnasser on 25/02/2023.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View,N>: View where N: NSManagedObject {
    
    //MARK: Core Data Request
    
    @FetchRequest var request: FetchedResults<N>
    let content: (N)->Content
    
    // MARK: Building Custom ForEach which Will give cordata object to build View
    
    init(dateToFilter: Date,@ViewBuilder content: @escaping (N)->Content){
        
        //MARK: Predicate to Filter current date Note
        
        let calender = Calendar.current
        
        let today = calender.startOfDay(for: dateToFilter)
        let tommorow = calender.date(byAdding: .day, value: 1, to: today)
        
        // Filter key
        let filterKey = "noteDate"
        
        // fetch note between today and tommorw which is 24 HR
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [today,tommorow])
        
        // Intializing Request with NSPredicate
        // Adding Sort
        _request = FetchRequest(entity: N.entity(), sortDescriptors: [.init(keyPath: \NotesEntity.noteDate, ascending: true)], predicate: predicate)
        self.content = content
    }
    
    var body: some View {
        
        Group{
            if request.isEmpty{
                
                Text("No Note Found!")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .offset(y: 100)
            }
            else{
                
                ForEach(request,id: \.objectID){object in
                    self.content(object)
                }
                
            }
        }
    }
}

//struct DynamicFilteredView_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicFilteredView()
//    }
//}
