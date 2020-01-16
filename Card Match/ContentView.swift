//
//  ContentView.swift
//  Card Match
//
//  Created by Tahminur Rahman on 1/2/20.
//  Copyright © 2020 Tahminur Rahman. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var gameData:CardMatchData

    func ReturnCard(x:Int)->Card{
        if (gameData.GameStarted == false){
            gameData.GameStarted = true
            gameData.AllCards.shuffle()
        }
        return gameData.AllCards[x]
    }

    
    var body: some View {
        VStack{
            MovesDisplay()
            VStack{
                HStack{
                    CardView(MyCard: ReturnCard(x: 0))
                    CardView(MyCard: ReturnCard(x: 1))
                    CardView(MyCard: ReturnCard(x: 2))
                    CardView(MyCard: ReturnCard(x: 3))
                }
                HStack{
                    CardView(MyCard: ReturnCard(x: 4))
                    CardView(MyCard: ReturnCard(x: 5))
                    CardView(MyCard: ReturnCard(x: 6))
                    CardView(MyCard: ReturnCard(x: 7))
                }
                HStack{
                    CardView(MyCard: ReturnCard(x: 8))
                    CardView(MyCard: ReturnCard(x: 9))
                    CardView(MyCard: ReturnCard(x: 10))
                    CardView(MyCard: ReturnCard(x: 11))
                }
                HStack{
                    CardView(MyCard: ReturnCard(x: 12))
                    CardView(MyCard: ReturnCard(x: 13))
                    CardView(MyCard: ReturnCard(x: 14))
                    CardView(MyCard: ReturnCard(x: 15))
                }
                HStack{
                    CardView(MyCard: ReturnCard(x: 16))
                    CardView(MyCard: ReturnCard(x: 17))
                    CardView(MyCard: ReturnCard(x: 18))
                    CardView(MyCard: ReturnCard(x: 19))
                }
                HStack{
                    CardView(MyCard: ReturnCard(x: 20))
                    CardView(MyCard: ReturnCard(x: 21))
                    CardView(MyCard: ReturnCard(x: 22))
                    CardView(MyCard: ReturnCard(x: 23))
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView: View {
    
    @State var MyCard:Card
    @EnvironmentObject var gameData:CardMatchData
    
    var body: some View {
        
        Button(action: {
            //Button only works as long as the button hasn't already been clicked
            if (self.MyCard.display == false){
                self.MyCard.display.toggle()
                //pushes clicked card onto the stack for comparison when two cards are selected by the match function
                self.gameData.StackofCards.push(self)
                self.Match()
                self.gameData.TotalMovesMade+=1
            }
        }){
            if(self.MyCard.display == false && self.MyCard.matched == false){
                Image("Pikachu")
                .renderingMode(.original)//this makes the button appear with original image instead of as just blue.
                .resizable()
                .aspectRatio(CGSize(width:1, height:1), contentMode: .fit)
                .cornerRadius(10)
                .padding(10)
                .shadow(radius: 5)
            }
            else{
                Text(MyCard.emoji)
                    .font(.system(size:28))
            }
        }
        .frame(width: 90.0, height: 110.0)
        //when the card is matched, it will become disabled and unable to flip.
        .disabled(self.MyCard.matched)
    }
    //Function that is called upon every button click and is used to check for when matches occur.
    func Match(){
        //makes sure the stack has enough cards to do the comparison, compares and in turn empties the stack.
        if(gameData.StackofCards.length()==2){
            let Card1 = gameData.StackofCards.pop()!
            let Card2 = gameData.StackofCards.pop()!
            Card1.MyCard.matched = Card1.MyCard.compare(otherCard: Card2.MyCard)
            Card2.MyCard.matched = Card1.MyCard.compare(otherCard: Card2.MyCard)
            
            //flips the two cards back when false
            if (Card1.MyCard.compare(otherCard: Card2.MyCard) == false){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    Card1.MyCard.display.toggle()
                    Card2.MyCard.display.toggle()
                }
            }
        }
    }
}

//The moves display
struct MovesDisplay: View{
    @EnvironmentObject var GameInfo:CardMatchData
    
    var body: some View{
        VStack{
            HStack{
                Text("  Moves Made: \(GameInfo.TotalMovesMade/2)")
                Spacer()
            }
            HStack{
                Text("  Best Finish: \(0)")//change to a stored data type
                Spacer()
            }
            Spacer()
        }
    }
}
