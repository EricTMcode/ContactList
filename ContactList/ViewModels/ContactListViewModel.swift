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
}
