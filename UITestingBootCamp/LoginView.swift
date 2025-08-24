//
//  ContentView.swift
//  UITestingBootCamp
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(AlertManager.self)  var alertManager
    @State var userName: String = ""
    @State var showError: Bool = false
    @State private var path = NavigationPath()
    
    var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                LinearGradient(colors: [.cyan,.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                GeometryReader() { geo in
                    VStack {
                        Spacer()
                        TextField("Username", text: $userName)
                            .padding()
                            .frame(width: geo.size.width * 0.9, height: 40, alignment: .center)
                            .background()
                            .cornerRadius(5.0)
                            .shadow(radius: 5.0)
                            .padding(.all)
                        Button {
                            if (vm.isValidUsername(userName)) {
                                path.append("home")
                            } else {
                                alertManager.show("Invalid User")
                                userName = ""
                            }
                        } label: {
                            Text("Login")
                                .padding(10)
                                .font(.title2)
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                                .background(
                                    Color.blue
                                        .opacity(0.7)
                                )
                                .cornerRadius(5.0)
                                .shadow(radius: 5.0)
                        }
                        .navigationDestination(for: String.self, destination: { route in
                            if route == "home" {
                                Home()
                            }
                        })
                        .padding()
                        .globalAlert(manager: alertManager)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    
    var alertManager = AlertManager()

    LoginView()
        .environment(alertManager)
}
