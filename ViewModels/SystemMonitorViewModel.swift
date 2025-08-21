import SwiftUI
import Foundation

@MainActor
class SystemMonitorViewModel: ObservableObject {
    @Published var systemInfo: SystemInfo = SystemInfoProvider.getCurrentSystemInfo()
    private var timer: Timer?
    
    init() {
        startMonitoring()
    }
    
    func startMonitoring() {
        // Update system info every 1 second
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateSystemInfo()
        }
    }
    
    func stopMonitoring() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateSystemInfo() {
        // In a real app, this would fetch actual system data
        systemInfo = SystemInfoProvider.getCurrentSystemInfo()
    }
    
    deinit {
        stopMonitoring()
    }
}