//
//  Home.swift
//  UITestingBootCamp
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.cyan,.gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    Home()
}
