

import SwiftUI

struct ContentView: View {
    @AppStorage("onboardingRequired3") var onboardingRequired: Bool = true
    
    var body: some View {
        TabView {
                    ContactsListView()
                        .tabItem {
                            Image(systemName: "person.3")
                            Text("Employees")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }
        .fullScreenCover(isPresented: $onboardingRequired) {
            onboardingRequired = false
        } content: {
            OnboardingView(onboardingRequired: $onboardingRequired)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnboardingView: View {
    @Binding var onboardingRequired: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Employee List")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Spacer()
                Text("This Application shows a list of employees who are fetched from the network. Yopu can search employees by name and view their details by pressing them.")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .padding(.horizontal, 45)
                Button {
                    onboardingRequired = false
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .controlSize(.large)
                .padding([.horizontal], 40)
                
            }
        }
    }
}
