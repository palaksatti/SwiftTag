//
//  ScanView.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct ScanView: View {

    @Environment(\.dismiss)
    private var dismiss

    @State
    private var viewModel = ScanViewModel(
        repository: AppContainer.shared.repository
    )

    var body: some View {

        NavigationStack {

            VStack {

                if viewModel.isScanning {

                    ScanningView()

                        .padding(.top)
                }

                List {

                    ForEach(viewModel.nearbyDevices) { device in

                        Button {

                            Task {

                                await viewModel.addDevice(device)

                                dismiss()
                            }

                        } label: {

                            ScanRow(device: device)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Nearby Devices")
            .task {

                await viewModel.startScanning()
            }
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button("Close") {

                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {

    ScanView()
}
