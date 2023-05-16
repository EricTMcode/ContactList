//
//  ListView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct ListView: View {
    let contacts = ["Eric", "Stephan", "Sylvie", "Lucia"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts, id: \.self) { contact in
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.system(size: 50))
                        VStack(alignment: .leading) {
                            Text(contact)
                                .font(.title2)
                                .bold()
                            Text("Apple Corporation")
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
