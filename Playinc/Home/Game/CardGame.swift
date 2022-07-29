//
//  CardGame.swift
//  Playinc
//
//  Created by audrey on 28/07/22.
//

import SwiftUI

struct CardGame: View {
    @Binding var arrayOfPlayer: [String]
    @State var currentIndex: Int = 0
    @Binding var number: Int
    @State var questionIndex: Int = 1
    @State var isEndGame: Bool = false
    var body: some View {
        ZStack(){
            Image("SuperGraphic")
                .background(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
            VStack(alignment: .center) {
                HStack {
                    Text("To: ")
                        .font(.system(size: 22.0, weight:.bold, design: .rounded))
                        .foregroundColor(.white)
                    Text("\(arrayOfPlayer[currentIndex])")
                        .font(.system(size: 22.0, weight:.bold, design: .rounded))
                        .foregroundColor(Color("playincYellow"))
                }
                .padding(.top, 16)
                Spacer()
                Image("Q\(questionIndex)")
                Button {
                    isEndGame.toggle()
                } label: {
                    Text("End Game")
                        .underline(true, color: .white)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }

                Spacer()
                Button {
                    currentIndex = Int.random(in: 0..<number)
                    questionIndex = Int.random(in: 1...12)
                } label: {
                    RoundedRectangle(cornerRadius: 30.5)
                        .fill(Color("playincYellow"))
                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
                        .overlay(
                            Text("Next").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
                            )
                }

            }
            .padding(.vertical,36)
        }.onAppear {
            currentIndex = Int.random(in: 0..<number)
        }.fullScreenCover(isPresented: $isEndGame) {
            EndGame()
        }
    }
}

//struct CardGame_Previews: PreviewProvider {
//    static var previews: some View {
//        CardGame()
//    }
//}
