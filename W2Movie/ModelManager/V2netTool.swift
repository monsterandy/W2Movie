//
//  V2netTool.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class V2netTool{
    
    private init(){}
    
    static let shared = V2netTool()

    func getLatestMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"latest"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        // http://192.168.1.247/latest.json
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"latest"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            latestData.removeAll()
            for i in 0..<json.count {
                latestData.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }
    
    func getClassicMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"classic"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"classic"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            classicData.removeAll()
            for i in 0..<json.count {
                classicData.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }

    func getDomesticMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"china"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"china"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            domesticData.removeAll()
            for i in 0..<json.count {
                domesticData.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }
    func getAmericaMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"america"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"america"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            americaData.removeAll()
            for i in 0..<json.count {
                americaData.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }
    
    func getHighScoreMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"high"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"high"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            highScoreData.removeAll()
            for i in 0..<json.count {
                highScoreData.append(HighScoreMovie(name: json[i]["name"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, imdbScore: json[i]["imdbScore"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }
    
    func getJapanMovieList(success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        // , parameters: ["index":"japan"]
        // http://172.24.85.94:8080/Web_hlx_crawl/hello
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":"japan"]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            japanData.removeAll()
            for i in 0..<json.count {
                japanData.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    }
    
    func getSearchResult(searchText: String, success:@escaping () -> Void, failure:@escaping () -> Void) {
        // the url
        let url = "http://172.24.16.113:8080/Web_hlx_crawl/hello"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: ["index":searchText]).responseJSON{ response in
            //  get data
            guard let data = response.result.value else{
                //  network error
                failure()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            let json = JSON(data)
            print(json.count)
            searchResult.removeAll()
            for i in 0..<json.count {
                searchResult.append(Movie(title: json[i]["title"].stringValue, url: json[i]["href"].stringValue, releaseTime: json[i]["releaseTime"].stringValue, decade: json[i]["decade"].stringValue, nation: json[i]["nation"].stringValue, specise: json[i]["specise"].stringValue, language: json[i]["language"].stringValue, imdbScore: json[i]["imdbScore"].stringValue, runTime: json[i]["runTime"].stringValue, director: json[i]["director"].stringValue, imageUrl: json[i]["imageUrl"].stringValue))
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            success()
        }
    
    
    }

    
}
