//
//  AppsController.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/30/23.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "id"
    let headerID = "headerID"
    
    let activitiyIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        view.addSubview(activitiyIndicatorView)
        activitiyIndicatorView.fillSuperview()
        fetchData()
    }
    
    var socialApps = [SocialApp]()
    var groups = [AppGroup]()
    
    var group1: AppGroup?
    var group2: AppGroup?
    var group3: AppGroup?
    var group4: AppGroup?
    var group5: AppGroup?
    var group6: AppGroup?
    
    fileprivate func fetchData() {
 // sync you data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTheApps { (appGroup, err) in
            print("Albums")
            dispatchGroup.leave()
            self.group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchMusicVideos { (appGroup, err) in
            print("Videos")
            dispatchGroup.leave()
            self.group2 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchPodcasts { (appGroup, err) in
            print("Podcast")
            dispatchGroup.leave()
            self.group3 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchBooks { (appGroup, err) in
            print("Books")
            dispatchGroup.leave()
            self.group4 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchAudioBook { (appGroup, err) in
            dispatchGroup.leave()
            self.group5 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchPlayedAlbums { (appGroup, err) in
            dispatchGroup.leave()
            self.group6 = appGroup
        }
        
        Service.shared.fetchSocialApps { (apps, err) in
            // check err
            self.socialApps = apps ?? []
            
        }
        // Completion
        dispatchGroup.notify(queue: .main) {
            print("Completed dispatch grouping tasks...")
            
            self.activitiyIndicatorView.stopAnimating()
            
            if let group = self.group1 {
                self.groups.append(group)
            }
            if let group = self.group2 {
                self.groups.append(group)
            }
            if let group = self.group3 {
                self.groups.append(group)
            }
            if let group = self.group4 {
                self.groups.append(group)
            }
            if let group = self.group5 {
                self.groups.append(group)
            }
            if let group = self.group6 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizonalController.socialApps = self.socialApps
        header.appHeaderHorizonalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        
        let appGroup = groups[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self]
            feedResult in
            
            let controller = AppDetailController(appId: feedResult.id)
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
