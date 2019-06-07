//
//  Amritpal_TableViewCell.swift
//  amrit_blue_tictactoe
//
//  Created by Singh Singh on 2019-05-29.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import UIKit

class Amritpal_TableViewCell: UITableViewCell {
    @IBOutlet weak var win_loss_image: UIImageView!
    @IBOutlet weak var who_won: UILabel!
    @IBOutlet weak var date_played: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
