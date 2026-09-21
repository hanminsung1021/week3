import SwiftUI

struct ContentView: View {
    @State private var alarmDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            DatePicker("알람 시각", selection: $alarmDate, displayedComponents: [.hourAndMinute])
                .datePickerStyle(.compact)

            Text(timeRemainingString(to: alarmDate))
                .font(.headline)
        }
        .padding()
    }

    func timeRemainingString(to targetDate: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let nowComponents = calendar.dateComponents([.hour, .minute], from: now)
        let targetComponents = calendar.dateComponents([.hour, .minute], from: targetDate)
        
        guard let nowHour = nowComponents.hour, let nowMinute = nowComponents.minute,
              let targetHour = targetComponents.hour, let targetMinute = targetComponents.minute else {
            return ""
        }
        
        let nowTotalMinutes = nowHour * 60 + nowMinute
        var targetTotalMinutes = targetHour * 60 + targetMinute
        
        if targetTotalMinutes <= nowTotalMinutes {
            targetTotalMinutes += 24 * 60
        }
        
        let diffMinutes = targetTotalMinutes - nowTotalMinutes
        let hours = diffMinutes / 60
        let minutes = diffMinutes % 60
        
        return "\(hours)시간 \(minutes)분 후"
    }
}

#Preview {
    ContentView()
}
