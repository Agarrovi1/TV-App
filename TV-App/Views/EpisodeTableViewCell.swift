//
//  EpisodeTableViewCell.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet weak var seasonEpNumberLabel: UILabel!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
