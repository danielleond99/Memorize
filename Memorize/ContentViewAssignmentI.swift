//
//  ContentViewAssignmentI.swift
//  Memorize
//
//  Created by Daniel Leon on 2/8/24.
//

import SwiftUI

enum Theme: String {
    case Sports, Cars, Flags
}

struct CardViewAssignmentI: View{
    var content: String;
    @State var isFaceUp = false
    
    
    func toggleCard() {
        isFaceUp.toggle()
    }
    
    var body: some View{
        let baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
        ZStack{
            baseRoundedRectangle.foregroundColor(.white)
            baseRoundedRectangle.strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
            baseRoundedRectangle.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture(perform:toggleCard)
    }
    
}

struct ContentViewAssignmentI: View {
    @State var themeSelected = Theme.Sports
    @State var contentCards: [Theme: [String]] = [
        Theme.Sports: ["⚾️","🤼","⚾️","🤼","🤾🏻","🤺","🤾🏻","🤺"],
        Theme.Flags: ["🇩🇴","🇨🇽","🇩🇴","🇨🇽","🇻🇨","🇧🇦","🇻🇨","🇧🇦"],
        Theme.Cars: ["🚗","🚘","🚗","🚘","🚔","🚕","🚔","🚕"]]
    
    func themeButton(theme: Theme, imageSystemName: String) -> some View {
        Button(action: {
            themeSelected = theme;
            contentCards[theme]!.shuffle()
        }, label: {
        VStack{
            Image(systemName: imageSystemName).imageScale(.large).font(.largeTitle)
            Text(theme.rawValue)
        }
    }).font(.title2).padding(.horizontal, 20)
    }
        
    var body: some View{
        Text("Memorize!").font(.largeTitle)
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], content: {
                ForEach(0..<8, id: \.self ){ index in
                    CardViewAssignmentI(content:  contentCards[themeSelected]![index]).aspectRatio(3/5, contentMode: .fit)
                }
            })
            .foregroundColor(.red).padding()}
        Spacer()
        HStack{
            themeButton(theme: Theme.Sports, imageSystemName: "sportscourt")
            themeButton(theme: Theme.Cars, imageSystemName: "car.rear")
            themeButton(theme: Theme.Flags, imageSystemName: "flag")
        }
        
    }
    
    
}

#Preview {
    ContentViewAssignmentI()
}
