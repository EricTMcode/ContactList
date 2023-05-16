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
        loadData()
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
        saveData()
    }
    
    func deletePerson(indexSet: IndexSet) {
        contacts.remove(atOffsets: indexSet)
        saveData()
    }
    
    func movePerson(fromOffests: IndexSet, toOffset: Int) {
        contacts.move(fromOffsets: fromOffests, toOffset: toOffset)
        saveData()
    }
    
    //MARK: - DOCUMENTS DIRECTORY
    
    let path = URL.documentsDirectory.appending(component: "contacts")
    
    func saveData() {
        let data = try? JSONEncoder().encode(contacts)
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            contacts = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            
        }
    }
}
