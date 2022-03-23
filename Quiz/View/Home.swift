//
//  Home.swift
//  Quiz
//
//  Created by jaemin park on 2022/03/20.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    
    @State var set = "Round_1"
    
    @State var correct = 0
    @State var wrong = 0
    @State var answered = 0
    
    var body: some View {
        VStack{
                        Image("Image")
                         .resizable()
                         .padding()
                         .font(.title)
                            
                        
                        Text("N5 Words")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Level1")
                            .foregroundColor(.black)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .onTapGesture (perform: {
                        set = "Round_1"
                        show.toggle()
                    
                    })
                    
                    .background(Color.black.opacity(0.05)).ignoresSafeArea()
                    .sheet(isPresented: $show, content: {
                        
                        QA(correct: $correct, wrong: $wrong,answered: $answered,set: set)
                    })
           }
}
  


