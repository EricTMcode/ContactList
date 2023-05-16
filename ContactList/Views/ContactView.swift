//
//  ContactView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var ContactListVM: ContactListViewModel
    @State var person: Person
    
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
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(person: Person.example)
            .environmentObject(ContactListViewModel())
    }
}
