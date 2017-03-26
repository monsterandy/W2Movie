//
//  MovieCellTableViewCell.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var releaseTime: UILabel!
    @IBOutlet weak var decade: UILabel!
    @IBOutlet weak var specise: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        specise.layer.masksToBounds = true
        specise.layer.cornerRadius = 3
        // Initialization code
//        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
