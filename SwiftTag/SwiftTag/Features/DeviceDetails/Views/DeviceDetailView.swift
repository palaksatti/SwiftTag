//
//  DeviceDetailView.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct DeviceDetailView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: DeviceDetailViewModel
    @State private var newName = ""
    @State private var showRenameSheet = false

    init(device: Device) {
        _viewModel = State(
            initialValue: DeviceDetailViewModel(device: device,repository: AppContainer.shared.repository
            )
        )
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                heroSection
                statusSection
                deviceSection
                bluetoothSection
                dangerSection
            }
            .padding()
        }
        .background(AppColors.background)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showRenameSheet) {

            renameSheet
        }
    }
}

private extension DeviceDetailView {

    var heroSection: some View {
        VStack(spacing: 18) {
            ZStack {
                Circle()
                    .fill(AppColors.accent.opacity(0.12))
                    .frame(width: 120, height: 120)

                Image(systemName: viewModel.device.icon)
                    .font(.system(size: 56))
                    .foregroundStyle(AppColors.accent)
            }

            Text(viewModel.device.name)
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(AppColors.primaryText)

            ConnectionStatusView(
                isConnected: viewModel.device.deviceStatus == .connected
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical,20)
    }

}

private extension DeviceDetailView {
    
    var statusSection: some View {
        VStack(spacing:16) {
            StatusCard(
                icon: "battery.100",
                title: "Battery",
                value: "\(viewModel.device.batteryLevel ?? 0)%"
            )

            StatusCard(
                icon: "wifi",
                title: "Signal",
                value: signalDescription
            )

            StatusCard(
                icon: "clock",
                title: "Last Seen",
                value: viewModel.device.lastSeen.formatted(
                    date: .omitted,
                    time: .shortened
                )
            )

        }
    }

}
private extension DeviceDetailView {
    var deviceSection: some View {
        VStack(spacing:16) {
            SectionTitle(title: "Device")

            ActionCard(
                icon: "tag.fill",
                title: "Rename Device",
                tint: AppColors.accent
            ) {

                showRenameSheet = true
            }

        }
    }

}
private extension DeviceDetailView {

    var bluetoothSection: some View {

        VStack(spacing:16) {

            SectionTitle(title: "Bluetooth")

            ActionCard(
                icon: "dot.radiowaves.left.and.right",
                title: "Connect",
                tint: AppColors.success
            ) {

                Task {

                    await viewModel.connect()
                }
            }

            ActionCard(
                icon: "bolt.horizontal.circle",
                title: "Disconnect",
                tint: AppColors.warning
            ) {

                Task {

                    await viewModel.disconnect()
                }
            }

        }
    }

}
private extension DeviceDetailView {

    var dangerSection: some View {

        VStack(spacing:16) {

            SectionTitle(title: "Danger Zone")

            ActionCard(
                icon: "trash",
                title: "Delete Device",
                tint: AppColors.danger
            ) {

                Task {

                    await viewModel.delete()

                    dismiss()
                }
            }

        }
    }

}
private extension DeviceDetailView {

    var renameSheet: some View {

        NavigationStack {

            VStack(spacing:30) {

                TextField(
                    "Device Name",
                    text: $newName
                )
                .textFieldStyle(.roundedBorder)

                Button {

                    Task {

                        await viewModel.rename(to: newName)
                    }

                    showRenameSheet = false

                } label: {

                    Text("Save")
                        .frame(maxWidth:.infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()

            }
            .padding()
            .navigationTitle("Rename")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium])
        .onAppear {

            newName = viewModel.device.name
        }
    }

}
private extension DeviceDetailView {
    var signalDescription: String {
        switch viewModel.device.rssi {

        case -50...0:
            return "Excellent"

        case -65 ..< -50:
            return "Good"

        case -80 ..< -65:
            return "Fair"

        default:
            return "Weak"
        }
    }

}
