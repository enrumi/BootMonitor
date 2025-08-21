import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "macbook")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("Boot Monitor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Версия 1.0")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Приложение для мониторинга состояния системы iOS, показывающее информацию о загрузке процессора, использовании памяти, хранилища, времени работы устройства и состоянии батареи.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Основные функции:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    FeatureRow(icon: "cpu", text: "Мониторинг загрузки процессора в реальном времени")
                    FeatureRow(icon: "memorychip", text: "Отслеживание использования оперативной памяти")
                    FeatureRow(icon: "internaldrive", text: "Информация о занятом и свободном месте на диске")
                    FeatureRow(icon: "clock", text: "Время работы устройства с момента включения")
                    FeatureRow(icon: "battery.100", text: "Состояние батареи и её статус")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemGray6))
                )
                .padding(.horizontal)
                
                Text("Разработано с использованием SwiftUI")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("О приложении")
    }
}

struct FeatureRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(text)
            Spacer()
        }
    }
}