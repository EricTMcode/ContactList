//
//  Contact.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import Foundation

struct Contact: Identifiable, Codable {
    var id: String?
    var name = ""
    var company = ""
}
