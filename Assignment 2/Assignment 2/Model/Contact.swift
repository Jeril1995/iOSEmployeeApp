

import Foundation

struct APIResponse: Codable {
    let employees: [Contact]
}

struct Contact: Codable, Hashable {
    let uuid: String?
    let full_name: String?
    let phone_number: String?
    let email_address: String?
    let biography: String?
    let photo_url_small: String?
    let photo_url_large: String?
    let team: String?
    let employee_type: String?
}
