//
//  ViewController.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/10/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class SearchShowsViewController: UIViewController {
    @IBOutlet weak var tvShowTableView: UITableView!
    @IBOutlet weak var tvShowSearchBar: UISearchBar!
    
    var tvShows = [Shows]() {
        didSet {
            self.tvShowTableView.reloadData()
        }
    }
    
    var searchString: String? = nil {
        didSet {
            guard let searchString = searchString else {return}
            guard searchString != "" else {return}
            let newUrl = UrlHolder().searchShowsQuery(string: searchString)
            loadData(url: newUrl)
            tvShowTableView.reloadData()
        }
    }
    
    private func loadData(url: String) {
        Show.getShows(urlString: url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let showsFromSearch):
                    self.tvShows = showsFromSearch
                    //dump(self.tvShows)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tvShowTableView.dataSource = self
        tvShowTableView.delegate = self
        tvShowSearchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? EpisodesTableViewController, let indexPath = tvShowTableView.indexPathForSelectedRow else {return}
        destination.show = tvShows[indexPath.row]
    }
}

extension SearchShowsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tvShowTableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? SearchShowTableViewCell else {return UITableViewCell()}
        let show = tvShows[indexPath.row]
        cell.showNameLabel.text = show.show.name
        if let rating = show.show.rating.average {
            cell.showRatingLabel.text = "Rating: \(rating)"
        } else {
            cell.showRatingLabel.text = "Rating: null"
        }
        
        if let image = show.show.image {
            ImageHelper.shared.getImage(urlString: image.medium) {(result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromUrl):
                    DispatchQueue.main.async {
                        cell.showImageView.image = imageFromUrl
                    }
                }
            }
        } else {
            cell.showImageView.image = UIImage(named: "noImage")
        }
        return cell
    }
}

extension SearchShowsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 312
    }
}

extension SearchShowsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}
