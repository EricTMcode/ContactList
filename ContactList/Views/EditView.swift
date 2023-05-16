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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    dismiss()
                }
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
