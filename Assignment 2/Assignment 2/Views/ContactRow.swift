

import SwiftUI

/// Resuable Contact Row/Cell
struct ContactRow: View {
    var contact: Contact
    var body: some View {
        // The NavigationLink is the way to navigate to another view.
        // It ONLY works inside of a NavigationView.
        NavigationLink( destination: ContactDetail(contact: contact)) {
            HStack {
                if let smallURL = contact.photo_url_small {
                    if let imageURL = URL(string: smallURL) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                          }
                          .frame(width: 60, height: 60)
                          .clipShape(Circle())
                          } else {
                          Image(systemName: "person.circle.fill") // Default image if URL is invalid
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        }
                }

                
                VStack(alignment: .leading){
                    if let name = contact.full_name {
                        Text(name)
                            .font(.headline)
                    }
                    else {
                        Text("no name")
                            .font(.headline)
                    }
                    if let team = contact.team {
                        Text("Team: \(team)")
                            .font(.subheadline)  // Adjust the font size here
                            .foregroundColor(.gray)
                    }
                }
                
            }
        }
    }
}
