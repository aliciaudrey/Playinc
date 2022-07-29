//
//  PlayerNumber.swift
//  Playinc
//
//  Created by audrey on 27/07/22.
//

import SwiftUI

struct PlayerNumber: View {
    @State var number: Int = 2
    @State var isNext: Bool = false
    var body: some View {
        ZStack(){
            Image("SuperGraphic")
            
            VStack(spacing:36){
                Image("Text1")
                ZStack(){
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .frame(maxWidth: .infinity, maxHeight: 48, alignment: .leading)
                        .padding(36)
                
                    Picker("Please choose how many player", selection: $number){
                        Text("2 Players").tag(2)
                        Text("3 Players").tag(3)
                        Text("4 Players").tag(4)
                        Text("5 Players").tag(5)
                        Text("6 Players").tag(6)
                    }
                
                    .pickerStyle(.wheel)
                    .frame(maxWidth: 246, maxHeight: 22)
                    .clipped()
                }
            }
            VStack{
                Spacer()
                Button {
                    isNext.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 30.5)
                        .fill(Color(.sRGB, red: 230/255, green: 205/255, blue: 92/255, opacity: 100))
                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
                        .overlay(
                            Text("Next").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
                            )
                }.fullScreenCover(isPresented: $isNext) {
                    PlayerNames(number: $number)
                }

//                Button {
//                } label: {
//                    RoundedRectangle(cornerRadius: 30.5)
//                        .fill(Color(.sRGB, red: 230/255, green: 205/255, blue: 92/255, opacity: 100))
//                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
//                        .overlay(
//                            Text("Next").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
//                            )
//                }
//                .padding(.bottom, 64)
            }
        }

        .background(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
    }
}

struct PlayerNumber_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNumber()
    }
}

