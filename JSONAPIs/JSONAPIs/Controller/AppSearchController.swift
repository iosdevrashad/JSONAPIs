//
//  AppSearchController.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/26/23.
//

import UIKit
import SDWebImage

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap 🔍 to get started..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.anchor(top: collectionView.topAnchor, leading: collectionView.leadingAnchor, bottom: collectionView.bottomAnchor, trailing: collectionView.trailingAnchor, padding: .init(top: 150, left: 100, bottom: -100, right: 20))
        enterSearchTermLabel.animate(view: view)
        
        setupSearchBar()

    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
       
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // introduce deplay before performing search
        // throttling
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                self.appResults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    fileprivate var appResults = [AppsResult]()
    
    // extract the function fectchITunesApps() outside of this controller file.


    
    
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps(searchTerm: "Twitter") { (results, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        // need to return search results.
        // use a completion block 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        
        return cell
    }
}
