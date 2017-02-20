//
//  LoadingView.swift
//  Agile Factor
//
//  Created by Bruno Silva on 20/02/2017.
//  Copyright © 2017 Bruno Silva. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

let TAG = 999


class LoadingView: UIView {
    
    static let activityIndicatorView: NVActivityIndicatorView = {
        let activity = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                               type: NVActivityIndicatorType.ballRotateChase,
                                               color: nil, padding: nil)
        let bounds = UIScreen.main.bounds
        activity.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        return activity
    }()
    
    static func show(view: UIView, completion: () -> ()) {
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = UIColor.darkGray
        backgroundView.alpha = 0.0
        backgroundView.addSubview(activityIndicatorView)
        backgroundView.tag = TAG
        
        view.addSubview(backgroundView)
        
        UIView.animate(withDuration: 0.3, animations: {
            backgroundView.alpha = 0.5
        }) { (bool) in
            if bool == true {
                self.activityIndicatorView.startAnimating()
            }
        }
        
        completion()
    }
    
    static func hide(view: UIView, completion: () -> ()) {
        UIView.animate(withDuration: 0.3, animations: {
            view.viewWithTag(TAG)?.alpha = 0.0
        }) { (bool) in
            if bool == true {
                view.viewWithTag(TAG)?.removeFromSuperview()
            }
        }
        
        completion()        
    }
    
}
