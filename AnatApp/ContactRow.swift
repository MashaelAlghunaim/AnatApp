//
//  ContactRow.swift
//  Anat
//
//  Created by Ghayah Almadi on 19/02/2023.
//

import SwiftUI
import Contacts

struct ContactRow: View {
    var contact: CNContact
    @Binding var showPicker: Bool
    @Binding var selectedContact: CNContact?
    
    var body: some View {
        Button(action: {
            selectContact()
        }) {
            HStack {
                Text("\(contact.familyName)").fontWeight(.bold)
                Text("\(contact.givenName) \(contact.middleName)")
            }
            .foregroundColor(.black)
        }
    }
    
    func selectContact() {
        self.selectedContact = self.contact
        self.showPicker = false
    }
}

/*
struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow()
    }
}
*/
