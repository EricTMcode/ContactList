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
    var phone = ""
    var email = ""
    var location = ""
    
    static let example = Person(name: "Eloise Namto", company: "Twitter®", phone: "+3454535254235", email: "eloise.namto@gmail.com", location: "Paris - FR")
}
