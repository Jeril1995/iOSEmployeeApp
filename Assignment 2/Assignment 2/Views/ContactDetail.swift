

import SwiftUI

struct ContactDetail: View {
    @State private var zoomed = false
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .center) {
            if let name = contact.full_name {
                Text(name)  // Display employee full name as a heading
                    .font(.largeTitle)  // Customize the font size
                    .fontWeight(.bold)  // Make it bold
                    .padding(.bottom, 20)  // Add some top padding
            }
            else {
                Text("no name")  // Display employee full name as a heading
                    .font(.largeTitle)  // Customize the font size
                    .fontWeight(.bold)  // Make it bold
                    .padding(.bottom, 20)  // Add some top padding
            }
            if let largeURL = contact.photo_url_large {
                if let imageURL = URL(string: largeURL) {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill") // Default image if URL is invalid
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                            }
            }
            
            if let email = contact.email_address {
                ContactInfoRow(label: "Email", value: email)
            }
            if let phone = contact.phone_number{
                ContactInfoRow(label: "Phone", value: phone)
            }
            if let bio = contact.biography{
                ContactInfoRow(label: "Biography", value: bio)
            }
            if let team = contact.team{
                ContactInfoRow(label: "Team", value: team)
            }
            if let type = contact.employee_type {
                ContactInfoRow(label: "Type", value: type)
            }
            
            
            Spacer()
        }
        .padding()
    }
}
