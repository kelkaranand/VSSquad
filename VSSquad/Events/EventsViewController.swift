//
//  EventsViewController.swift
//  VSSquad
//
//  Created by Lisa Brown on 2/8/20.
//  Copyright © 2020 Anand Kelkar. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
var events = [Event]()
    
    @IBOutlet var eventsListView: UITableView!
    @IBOutlet var SearchContainer: UIView!
   var searchController: UISearchController!
       var originalDataSource:[String] = [""]
      var currentDataSource: [String] = [""]
    
       override func viewDidLoad() {
            super.viewDidLoad()
   addEventstoDataSource(eventCount: 5, event: "Event Details: Volunteer Event, Location: Polaris Conference Center")
        addEventstoDataSource(eventCount: 5, event: "Event Details: Volunteer Event, Location: Offsite")
        eventsListView.delegate = self
        eventsListView.dataSource = self
        
        currentDataSource = originalDataSource
            searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self as! UISearchResultsUpdating
            searchController.obscuresBackgroundDuringPresentation = false
            SearchContainer.addSubview(searchController.searchBar)
            searchController.searchBar.delegate = self as! UISearchBarDelegate
        }
    func addEventstoDataSource (eventCount: Int, event: String){
    
    for index in 1...eventCount{
    originalDataSource.append ("\(event) #\(index)")
    }

    }
    func filterCurrentDataSource(searchTerm: String) {
        
        if searchTerm.count > 0{
            currentDataSource = originalDataSource
            let filteredResults = currentDataSource.filter{$0.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased())
                
            }
            currentDataSource = filteredResults
            eventsListView.reloadData()
        }
    }
    
    func restoreDataSource(){
    currentDataSource = originalDataSource
        eventsListView.reloadData()
    }
    }
       extension EventsViewController: UISearchResultsUpdating{
           
        func updateSearchResults (for searchController: UISearchController){
            
            if let searchText = searchController.searchBar.text{
                filterCurrentDataSource(searchTerm: searchText)
            }
            }
    }
    extension EventsViewController: UISearchBarDelegate{
                func searchBarSearchButtonClicked(_searchBar: UISearchBar){
                    searchController.isActive = false
                    if let searchText = searchController.searchBar.text{
                        filterCurrentDataSource(searchTerm: searchText)
                    }
                }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchController.isActive = false
            if let searchText = searchBar.text, !searchText.isEmpty{
                restoreDataSource()
            }
    
        }
                }

extension EventsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController (title: "Selection", message: "Selected: \(currentDataSource[indexPath.row])", preferredStyle: .alert)
        
        searchController.isActive = false
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsListView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = currentDataSource[indexPath.row]
        return cell
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


