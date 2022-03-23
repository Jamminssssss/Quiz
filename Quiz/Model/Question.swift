//
//  Question.swift
//  Quiz
//
//  Created by jaemin park on 2022/03/20.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Question: Identifiable,Codable {
    
    @DocumentID var id: String?
    var question : String?
    var optionA: String?
    var optionB: String?
    var optionC: String?
    var optionD: String?
    var answer: String?

    var isSubmitted = false
    var completed = false
    
    enum CodingKeys: String,CodingKey {
        
        case question
        case optionA = "a"
        case optionB = "b"
        case optionC = "c"
        case optionD = "d"
        case answer
    }
}
