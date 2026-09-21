import SwiftUI

struct ContentView: View {
    let fruits = ["strawberry", "banana", "kiwi", "apple"]
    let fruitNames = ["Strawberry", "Banana", "Kiwi", "Apple"]
    @State private var selectedFruit = 0

    var body: some View {
        VStack(spacing: 20) {
            Image(fruits[selectedFruit])
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Picker("Fruit", selection: $selectedFruit) {
                ForEach(0..<fruits.count, id: \.self) { index in
                    Text(fruitNames[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
