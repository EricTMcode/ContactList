//
//  EditView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var contactlistVM: ContactListViewModel
    @State var person: Person
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(person: Person.example)
            .environmentObject(ContactListViewModel())
    }
}
