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
        VStack(alignment: .leading) {
            Text("Name:")
                .font(.title2)
                .bold()
            TextField("Enter name", text: $person.name)
                .textFieldStyle(.roundedBorder)
            
            Text("Company:")
                .font(.title2)
                .bold()
            TextField("Enter Company", text: $person.company)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditView(person: Person.example)
                .environmentObject(ContactListViewModel())
        }
    }
}
