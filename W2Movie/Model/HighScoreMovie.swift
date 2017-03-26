//
//  HighScoreMovie.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/21.
//  Copyright © 2017年 Andy. All rights reserved.
//

import Foundation

class HighScoreMovie: NSObject {
    var name: String
    var releaseTime: String
    var imdbScore: String
    init(name: String, releaseTime: String, imdbScore: String) {
        self.name = name
        self.releaseTime = releaseTime
        self.imdbScore = imdbScore
    }
}

var highScoreData: [HighScoreMovie] = []


