//
//  BookListView.swift
//  SwiftDataCRUDOperations
//
//  Created by admin on 10/29/23.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query(sort: \Book.title) private var books: [Book]
    @State private var createNewBook = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        Text(book.title)
                    } label: {
                        HStack(spacing: 10) {
                            book.icon
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.title2)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                                if let rating = book.rating {
                                    HStack {
                                        ForEach(0..<rating, id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .imageScale(.small)
                                                .foregroundStyle(.yellow)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
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
        .modelContainer(for: Book.self, inMemory: true)
}
