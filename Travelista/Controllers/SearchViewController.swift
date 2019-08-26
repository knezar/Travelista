////
////  SearchViewController.swift
////  latifaTravels
////
////  Created by C4Q on 7/13/19.
////  Copyright © 2019 FoodStepProject. All rights reserved.
//
//
import UIKit
import MapKit
//
protocol ReceiveDataLocation {
    func searchDataReceived(data: String)
}

class SearchViewController: UIViewController {

    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var cancelButtonView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    var delegate: ReceiveDataLocation?
    let graphicHelper = GraphicHelper()
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()  {
        didSet {
            self.tableView.reloadData()
        }
    }
    

    

//
//
//    lazy var topStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [termTextField])
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.distribution = .fillProportionally
//        return stackView
//    }()
//    let termTextField: UITextField = {
//        let tf = UITextField()
//        tf.backgroundColor = .white
//        tf.tag = 0
//        tf.borderStyle = .roundedRect
//        return tf
//    }()

//    let cityTextField: UITextField = {
//        let tf = UITextField()
//        tf.tag = 1
//        tf.backgroundColor = .white
//        tf.borderStyle = .roundedRect
//        return tf
//    }()
//
//    let tableView: UITableView = {
//        let tv = UITableView()
//        return tv
//    }()
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.backgroundColor = .clear
//        UIApplication.shared.statusBarStyle = .default
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.backgroundColor = UIColor.getRGB(red: 229, green: 11, blue: 69, alpha: 1)
//        UIApplication.shared.statusBarStyle = .lightContent
        let searchBar = UISearchBar()
        navigationItem.titleView = searchBar
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 1000, vertical: 1000), for: .default)
        navigationItem.backBarButtonItem = backButton

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = textFieldView
        setupButtons()
        searchCompleter.delegate = self

        
        
        
//        textFieldView.delegate = self
//        tableView.delegate = self
//        tableView.dataSource = self
//        textFieldView.returnKeyType = .done

//        navigationController?.navigationBar
//        textFieldView.tintColor = UIColor.lightGray
    }
    @objc func handleBackButton() {
//        print(textFieldView.text)
        self.delegate?.searchDataReceived(data: textFieldView.text!)
//        dismiss(animated: true, completion: nil)
        //        present(HomeController(), animated: true, completion: nil)
    }

    func setupButtons() {
//        cancelButtonView = graphicHelper.setNavBarImages(image: #imageLiteral(resourceName: "Cancel"), width: 30)
//        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
//        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        topStackView.insertArrangedSubview(backButton, at: 0)
    }

//    func setupViews(){
//        view.addSubview(topStackView)
//        topStackView.translatesAutoresizingMaskIntoConstraints = false
//        topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
//        topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
//        topStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 5).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//    }
}
extension SearchViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldView {
            searchCompleter.filterType = .locationsOnly
            searchCompleter.queryFragment = textFieldView.text!
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searchResults = []
    }

}

extension SearchViewController: MKLocalSearchCompleterDelegate {

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        //        let charset = CharacterSet(charactersIn: "1234567890")
        searchResults = completer.results.filter({!$0.title.contains("1234")})
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}

extension SearchViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let completion = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
        if let coordinate = response?.mapItems[0].placemark.coordinate{
            self.textFieldView.text = String(coordinate.latitude)
//                self.delegate?.getLocationFromSearchController(location: (coordinate.latitude, coordinate.longitude))
                //                ClientAPI.manager.getVenueData(from: (coordinate.latitude, coordinate.longitude), completionHandler: {(onlineData) in
                //                    self.feedCell.venueData = onlineData
                //                    self.feedCell.cellCollectionView.reloadData()
                //                }, errorHandler: {print($0)})
//                self.handleBackButton()
            }

        }
    }
}
