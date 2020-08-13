//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Andrés Berumen on 23/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, o: [String], a: String) {
        text = q
        options = o
        answer = a
    }
}
