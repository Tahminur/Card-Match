//
//  CardStack.swift
//  Card Match
//
//  Created by Tahminur Rahman on 1/3/20.
//  Copyright © 2020 Tahminur Rahman. All rights reserved.
//

import Foundation

struct CardStack {

    //our card stack that is used to compare cards by usin gthe views associated with the cards.
    
    private var CardDesc: [CardView] = []
    
    
    mutating func push(_ CardPushed: CardView){
        if (CardDesc.count == 1 && CardDesc[0].MyCard.id != CardPushed.MyCard.id){
            CardDesc.append(CardPushed)
        }
        else{
            CardDesc.append(CardPushed)
        }
    }
    
    mutating func pop() -> CardView? {
        return CardDesc.popLast()
    }
    
    func length() -> Int? {
        print(CardDesc.count)
        return CardDesc.count
    }
}
