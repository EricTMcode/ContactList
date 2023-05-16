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
                .scaledToFit()
                .frame(width: 100)
            
            Text(person.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
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
