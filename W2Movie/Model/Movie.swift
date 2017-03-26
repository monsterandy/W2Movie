//
//  Movie.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import Foundation


class Movie: NSObject {
    var title: String  // 大标题
    var url: String  // URL
//    var name: String  // 译名
    var releaseTime: String  // 发布时间
//    var translationName: String  // 片名
    var decade: String  // 年代
    var nation: String  // 国家
    var specise: String  // 类别
    var language: String  // 语言
//    var subtitle: String  // 字幕
//    var showTime: String  // 上映日期
    var imdbScore: String  // IMDb评分
//    var doubanScore: String  // 豆瓣评分
    var runTime: String  // 片长
    var director: String  // 导演
    var imageUrl: URL
//    var starring: String  // 主演
//    var introduction: String  // 简介
//    var awards: String  // 获奖情况
//    var downloadAddress: String  // 下载地址
    init(title: String, url:String, releaseTime: String, decade: String, nation: String, specise: String, language: String, imdbScore: String, runTime: String, director: String, imageUrl: String) {
        self.title = title
        self.url = url
//        self.name = name
        self.releaseTime = releaseTime
//        self.translationName = translationName
        self.decade = decade
        self.nation = nation
        self.specise = specise
        self.language = language
//        self.subtitle = subtitle
//        self.showTime = showTime
        self.imdbScore = imdbScore
//        self.doubanScore = doubanScore
        self.runTime = runTime
        self.director = director
        self.imageUrl = URL(string: imageUrl)!
//        self.starring = starring
//        self.introduction = introduction
//        self.awards = awards
//        self.downloadAddress = downloadAddress
    }
}

var latestData: [Movie] = []
var classicData: [Movie] = []
var domesticData: [Movie] = []
var americaData: [Movie] = []
var japanData: [Movie] = []
var searchResult: [Movie] = []


