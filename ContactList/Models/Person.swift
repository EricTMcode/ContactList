//
//  Contact.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import Foundation

struct Person: Identifiable, Codable, Hashable {
    var id: String?
    var name = ""
    var company = ""
    
    static let example = Person(name: "Eric Dubourdon", company: "Apple Corporation")
}
