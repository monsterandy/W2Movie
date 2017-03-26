//
//  MovieDetailViewController.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit
import SafariServices
import SDWebImage

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var releaseTime: UILabel!
    @IBOutlet weak var decade: UILabel!
    @IBOutlet weak var nation: UILabel!
    @IBOutlet weak var specise: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var imdbScore: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var detailNum: Int = 0
    var sourceViewNum: Int = 0
    var movie: Movie = latestData[0]

    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.syncData()
        
        movieTitle.text = movie.title
        director.text = movie.director
        releaseTime.text = movie.releaseTime
        decade.text = movie.decade
        nation.text = movie.nation
        specise.text = movie.specise
        language.text = movie.language
        if movie.imdbScore == "" {
            imdbScore.text = "暂无"
        }
        else {
            imdbScore.text = movie.imdbScore
        }
        runTime.text = movie.runTime
        image.sd_setImage(with: movie.imageUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func syncData() {
        switch sourceViewNum {
        case 0:
            movie = latestData[detailNum]
        case 1:
            movie = classicData[detailNum]
        case 2:
            movie = domesticData[detailNum]
        case 3:
            movie = americaData[detailNum]
        case 6:
            movie = japanData[detailNum]
        case 10:
            movie = searchResult[detailNum]
        default:
            movie = latestData[detailNum]
        }

    }

    
    
    @IBAction func outTapped(_ sender: Any) {
        let url = URL(string: movie.url)
        let safariController = SFSafariViewController(url: url!, entersReaderIfAvailable: true)
        self.present(safariController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
