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
    
    static let example = Person(name: "Eric Dubourdon", company: "Apple Corporation", phone: "+3454535254235", email: "eric@gmail.com", location: "New-York")
}
