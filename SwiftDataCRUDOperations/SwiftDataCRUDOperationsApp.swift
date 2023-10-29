//
//  SwiftDataCRUDOperationsApp.swift
//  SwiftDataCRUDOperations
//
//  Created by admin on 10/29/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataCRUDOperationsApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
