//
//  ContactView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct ContactView: View {
    let person: Person
    @State private var sheetIsPresented = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Text(person.name)
                .font(.title)
                .fontWeight(.medium)
            Text(person.company)
                .font(.callout)
            
            Form {
                HStack {
                    Text("Phone")
                    Spacer()
                    Text(person.phone)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack {
                    Text("Email")
                    Spacer()
                    Text(person.email)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack {
                    Text("Location")
                    Spacer()
                    Text(person.location)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    sheetIsPresented.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: $sheetIsPresented) {
            NavigationStack {
                EditView(person: person)
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactView(person: Person.example)
        }
    }
}
