import Foundation

// MARK: - System Information Models

struct SystemInfo: Identifiable {
    let id = UUID()
    let cpuUsage: Double
    let ramUsed: Double
    let ramTotal: Double
    let storageUsed: Double
    let storageTotal: Double
    let uptime: TimeInterval
    let batteryLevel: Double
    let isCharging: Bool
    
    // Computed properties
    var ramAvailable: Double {
        ramTotal - ramUsed
    }
    
    var storageAvailable: Double {
        storageTotal - storageUsed
    }
    
    var batteryStatus: String {
        isCharging ? "Заряжается" : "Не заряжается"
    }
}

// MARK: - Mock Data Provider
class SystemInfoProvider {
    static func getCurrentSystemInfo() -> SystemInfo {
        // In a real app, we would use system APIs to get actual data
        // For this demo, we'll generate mock data
        let cpuUsage = Double.random(in: 0.1...0.9)
        let ramUsed = Double.random(in: 4.0...12.0)
        let ramTotal = 16.0
        let storageUsed = Double.random(in: 100.0...300.0)
        let storageTotal = 512.0
        let uptime = TimeInterval(Int.random(in: 3600...86400))
        let batteryLevel = Double.random(in: 0.2...1.0)
        let isCharging = Bool.random()
        
        return SystemInfo(
            cpuUsage: cpuUsage,
            ramUsed: ramUsed,
            ramTotal: ramTotal,
            storageUsed: storageUsed,
            storageTotal: storageTotal,
            uptime: uptime,
            batteryLevel: batteryLevel,
            isCharging: isCharging
        )
    }
}