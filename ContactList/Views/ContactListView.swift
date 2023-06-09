//
//  ContactListView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct ContactListView: View {
    @EnvironmentObject var contactListVM: ContactListViewModel
    @State private var sheetIsPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contactListVM.contacts) { contact in
                    NavigationLink {
                        ContactView(person: contact)
                    } label: {
                        HStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text(contact.name)
                                    .font(.headline)
                                Text(contact.company)
                            }
                        }
                    }
                }
                .onDelete(perform: contactListVM.deletePerson)
                .onMove(perform: contactListVM.movePerson)
            }
            .navigationTitle("Contacts")
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    EditView(person: Person())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
            .environmentObject(ContactListViewModel())
    }
}
