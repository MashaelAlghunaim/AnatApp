//
//  DateViewModel.swift
//  AnatApp
//
//  Created by Aljwhra Alnasser on 25/02/2023.
//

import Foundation
import SwiftUI

class DateViewModel: ObservableObject {
    
        
    // MARK: Current week Days
    
    @Published var currentWeek: [Date] = []
    
    // MARK: Filtering Today Note
    
    @Published var filteredNotes: [NotesEntity]?
    
    // MARK: Add Note
    
    @Published var addNote: Bool = false
    
    
    // MARK: Current Day
    
    @Published var currentDay: Date = Date()
    
    // MARK: Edit Date
    
    @Published var editNote: NotesEntity?
    
    // MARK: Intializing
    
    init(){
        fetchCurrentWeek()
      
    }
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calendar = Calendar.current
        
        
    
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (0..<7).forEach{ day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
            
        }
    }
    
    //MARK: Extracting Date
    
    func extractDate(date: Date,format: String)->String{
    
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    
    //MARK: Checking if current Date is Today
    
    func isToday(date: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    func isCurrentHour(date: Date)->Bool{
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
        
    }
    
    
}


//struct DateViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        DateViewModel()
//    }
//}
