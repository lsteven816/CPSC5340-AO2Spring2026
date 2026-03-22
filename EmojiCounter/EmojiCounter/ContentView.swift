//
//  ContentView.swift
//  EmojiCounter
//
//  Created by LaToya Stevens on 3/21/26.
//

import SwiftUI

struct EmojiItem: Identifiable {
    var id: String { emoji }
    var emoji: String
    var count: Int
}

struct ContentView: View {
    
    @State private var emojis: [EmojiItem] = [
        EmojiItem(emoji: "😄", count: 0),
        EmojiItem(emoji: "😎", count: 0),
        EmojiItem(emoji: "😭", count: 0),
        EmojiItem(emoji: "😡", count: 0),
        EmojiItem(emoji: "🔥", count: 0),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojis.indices, id: \.self) { index in HStack {
                    Text(emojis[index].emoji)
                        .font(.largeTitle)
                    Spacer()
                    
                    //Decrement
                    Button(action: {
                        if emojis[index].count > 0 {
                            emojis[index].count -= 1
                        }
                    }) {
                        Text("-")
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .background(Color.orange.opacity(0.5))
                            .cornerRadius(20)
                    }
                    .buttonStyle(.borderless)
                    
                    // Counter
                    Text("\(emojis[index].count)")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .frame(width: 40)
                    
                    //Increment
                    Button(action: {
                        emojis[index].count += 1
                    }) {
                        Text("+")
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(20)
                    }
                    .buttonStyle(.borderless)
                }
                .padding()
                }
            }
            .navigationTitle("Emoji Counter")
        }
    }
}

#Preview {
    ContentView()
}
