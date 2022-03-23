//
//  QuestionView.swift
//  Quiz
//
//  Created by jaemin park on 2022/03/20.
//

import SwiftUI

struct QuestionView: View {
    @Binding var quesion: Question
    @Binding var correct: Int
    @Binding var wrong: Int
    @Binding var answered: Int
    
    @State var selected = ""
    
    var body: some View {
        
        VStack(spacing: 22){
        
        Text(quesion.question!)
            .font(.system(size: 16))
            .fontWeight(.heavy)
            .foregroundColor(.black)
            .padding(.top,25)
        
        Spacer(minLength: 0)
        
            Button(action: {selected = quesion.optionA!}, label: {
            Text(quesion.optionA!)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(color(option: quesion.optionA!),lineWidth: 1)
                    )
        })
        Button(action: {selected = quesion.optionB!}, label: {
            Text(quesion.optionB!)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color(option: quesion.optionB!),lineWidth: 1)
                )
        })
        Button(action: {selected = quesion.optionC!}, label: {
            Text(quesion.optionC!)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color(option: quesion.optionC!),lineWidth: 1)
                )
        })
        Button(action: {selected = quesion.optionD!}, label: {
            Text(quesion.optionD!)
                .foregroundColor(.black)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(color(option: quesion.optionD!),lineWidth: 1)
                )
        })
    Spacer(minLength: 0)
        
            HStack(spacing: 15){
               
                Button(action: checkAns, label: {
                    Text("확인")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                })
                    .disabled(quesion.isSubmitted ? true : false)
                    .opacity(quesion.isSubmitted ? 0.7 : 1)
                
                    Button(action: {
                        withAnimation{
                            quesion.completed.toggle()
                            answered += 1
                        }
                    }, label: {
                        Text("다음문제")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(15)
                    })
                    .disabled(!quesion.isSubmitted ? true : false)
                    .opacity(!quesion.isSubmitted ? 0.7 : 1)

            }
            .padding(.bottom)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
    }
    func color(option: String)->Color{
        
        if option == selected{
            
            if quesion.isSubmitted{
                if selected == quesion.answer!{
                    return Color.green
                }
                else{
                    return Color.red
                }
            }
            else{
                return Color.blue
            }
        }
        else{
            if quesion.isSubmitted && option != selected{
                
                if quesion.answer! == option{return Color.green}
            }
            return Color.gray
        }
    }

    func checkAns(){
        if selected == quesion.answer!{
            correct += 1
        }
        else{
            wrong += 1
        }
        quesion.isSubmitted.toggle()
    }
}

