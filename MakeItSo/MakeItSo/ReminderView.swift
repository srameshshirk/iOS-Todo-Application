//
//  ReminderView.swift
//  MakeItSo
//
//  Created by Shirke, Soham Ramesh (Soham) on 03/09/24.
//

import SwiftUI

struct ReminderView: View {
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState
    private var focusedField: FocusableField?
    
    @State
    private var reminders = Reminder(title:"")
    
    var onCommit: (Reminder) -> Void
    
    @Environment(\.dismiss)
    private var dismiss
    
    private func commit() {
        onCommit(reminders)
        dismiss()
    }
    
    private func cancel(){
        dismiss()
    }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter your reminder",text:$reminders.title)
                    .focused($focusedField, equals: .title)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(reminders.title.isEmpty)
                }
            }
            .onAppear{
                focusedField = .title
            }
        }
    }
}

#Preview {
    ReminderView { reminders in
        print("you have addes a new reminder \(reminders.title)")
    }
}
