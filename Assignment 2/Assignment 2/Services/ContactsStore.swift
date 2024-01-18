

import Foundation

final class ContactStore: ObservableObject {
    var viewModel: ContactsListViewModel?
    @Published var contacts: [Contact] = []{
        didSet {
                    viewModel?.activateSearchBar()
                }
    }
    

    init() {
        Task {
            do {
                let contacts = try await fetchInitialData()
                DispatchQueue.main.async {
                    self.contacts = contacts
                }
            } catch {
                    // Handle the error case
                print("Failed to fetch contacts: \(error)")
            }
        }
    }

    private func fetchInitialData() async throws -> [Contact] {
        guard let apiURL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
            throw NSError(domain: "Invalid API URL", code: 0, userInfo: nil)
        }

        let session = URLSession.shared

        do {
            let (data, _) = try await session.data(from: apiURL)
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(APIResponse.self, from: data)
            print("Data successfully loaded")
            return apiResponse.employees
        } catch {
            print("Error fetching or decoding JSON: \(error)")
            throw error
        }
    }
}
