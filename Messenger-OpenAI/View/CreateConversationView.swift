//
//  CreateConversationView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import SwiftUI

struct CreateConversationView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var isAlertShown: Bool = false
    @State private var authorNameField: String = ""
    @State private var authorProfession: Profession = .allCases.first!
    @State private var authorProfileImage: ImageType = .waterfall

    let submitButtonDidTap: (Author) -> Void

    var body: some View {
        Form {
            Section(header: Text("Chatbot data")) {
                TextField("Name", text: $authorNameField)
                Picker("Profession", selection: $authorProfession) {
                    ForEach(Profession.allCases, id: \.toString) { profession in
                        Text(profession.toString.capitalized)
                            .tag(profession)
                    }
                }
            }
            Section(header: Text("Profile image")) {
                ImagePickerView(pickerSelection: $authorProfileImage)
                    .onChange(of: authorProfileImage) { _, newValue in
                        print(newValue)
                    }
            }
            Section {
                Button {
                    if authorNameField.isEmpty {
                        isAlertShown = true
                        return
                    }
                    print(authorNameField)

                    let newAuthor = Author(
                        name: authorNameField,
                        profession: authorProfession,
                        profileImage: authorProfileImage)

                    submitButtonDidTap(newAuthor)
                    dismiss()
                } label: {
                    Text("Submit")
                }
                .alert("Please give a name to your chatbot.",
                       isPresented: $isAlertShown,
                       actions: {
                           Button("OK", role: .none) {}
                       })
            }
            Section {
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
}

#Preview {
    CreateConversationView { author in
        print(author.name)
    }
}
