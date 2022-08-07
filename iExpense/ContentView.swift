//
//  ContentView.swift
//  iExpense
//
//  Created by Maciej on 06/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    if item.type == "Personal" {
                        Section {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(
                                        item.amount >= 10 ? (item.amount >= 100 ? .purple : .green) : .black
                                    )
                            }
                        } header: {
                            Text("Personal")
                        }
                    } else {
                        Section {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(
                                        item.amount >= 10 ? (item.amount >= 100 ? .purple : .green) : .black
                                    )
                            }
                        } header: {
                            Text("Business")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense \(expenses.items.count == 0 ? "" : "(\(expenses.items.count))" )")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .disabled(expenses.items.isEmpty)
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
