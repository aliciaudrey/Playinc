//
//  PlayerNames.swift
//  Playinc
//
//  Created by audrey on 28/07/22.
//

import SwiftUI

struct PlayerNames: View {
    @Binding var number : Int
    @State var isNext: Bool = false
    @State var arrayOfPlayer: [String] = ["Player 1",
                                          "Player 2",
                                          "Player 3",
                                          "Player 4",
                                          "Player 5",
                                          "Player 6"]
    init(number: Binding<Int>) {
        self._number = number
    }
    
    var body: some View {
        ZStack() {
            Image("SuperGraphic")
                .background(Color("playincBlue"))
            VStack {
                Image("Text2")
                ForEach(0..<number, id: \.self){i in
                    PlayerCell(playerName: $arrayOfPlayer[i]).padding()
                }
                Button {
                    isNext.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 30.5)
                        .fill(Color("playincYellow"))
                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
                        .overlay(
                            Text("Start").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
                            )
                }.fullScreenCover(isPresented: $isNext) {
                    CardGame(arrayOfPlayer: $arrayOfPlayer, number: $number)
                }
            }
        }
    }
}
           

//struct PlayerNames_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerCell()
//    }
//
//}}


struct PlayerCell: View {
    @Binding var playerName: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
            HStack{
                Image("Icon1")
                TextField(text: $playerName) {
                    
                }.font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(playincColor.blue)
                    .padding(.horizontal,20)
                Spacer()
                
            }.padding()
        } .frame(width: 310, height: 64)
        
    }
}
