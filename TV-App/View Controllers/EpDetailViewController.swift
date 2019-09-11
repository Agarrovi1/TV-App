//
//  EpDetailViewController.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class EpDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var episode: Episode?
    
    private func loadEpData() {
        guard let episode = episode else {return}
        detailNameLabel.text = episode.name
        seasonEpisodeLabel.text = episode.getSeasonEpisode()
        if let summary = episode.summary, summary != "" {
            
            summaryTextView.text = summary.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
        } else {
            summaryTextView.text = "No Summary Available"
        }
    }
    
    private func loadImage() {
        guard let episode = episode else {return}
        if let image = episode.image {
            ImageHelper.shared.getImage(urlString: image.medium) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromUrl):
                    DispatchQueue.main.async {
                        self.detailImageView.image = imageFromUrl
                    }
                }
            }
        } else {
            detailImageView.image = UIImage(named: "noImage")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEpData()
        loadImage()
    }

}
