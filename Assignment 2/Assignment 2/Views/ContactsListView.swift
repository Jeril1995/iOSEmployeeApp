

import SwiftUI

struct ContactsListView: View {
    /// ViewModel for ContactsListView
    @ObservedObject var viewModel = ContactsListViewModel()
    
    /// Main body
    var body: some View {
        // Add Navigation view
        NavigationView {
                // Create list
                List {
                    if viewModel.listData.isEmpty {
                        Text("No employees found.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(viewModel.listData, id: \.self) { contact in
                            ContactRow(contact: contact)
                        }
                    }
                }
                .navigationTitle(viewModel.displayNavTitle)
                // To Add search capability
                .searchable(text: $viewModel.searchTerm,
                            placement: .navigationBarDrawer(displayMode: .automatic),
                            prompt: "Search for employees")
                .onChange(of: viewModel.searchTerm, perform: { newValue in
                    viewModel.filterSearchResults()
                })
//                .animation(.default, value: viewModel.searchTerm)
                .onAppear {
                    viewModel.activateSearchBar() // Activate the search bar
                }
        }
    }
}

/// To Add preview to canvas
struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(viewModel: ContactsListViewModel(store: ContactStore()))

    }
}
