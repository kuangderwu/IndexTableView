//
//  IndexTableViewCell.swift
//  IndexTableView
//
//  Created by Mac on 2/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
