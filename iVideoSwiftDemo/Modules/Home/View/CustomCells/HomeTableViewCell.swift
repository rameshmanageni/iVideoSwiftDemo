//
//  HomeTableViewCell.swift
//  iVideoSwiftDemo
//
//  Created by Redbytes on 18/05/17.
//  Copyright © 2017 Redbytes. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var title: PaddingLabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
