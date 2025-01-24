//
//  ContentView.swift
//  SaladSampleApp
//
//  Created by Mathijs Bernson on 24/01/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TodoItem]

    @State var isPresentingAddItemView: Bool = false
    @State var textEntry = ""

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        TodoItemCell(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .overlay {
                if items.isEmpty {
                    Text("Press '+' to add your first to-do item!")
                }
            }
            .navigationTitle("To do list")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        isPresentingAddItemView = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                    .accessibilityIdentifier("addButton")
                }
            }
        } detail: {
            Text("Select an item")
        }
        .alert("Add to do item", isPresented: $isPresentingAddItemView) {
            TextField("Buy milk", text: $textEntry)
            Button("Cancel", role: .cancel) { isPresentingAddItemView = false }
            Button("Save", action: addItem)
        } message: {
            Text("What would you like to do today?")
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("TodoListView")
    }

    private func addItem() {
        // Pre-condition: the to-do item title may not be an empty string.
        guard !textEntry.isEmpty else { return }

        withAnimation {
            let newItem = TodoItem(title: textEntry, timestamp: Date())
            modelContext.insert(newItem)
            textEntry.removeAll()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct TodoItemCell: View {
    let item: TodoItem

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                .font(.subheadline)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("TodoItemCell")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
