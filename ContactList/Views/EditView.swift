//
//  EditView.swift
//  ContactList
//
//  Created by Eric on 16/05/2023.
//

import SwiftUI
import PhotosUI

struct EditView: View {
    @EnvironmentObject var contactlistVM: ContactListViewModel
    @Environment(\.dismiss) private var dismiss
    @State var person: Person
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var image = Image(systemName: "person.crop.circle")
    
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                VStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .clipped()
                        .foregroundColor(.blue)
                    
                    PhotosPicker("Add picture", selection: $selectedPhoto, matching: .images, preferredItemEncoding: .automatic)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .onChange(of: selectedPhoto) { newValue in
                    Task {
                        do {
                            if let data = try await newValue?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    image = Image(uiImage: uiImage)
                                }
                            }
                        } catch {
                            print("😡 ERROR: loading failed \(error.localizedDescription)")
                        }
                    }
                }
                Spacer()
            }
            Section("Add contact") {
                TextField("Name*", text: $person.name)
                TextField("Company*", text: $person.company)
            }
            
            Section("Informations") {
                TextField("Phone", text: $person.phone)
                TextField("Email", text: $person.email)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                TextField("Location", text: $person.location)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    contactlistVM.savePerson(person: person)
                    dismiss()
                }
                .disabled(person.name.isEmpty || person.company.isEmpty)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditView(person: Person.example)
                .environmentObject(ContactListViewModel())
        }
    }
}
