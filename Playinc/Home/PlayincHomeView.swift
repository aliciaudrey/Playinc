//
//  PlayincHomeView.swift
//  Playinc
//
//  Created by audrey on 27/07/22.
//

import SwiftUI

struct PlayincHomeView: View {
    @State var isOpen : Bool = false
    @State var isPlayNow: Bool = false
    var body: some View {
        ZStack(alignment: .trailing){
            Image("SuperGraphic")
            VStack(alignment:.trailing){
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding(.trailing, 40)
                    .padding(.top, 40)
                    .onTapGesture {
                        isOpen.toggle()
                    }
                Spacer()
            }
            VStack(spacing:36){
                Spacer()
                Image("Logo")
                Button {
                    isPlayNow.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 30.5)
                        .fill(Color("playincYellow"))
                        .frame(maxWidth: 310, maxHeight: 51, alignment: .center)
                        .overlay(
                            Text("Play Now").font(.system(size: 22.0, weight:.bold, design: .rounded)).foregroundColor(Color(.sRGB, red: 37/255, green: 69/255, blue: 132/255, opacity: 100))
                            )
                }
                Spacer()
                
            }
            .padding(.horizontal,70)
            .frame(width: 390, height: 844, alignment: .topTrailing)
            ZStack(alignment: .trailing){
                VStack(alignment:.trailing){
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .padding(.trailing, 40)
                        .padding(.top, 40)
                        .onTapGesture {
                            isOpen.toggle()
                        }
                    Spacer()
                }
                ZStack(alignment:.center) {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.5)
                    .ignoresSafeArea()
                    Image("HowToPlay")
                }
            }
            .opacity(isOpen ? 1 : 0)
            
        }.background(playincColor.blue)
            .fullScreenCover(isPresented: $isPlayNow) {
                PlayerNumber()
            }
    }
}

struct PlayincHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlayincHomeView()
    }
}

struct playincColor {
    static let blue: Color = Color("playincBlue")
}
