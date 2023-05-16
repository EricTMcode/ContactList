//
//  ContactListApp.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI

@main
struct ContactListApp: App {
    @StateObject var contactListVM = ContactListViewModel()
    var body: some Scene {
        WindowGroup {
            ContactListView()
                .environmentObject(contactListVM)
        }
    }
}
