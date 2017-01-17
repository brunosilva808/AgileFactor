//
//  ProductsViewController.swift
//  Agile Factor
//
//  Created by Bruno Silva on 10/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProductsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var products: [Product]?
    
    func fetchVideos() {
        LibraryAPI.sharedInstance.fetchVideosAlamofire { (products) in
            self.products = products
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - Class Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        fetchVideos()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCell
        
        cell.product = products?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // Margin = 16
//        let height = (view.frame.width - 16 - 16) * 9/16
//        // Constraints Vertical Value 68
//        return CGSize(width: view.frame.width, height: height + 16 + 68)
//        
        return CGSize(width: view.frame.size.width, height: 132)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}




