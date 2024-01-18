

import SwiftUI

/// ViewModel for ContactsListView
final class ContactsListViewModel: ObservableObject {
    //MARK: Observable propreties
    @ObservedObject var store: ContactStore
    @Published var navTitle: String = ""
    @Published var searchTerm: String = ""
    @Published var searchResults: [Contact] = []
    
    /// Computed property to display data
    var listData: [Contact] {
        return searchTerm.isEmpty ? store.contacts : searchResults
    }
    
    var displayNavTitle: String {
        "\(navTitle)"
    }
    
    /// Inititalizer
    /// - Parameters:
    ///   - store: ContactStore
    ///   - navTitle: String
    init(store: ContactStore = ContactStore(), navTitle: String = "Employees") {
        self.store = store
        self.navTitle = navTitle
        self.store.viewModel = self
    }
    
    func activateSearchBar() {
        print("I am here")
        searchTerm = " " // Add a space
        DispatchQueue.main.async {
            self.searchTerm = "" // Clear the space
        }
    }

    /// To filter result using search
    func filterSearchResults() {
        DispatchQueue.main.async {
            self.searchResults = self.store.contacts.filter { contact in
                if let fullName = contact.full_name {
                    return fullName.localizedCaseInsensitiveContains(self.searchTerm)
                }
                return false // If full_name is nil, exclude the contact from results
            }
        }
    }
}
