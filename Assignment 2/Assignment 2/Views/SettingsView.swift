

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("This Application shows a list of employees who are fetched from the network. Yopu can search employees by name and view their details by pressing them.")
                .font(.system(size: 13))
                .padding(.horizontal, 40)
                .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
