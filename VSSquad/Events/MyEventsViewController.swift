//
//  MyEventsViewController.swift
//  VSSquad
//
//  Created by Lisa Brown on 2/11/20.
//  Copyright © 2020 Anand Kelkar. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController {

   var events = [Event]()
    
    @IBOutlet var myeventsListView: UITableView!
        
    @IBOutlet var myeventSearchContainer: UIView!
    var searchController: UISearchController!
           var originalDataSource:[String] = ["My Event @ Fire & Iron"]
          var currentDataSource: [String] = [""]
        
           override func viewDidLoad() {
                super.viewDidLoad()
       addEventstoDataSource(eventCount: 3, event: "  My Volunteer Event @ Polaris")
            addEventstoDataSource(eventCount: 2, event: "My Volunteer Event Offsite")
            myeventsListView.delegate = self
            myeventsListView.dataSource = self
            
            currentDataSource = originalDataSource
                searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self as UISearchResultsUpdating
                searchController.obscuresBackgroundDuringPresentation = false
                myeventSearchContainer.addSubview(searchController.searchBar)
            searchController.searchBar.delegate = self as UISearchBarDelegate
            }
        
       
        
    @IBAction func myeventsreset(_ sender: Any) {
        restoreDataSource()
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
                myeventsListView.reloadData()
            }
        }
        
        func restoreDataSource(){
        currentDataSource = originalDataSource
            myeventsListView.reloadData()
        }
        }
           extension MyEventsViewController: UISearchResultsUpdating{
               
            func updateSearchResults (for searchController: UISearchController){
                
                if let searchText = searchController.searchBar.text{
                    filterCurrentDataSource(searchTerm: searchText)
                }
                }
        }
        extension MyEventsViewController: UISearchBarDelegate{
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

    extension MyEventsViewController: UITableViewDataSource, UITableViewDelegate{
        
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
            let cell = myeventsListView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
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


