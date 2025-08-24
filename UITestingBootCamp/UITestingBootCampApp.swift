//
//  UITestingBootCampApp.swift
//  UITestingBootCamp
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import SwiftUI

@main
struct UITestingBootCampApp: App {
    var alertManager = AlertManager()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(alertManager)
        }
    }
}
