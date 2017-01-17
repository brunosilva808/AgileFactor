//
//  ProductCell.swift
//  Agile Factor
//
//  Created by Bruno Silva on 12/01/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit

//enum ColorEnum {
//    static var statusBarColor: UIColor?
//    static var navBarBarColor: UIColor?
//}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ProductCell: BaseCell  {
    
    // When a product is set to the cell
    var product: Product? {
        didSet {
            titleLabel.text = product?.title
            subTitleLabel.text = product?.points
            
            setupThumbnailImage()
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageURL = product?.thumbnailImageName {
            thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageURL)
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1)
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1), for: .normal)
        
        button.setTitle("Rebate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(buyButton)
        addSubview(separatorView)
        
        // thumbnail
        addConstraintsWithFormat(format: "V:|-16-[v0(100)]", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(100)]", views: thumbnailImageView)
        
        // titleLabel
        addConstraintsWithFormat(format: "V:|-16-[v0]", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-8-[v1]-16-|", views: thumbnailImageView, titleLabel)
        
        //        // titleLabel
        //        // top constraint
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16))
        //        // left constraint
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 8))
        //        // right constraint
        ////        addConstraint(NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 16))
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
        //        // height constraint
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // buyButton
        addConstraintsWithFormat(format: "V:[v0(30)]-16-|", views: buyButton)
        addConstraintsWithFormat(format: "H:[v0]-8-[v1(80)]-8-[v2]-16-|", views: thumbnailImageView, buyButton, subTitleLabel)
        
//        // subTitleLabel
        addConstraintsWithFormat(format: "V:[v0(30)]-16-|", views: subTitleLabel)
        
        // separatorView
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
    }
    
//    func setupViews1() {
//        addSubview(thumbnailImageView)
//        addSubview(separatorView)
//        addSubview(userProfileImageView)
//        addSubview(titleLabel)
//        addSubview(subTitleTextView)
//        
//        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
//        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
//        
//        // vertical constraints
//        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
//        
//        // TitleLabel
//        //top constraint
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
//        //left constraint
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
//        //right constraint
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
//        //height constraint
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
//        
//        // SubTitleLabel
//        //top constraint
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
//        //left constraint
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
//        //right constraint
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
//        //height constraint
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
//    }
    
}
