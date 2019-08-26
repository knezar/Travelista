//
//  ViewController.swift
//  latifaTravels
//
//  Created by C4Q on 7/13/19.
//  Copyright © 2019 FoodStepProject. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftLocationButton: AirPortButtonView!
    @IBOutlet weak var rightLocationButton: AirPortButtonView!
    @IBOutlet var dropDownSearchView: UIView!
    @IBOutlet weak var topBackgroundView: UIView!
    @IBOutlet weak var mapBGImageView: UIImageView!
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var switchImgView: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var checkBox: UIButton!
    let graphicHelper = GraphicHelper()
    let selectedItem = IndexPath(item: 0, section: 0)
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()  {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTextField()
        leftLocationButton.delegate = self
        rightLocationButton.delegate = self
        searchCompleter.delegate = self

        
        
    }
    override func viewDidAppear(_ animated: Bool) {
       setupNavBar()
    }
    func setupNavBar() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Cancel")?.withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Cancel")
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .red
        self.logoImgView.layer.cornerRadius = (self.logoImgView.bounds.height) / 2
        logoImgView.layer.borderColor = UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1).cgColor
    }
    func setupTextField() {
        textFieldView.layer.masksToBounds = true
        textFieldView.layer.cornerRadius = 25
        textFieldView.layer.borderWidth = 2
        textFieldView.layer.borderColor = UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1).cgColor
        textFieldView.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            tableView.isHidden = true
        } else {
            tableView.isHidden = false
        }
    }
    func setupCollectionView() {
        topCollectionView.layer.backgroundColor = UIColor.white.cgColor
        topCollectionView.layer.borderWidth = 2
        topCollectionView.layer.borderColor = UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1).cgColor
        topCollectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
        bottomCollectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
   
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        let originX = checkBox.frame.origin.x
        let originY = checkBox.frame.origin.y
        let height:CGFloat = 20
        let width: CGFloat = 20
        if sender.isSelected == true {
            checkBox.frame = CGRect(x: originX, y: originY+5, width: width, height: height)
//            checkBox.setNeedsLayout()
        } else {
            checkBox.frame = CGRect(x: originX, y: originY-5, width: width+5, height: height+5)
        }
        sender.isSelected = !sender.isSelected

    }
    
    @IBAction func switchButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
    }
//    func flip() {
//        if flipEnabled {
//            flipEnabled = false
//
//        }
//    }
    func setupTapGesture(view: UIView) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissDropDownSearch))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissDropDownSearch() {
        graphicHelper.flipView(firstView: textFieldView, secondView: topCollectionView)
        graphicHelper.dismissDimmedView()
        textFieldView.resignFirstResponder()
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var reusableCell = ""
        if collectionView.tag == topCollectionView.tag {
            reusableCell = "topButtonCell"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCell, for: indexPath) as! CollectionViewCell
            let myArr = ["OneWay", "Round Trip", "MultiCity"]
            cell.topButtonLabelView.text = myArr[indexPath.item]
            cell.layer.cornerRadius = 25
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 4
            cell.layer.borderColor = UIColor.white.cgColor
   
            return cell
        } else {
            reusableCell = "bottomButtonCell"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCell, for: indexPath) as! BottomCollectionViewCell
            let myArr =  ["Economy", "Business", "First Class"]
            cell.bottomCollectionLabel.text = myArr[indexPath.item]
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size:CGSize?
        if collectionView.tag == topCollectionView.tag {
            size = CGSize(width: ((view.frame.width - 40) / 3), height: 50)
        } else {
            size = CGSize(width: (view.frame.width - 92) / 3, height: 40)
        }
        return size!
    }
}

extension UIView {
    func setGradient (colorOne: UIColor, colorTwo: UIColor) {
        let tintLayer = CAGradientLayer()
        tintLayer.frame = bounds
        tintLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        tintLayer.locations = [0, 1]
        tintLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        tintLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.insertSublayer(tintLayer, at: 0)
    }
}

extension UIColor {
    static func getRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension ViewController: SampleButtonViewDelegate {
    func sampleButtonTapped(_ button: AirPortButtonView) {
        let dimmedView = self.graphicHelper.dimmScreen(view: mainView)
        setupTapGesture(view: dimmedView)
        graphicHelper.flipView(firstView: topCollectionView, secondView: textFieldView)
        textFieldView.becomeFirstResponder()        
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldView {
            searchCompleter.filterType = .locationsAndQueries
            searchCompleter.queryFragment = "\(textFieldView.text!) Airport"
        }
        return true
    }
}

// -MARK-
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = searchResult.title
        return cell
    }
    
    
}


extension ViewController: MKLocalSearchCompleterDelegate {
//
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        //        let charset = CharacterSet(charactersIn: "1234567890")
        searchResults = completer.results.filter({!$0.title.contains("1234")})
//        completer.results[0]
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}
