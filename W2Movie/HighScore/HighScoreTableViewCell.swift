//
//  HighScoreTableViewCell.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/21.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseTime: UILabel!
    @IBOutlet weak var imdbScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
