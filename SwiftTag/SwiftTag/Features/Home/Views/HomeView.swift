//
//  HomeView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel(
        repository: AppContainer.shared.repository
    )
    @State
    private var showScanner = false
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.devices.isEmpty {
                    EmptyStateView()
                    
                } else {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            
                            ForEach(viewModel.devices) { device in
                                
                                NavigationLink {
                                    
                                    DeviceDetailView(device: device)
                                    
                                } label: {
                                    
                                    DeviceCard(device: device)
                                }
                                .buttonStyle(.plain)
                                
                                .swipeActions {
                                    
                                    Button(role: .destructive) {
                                        
                                        Task {
                                            
                                            await viewModel.delete(device)
                                            
                                            
                                        }
                                        
                                    } label: {
                                        
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                            
                        }
                        .padding()
                    }
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        
                        showScanner = true
                        
                    } label: {
                        
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("SwiftTag")
            .task {
                await viewModel.loadDevices()
            }
            .sheet(isPresented: $showScanner, onDismiss: {
                Task {
                    await viewModel.refresh()
                }
                
            }) {
                
                ScanView()
            }
        }
        .background(AppColors.background)
    }
}

#Preview {
    HomeView()
}
