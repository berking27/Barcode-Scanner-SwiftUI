//
//  BarcodeScannerView.swift
//  Barcode Scanner
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $scannedCode)
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
        }
    }
}

#Preview {
    BarcodeScannerView()
}
