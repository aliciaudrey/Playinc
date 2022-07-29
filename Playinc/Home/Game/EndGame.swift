//
//  EndGame.swift
//  Playinc
//
//  Created by audrey on 28/07/22.
//

import SwiftUI

struct EndGame: View {
    @State var isDone: Bool = false
    var body: some View {
        ZStack(){
            Image("SuperGraphic")
                .background(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
            
            VStack(){
                Image("Text3")
                Image("CardEnd")
                    .padding(24)
                Button {
                    isDone.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 30.5)
                        .fill(Color("playincYellow"))
                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
                        .overlay(
                            Text("Done").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
                            )
            }
            }
        }.fullScreenCover(isPresented: $isDone) {
            PlayincHomeView()
        }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame()
    }
}
}
