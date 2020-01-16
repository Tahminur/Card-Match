//
//  Card.swift
//  Card Match
//
//  Created by Tahminur Rahman on 1/3/20.
//  Copyright © 2020 Tahminur Rahman. All rights reserved.
//

import Foundation


struct Card{ //what a card should contain
    var emoji: String
    var matched: Bool = false
    var id: Int
    var display: Bool = false
    
    func compare(otherCard:Card)->Bool{
        return (self.emoji == otherCard.emoji && self.id != otherCard.id)
    }
}
