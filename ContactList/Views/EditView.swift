//
//  EditView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var contactlistVM: ContactListViewModel
    @Environment(\.dismiss) private var dismiss
    @State var person: Person
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 120))
                        .foregroundColor(.blue)
                    
                    Text("Add picture")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Section("Add contact") {
                TextField("Name*", text: $person.name)
                TextField("Company*", text: $person.company)
            }
            
            Section("Informations") {
                TextField("Phone", text: $person.phone)
                TextField("Email", text: $person.email)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                TextField("Location", text: $person.location)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    contactlistVM.savePerson(person: person)
                    dismiss()
                }
                .disabled(person.name.isEmpty || person.company.isEmpty)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
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
