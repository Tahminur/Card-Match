//
//  CardMatchData.swift
//  Card Match
//
//  Created by Tahminur Rahman on 1/3/20.
//  Copyright © 2020 Tahminur Rahman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


//class that stores all the data relevant to the application.
final class CardMatchData:ObservableObject{
    @Published var TotalMovesMade = 0
    @Published var StackofCards = CardStack()//will be used for matching things.
    @Published var GameStarted = false
    @Published var AllCards:[Card] = [
        Card(emoji: "🐉", id: 0),
        Card(emoji: "🦁", id: 1),
        Card(emoji: "🐺", id: 2),
        Card(emoji: "🐳", id: 3),
        Card(emoji: "🦅", id: 4),
        Card(emoji: "🐼", id: 5),
        Card(emoji: "🐶", id: 6),
        Card(emoji: "🐴", id: 7),
        Card(emoji: "🐧", id: 8),
        Card(emoji: "🐱", id: 9),
        Card(emoji: "🦖", id: 10),
        Card(emoji: "🦍", id: 11),
        Card(emoji: "🐉", id: 12),
        Card(emoji: "🦁", id: 13),
        Card(emoji: "🐺", id: 14),
        Card(emoji: "🐳", id: 15),
        Card(emoji: "🦅", id: 16),
        Card(emoji: "🐼", id: 17),
        Card(emoji: "🐶", id: 18),
        Card(emoji: "🐴", id: 19),
        Card(emoji: "🐧", id: 20),
        Card(emoji: "🐱", id: 21),
        Card(emoji: "🦖", id: 22),
        Card(emoji: "🦍", id: 23)
    ]
}
