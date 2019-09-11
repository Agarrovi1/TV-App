//
//  EpisodesTableViewController.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    
    var show: Shows?
    var episodes = [Episode]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private func loadEpisodes() {
        guard let show = show else {return}
        let newUrl = UrlHolder().episode(by: show.show.id)
        Episode.getEpisodes(url: newUrl) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let episodesFromUrl):
                DispatchQueue.main.async {
                    self.episodes = episodesFromUrl
                    dump(self.episodes)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEpisodes()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeTableViewCell else {return UITableViewCell()}
        let episode = episodes[indexPath.row]
        cell.episodeNameLabel.text = episode.name
        cell.seasonEpNumberLabel.text = episode.getSeasonEpisode()
        if let image = episode.image {
            ImageHelper.shared.getImage(urlString: image.medium) { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromUrl):
                    DispatchQueue.main.async {
                        cell.episodeImageView.image = imageFromUrl
                    }
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }

    

    

    

    

    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    */

}
