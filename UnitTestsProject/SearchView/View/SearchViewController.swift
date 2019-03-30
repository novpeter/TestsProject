//
//  SearchViewController.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SearchViewInput {
    
    /// Table view
    @IBOutlet weak var tableView: UITableView!
    
    /// Presenter
    var searchPresenter: SearchViewOutput!
    
    /// Search controller
    var searchController: UISearchController!
    
    /// Content
    var content: [ResponseResult]!
    
    /// Cache
    lazy var cashedDataSource: NSCache<AnyObject, UIImage> = {
        
        let cashe = NSCache<AnyObject, UIImage>()
        return cashe
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
   
    
    // MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifires.cell.rawValue, for: indexPath) as! SearchResultCell
        let result = content[indexPath.row]
        
        if let imagePath = result.artworkUrl60 {
         
            if let image = cashedDataSource.object(forKey: imagePath as AnyObject) {
                cell.avatarImageView.image = image
            }
            else {
                
                if let imageUrl =  URL(string: imagePath) {
                    
                    let image = UIImage(data: try! Data(contentsOf: imageUrl))
                    cell.avatarImageView.image = image
                    cashedDataSource.setObject(image!, forKey: imagePath as AnyObject)
                    tableView.reloadRows(at: [indexPath], with: .fade)
                }
            }
        }
        
        cell.configureCell(result: result)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: content[indexPath.row].trackViewUrl ?? "") {
            showWebsite(with: url)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    /// Opens safari window
    ///
    /// - Parameter url: given url
    func showWebsite(with url: URL?) {
        
        guard let url = url else { return }
        
        let webVC = SFSafariViewController(url: url)
        present(webVC, animated: true, completion: nil)
    }
    
    func updateContent(with models: [ResponseResult]) {
                
        DispatchQueue.main.async { [weak self] in
            
            self?.content = models
            self?.tableView.reloadData()
        }
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension SearchViewController: UISearchResultsUpdating, SFSafariViewControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchPresenter.search(for: searchController.searchBar.text!)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

