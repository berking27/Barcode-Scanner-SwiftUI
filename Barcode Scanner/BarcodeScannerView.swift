//
//  BarcodeScannerView.swift
//  Barcode Scanner
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    
    let title: String
    let message: String
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera, We are unable to capture input",
                                              dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scanned Type",
                                              message: "The value is scanned is not valid. This app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("OK")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.bottom, 30)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
