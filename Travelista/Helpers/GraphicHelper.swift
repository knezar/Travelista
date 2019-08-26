//
//  MapLauncher.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import UIKit

class GraphicHelper: NSObject {

    override init(){
        super.init()
    }
    let myView = UIView()
    
    func flipView(firstView: UIView, secondView: UIView){
        let transitionOptions: UIView.AnimationOptions = [.showHideTransitionViews]
        UIView.transition(with: firstView, duration: 0.5, options: transitionOptions, animations: {
            firstView.isHidden = true
            secondView.isHidden = false
//            firstView.alpha = 0.5
//            secondView.alpha=1
        })
    }
    
    func dimmScreen(view: UIView) -> UIView{
        view.addSubview(myView)
        myView.frame = view.frame
        myView.tag = 100
        myView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        UIView.animate(withDuration: 0.5) {
            self.myView.alpha = 1
        }
        return myView
    }
    
    func dismissDimmedView() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
           self.myView.alpha = 0
        }, completion: {(finished:Bool) in
            if let viewWithTag = self.myView.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
            }
        })
    }
    
    func animateDropDownSearch(searchBar: UIView, collectionView: UICollectionView) {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
//            view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height + 5)
//        }, completion: nil)
        UIView.animate(withDuration: 0.2, animations: {
            searchBar.frame.origin.y -= 60
            searchBar.frame.origin.y -= 35
        }, completion:  nil)
        UIView.animate(withDuration: 0.7, animations: {
            collectionView.alpha = 1
        }, completion:  nil)
        

    }
    func animateDropDownView (view: UIView, constraint: NSLayoutConstraint, constraintConstant: CGFloat) {
        UIView.animate(withDuration: 10) {
            constraint.constant = -50
            view.layoutIfNeeded()
            
        }
    }
    func dismissMap (view: UIView) {
        UIView.animate(withDuration: 0.5) {
            view.frame = CGRect(x: 0, y: -view.frame.height, width: view.frame.width, height: view.frame.height)
        }
    }
    
    func setNavBarImages(image: UIImage, width: CGFloat) -> UIButton {
        let imageView = UIImageView()
        if width == CGFloat(35) {
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 2
        } else {
            imageView.contentMode = .scaleAspectFit
        }
        imageView.layer.cornerRadius = width/2
        imageView.clipsToBounds = true
        imageView.image = image.withRenderingMode(.alwaysOriginal)
        imageView.isUserInteractionEnabled = false
        let button = UIButton(type: .custom)
        button.adjustsImageWhenHighlighted = true
        button.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return button
    }
}
