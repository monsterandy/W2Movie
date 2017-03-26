//
//  SpeciesTableViewCell.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell {

    @IBOutlet weak var speciesImageView: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
