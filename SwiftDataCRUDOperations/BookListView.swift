//
//  BookListView.swift
//  SwiftDataCRUDOperations
//
//  Created by admin on 10/29/23.
//

import SwiftUI

struct BookListView: View {
    @State private var createNewBook = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("My Books")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook, content: {
                NewBookView()
                    .presentationDetents([.medium])
            })
        }
    }
}

#Preview {
    BookListView()
}
