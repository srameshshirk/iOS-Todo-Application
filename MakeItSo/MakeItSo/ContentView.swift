//
//  ContentView.swift
//  MakeItSo
//
//  Created by Shirke, Soham Ramesh (Soham) on 03/09/24.
//

import SwiftUI

struct ContentView: View {
    @State
    private var reminders = Reminder.samples
    
    @State
    private var isAddReminderDialogPresented = false
    
    private func presentAddReminderView(){
        isAddReminderDialogPresented.toggle()
    }
    
    private func deleteCompletedReminders() {
            reminders.removeAll { $0.isCompleted }
        }
    
    var body: some View {
        List($reminders) { $reminder in
            HStack {
                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .onTapGesture {
                        reminder.isCompleted.toggle()
                        deleteCompletedReminders()
                    }
                Text(reminder.title)
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button(action: presentAddReminderView){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented){
            ReminderView { reminder in
                reminders.append(reminder)
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
            .navigationTitle("Reminders")
    }
}
