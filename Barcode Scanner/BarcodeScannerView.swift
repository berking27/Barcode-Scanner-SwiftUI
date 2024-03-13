//
//  BarcodeScannerView.swift
//  Barcode Scanner
//
//  Created by Berkin KOCA on 13.03.2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.bottom, 30)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text("Not Yet Scanned")
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundStyle(.green)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
