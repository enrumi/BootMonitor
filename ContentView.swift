import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SystemMonitorViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    HeaderView()
                    
                    // CPU Usage
                    SystemInfoCardView(
                        title: "Процессор",
                        icon: "cpu",
                        color: .blue
                    ) {
                        HStack {
                            CircularProgressView(progress: viewModel.systemInfo.cpuUsage)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Загрузка ЦП")
                                    .font(.headline)
                                
                                Text("\(Int(viewModel.systemInfo.cpuUsage * 100))%")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                
                                Text("Текущая загрузка процессора")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    // RAM Usage
                    SystemInfoCardView(
                        title: "Память",
                        icon: "memorychip",
                        color: .green
                    ) {
                        CustomProgressBar(
                            value: viewModel.systemInfo.ramUsed,
                            total: viewModel.systemInfo.ramTotal,
                            title: "Оперативная память",
                            usedText: "\(String(format: "%.1f", viewModel.systemInfo.ramUsed)) ГБ",
                            totalText: "\(String(format: "%.1f", viewModel.systemInfo.ramTotal)) ГБ"
                        )
                        
                        HStack {
                            Text("Доступно: \(String(format: "%.1f", viewModel.systemInfo.ramAvailable)) ГБ")
                                .font(.caption)
                            
                            Spacer()
                            
                            Text("Использовано: \(String(format: "%.1f", viewModel.systemInfo.ramUsed)) ГБ")
                                .font(.caption)
                        }
                    }
                    
                    // Storage
                    SystemInfoCardView(
                        title: "Хранилище",
                        icon: "internaldrive",
                        color: .orange
                    ) {
                        CustomProgressBar(
                            value: viewModel.systemInfo.storageUsed,
                            total: viewModel.systemInfo.storageTotal,
                            title: "Накопитель",
                            usedText: "\(String(format: "%.0f", viewModel.systemInfo.storageUsed)) ГБ",
                            totalText: "\(String(format: "%.0f", viewModel.systemInfo.storageTotal)) ГБ"
                        )
                        
                        HStack {
                            Text("Доступно: \(String(format: "%.0f", viewModel.systemInfo.storageAvailable)) ГБ")
                                .font(.caption)
                            
                            Spacer()
                            
                            Text("Использовано: \(String(format: "%.0f", viewModel.systemInfo.storageUsed)) ГБ")
                                .font(.caption)
                        }
                    }
                    
                    // Uptime
                    SystemInfoCardView(
                        title: "Время работы",
                        icon: "clock",
                        color: .purple
                    ) {
                        HStack {
                            Image(systemName: "clock")
                                .font(.title)
                                .foregroundColor(.purple)
                            
                            VStack(alignment: .leading) {
                                Text(formatUptime(viewModel.systemInfo.uptime))
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("С момента включения")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    // Battery
                    SystemInfoCardView(
                        title: "Батарея",
                        icon: "battery.100",
                        color: .yellow
                    ) {
                        HStack {
                            Image(systemName: viewModel.systemInfo.isCharging ? "battery.100.bolt" : "battery.\(Int(viewModel.systemInfo.batteryLevel * 100))")
                                .font(.title)
                                .foregroundColor(viewModel.systemInfo.isCharging ? .green : .yellow)
                            
                            VStack(alignment: .leading) {
                                Text("\(Int(viewModel.systemInfo.batteryLevel * 100))%")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(viewModel.systemInfo.batteryStatus)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .refreshable {
                // Refresh data when user pulls to refresh
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AboutView()) {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
    }
    
    private func formatUptime(_ uptime: TimeInterval) -> String {
        let hours = Int(uptime) / 3600
        let minutes = (Int(uptime) % 3600) / 60
        
        if hours > 0 {
            return "\(hours) ч \(minutes) мин"
        } else {
            return "\(minutes) мин"
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Boot")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
            
            Text("Мониторинг системы")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical)
    }
}