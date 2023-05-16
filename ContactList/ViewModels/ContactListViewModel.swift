//
//  ContactListViewModel.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import Foundation

class ContactListViewModel: ObservableObject {
    @Published var contacts: [Person] = []
    
    init() {
        contacts = [Person(name: "Eric", company: "Apple Corporation"), Person(name: "Stephan", company: "Microsoft TM")]
    }
    
    func savePerson(person: Person) {
        if person.id == nil {
            var newPerson = person
            newPerson.id = UUID().uuidString
            contacts.append(newPerson)
        } else {
            if let index = contacts.firstIndex(where: { $0.id == person.id }) {
                contacts[index] = person
            }
        }
    }
}
