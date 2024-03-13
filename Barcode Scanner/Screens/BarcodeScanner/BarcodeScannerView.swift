//
//  BarcodeScannerView.swift
//  Barcode Scanner
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.bottom, 30)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
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
