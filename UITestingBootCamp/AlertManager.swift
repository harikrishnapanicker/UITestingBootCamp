//
//  Alert.swift
//  UITestingBootCamp
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import SwiftUI

struct AlertData: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}

@Observable
class AlertManager {
    var alert: AlertData?
    
    func show(_ message: String) {
        alert = AlertData(title: Bundle.main.displayName ?? "Boot Camp", message: message)
    }
}

extension View {
    
    func globalAlert(manager: AlertManager) -> some View {
        self.alert(item: Binding(
            get: { manager.alert },
            set: { _ in manager.alert = nil }
        )) { alertData in
            Alert(
                title: Text(alertData.title),
                message: Text(alertData.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
