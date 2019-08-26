//
//  ViewController.swift
//  CollectionView
//
//  Created by    Ankit on 20/10/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit

class ResultDisplayController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let graphicHelper = GraphicHelper()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 300.0
    let unselectedCellHeight: CGFloat = 140.0


    let imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewController()
    }
    func setupTableViewController() {
        tableView.estimatedRowHeight = 100
        let selectedItem = IndexPath(item: 3, section: 0)
        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        } else {
            return 10
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCellID = "tableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath) as? TableViewCell
        {
            return cell
        }
        return UITableViewCell()
    }
}

extension ResultDisplayController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "daysCollectionCell", for: indexPath) as! DaysCollectionViewCell
        cell.daysLabel.text = imageArray[indexPath.row]
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 25
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 50, height: 50)
        return size
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToMenuIndex(menuIndex: indexPath.item)
    }
}
