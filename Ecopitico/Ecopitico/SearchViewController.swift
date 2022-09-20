//
//  SearchViewController.swift
//  Ecopitico
//
//  Created by vivi on 12/09/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate {
    
    var filteredProblems = [Problem]()
    let problems = Problem.GetAllProblems()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(ProblemCell.self, forCellReuseIdentifier: "cell")
        
        return tv
    }()
    
    lazy var searchController : UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        s.searchResultsUpdater = self
        
        s.obscuresBackgroundDuringPresentation = false
        s.searchBar.placeholder = "Explore"
        s.searchBar.sizeToFit()
        s.searchBar.searchBarStyle = .prominent
        s.searchBar.showsScopeBar = true
        s.searchBar.setShowsScope(true, animated: true)
        
        s.searchBar.scopeButtonTitles = ["Todos", "Grupos", "Problemas", "Propostas"]
        s.searchBar.barTintColor = UIColor(named: "EcoDarkGreen")
        s.searchBar.tintColor = UIColor(named: "EcoGreen")
        
        let font = UIFont.systemFont(ofSize: 14)
        let darkGreen = UIColor(named: "EcoDarkGreen")
        let lightGreen = UIColor(named: "EcoGreen")

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: darkGreen ?? .black,
            .tracking: lightGreen ?? .black
        ]
        
        s.searchBar.setScopeBarButtonTitleTextAttributes(attributes, for: .normal)
        
        s.searchBar.delegate = self
        
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        setupElements()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
////        if searchController.canBecomeFirstResponder {
//        searchController.becomeFirstResponder()
////        }
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        searchController.isActive = true
    }

    // 2. ->> UISearchControllerDelegate
    func didPresentSearchController(_ searchController: UISearchController) {

        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func filterContentForSearchText(searchText: String, scope: String){
        filteredProblems = problems.filter({(problem: Problem) -> Bool in
            let doesCategoryMatch = (problem.type == scope)
            if isSearchBarEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && problem.name.lowercased().contains(searchText.lowercased())
            }
            
        })
        tableView.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFiltering)
    }
}
    
    extension SearchViewController: UISearchBarDelegate {
        
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

            filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles! [selectedScope])
        }
        
    }
    
    extension SearchViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController){
            let searchBar = searchController.searchBar
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            
            filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredProblems.count
        }
        return problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProblemCell else { return UITableViewCell() }
        
        let currentProblem: Problem
        
        if isFiltering() {
            currentProblem = filteredProblems[indexPath.row]
        } else {
            currentProblem = problems[indexPath.row]
        }
        
        cell.nameLbl.text = currentProblem.name
        cell.placeLbl.text = currentProblem.type
        
        return cell
    }
    
//    func searchController(){
//        //What am I supposed to insert here?
//    }
}


extension SearchViewController{
    func setupElements(){
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
}
