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
    var currentDataSource:[String] = [""]
    var adminDataSource:[String] = [""]
    var showAdminEvents = false

       override func viewDidLoad() {
            super.viewDidLoad()
        loadSampleevents()
        eventsListView.delegate = self
        eventsListView.dataSource = self
        
        currentDataSource = originalDataSource
            searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
            searchController.obscuresBackgroundDuringPresentation = false
            SearchContainer.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self as UISearchBarDelegate
        }
    
    @IBAction func reset(_ sender: Any) {
        restoreDataSource()
    }
    @IBAction func adminEvents(_ sender: Any) {
    
        showAdminEvents = true
        currentDataSource = adminDataSource
        eventsListView.reloadData()
    }
    
    func addEventstoDataSource (eventCount: Int, eventName: String, eventDate: String, eventTime: String, eventAddress: String, eventDescription: String){
    
//    for index in 1...eventCount{
//    originalDataSource.append ("\(eventName) \(eventDate) \(eventTime) #\(index)")
//    }

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
        
        private func loadSampleevents() {
                     
                      
                   guard let event1 = Event(eventID: "1", eventName: "Volunteer Event @ Polaris", eventDate: "3/2/2020", eventTime: "1pm-5pm", eventAddress: "1111 Polaris Pkwy", eventDescription: "Contact Coordinator to Register")else {
                          fatalError("Unable to instantiate event1")
                      }
                          
                   guard let event2 = Event(eventID: "2", eventName: "Volunteer Event @ Polaris", eventDate: "3/15/2020", eventTime: "1pm-5pm", eventAddress: "1111 Polaris Pkwy", eventDescription: "Contact Coordinator to Register")
                           else {
                           fatalError("Unable to instantiate event2")
                       }
            guard let event3 = Event(eventID: "3", eventName: "Volunteer Event @ Polaris", eventDate: "3/25/2020", eventTime: "1pm-5pm", eventAddress: "1111 Polaris Pkwy", eventDescription: "Contact Coordinator to Register")
                          else {
                          fatalError("Unable to instantiate event3")
                      }
                    guard let event4 = Event(eventID: "Event Id: 4", eventName: "Volunteer Event @ Polaris", eventDate: "4/2/2020", eventTime: "1pm-5pm", eventAddress: "1111 Polaris Pkwy", eventDescription: "Contact Coordinator to Register")
                          else {
                          fatalError("Unable to instantiate event4")
                      }
                   guard let event5 = Event(eventID: "Event Id: 5", eventName: "Volunteer Event @ Polaris", eventDate: "4/15/2020", eventTime: "1pm-5pm", eventAddress: "1111 Polaris Pkwy", eventDescription: "Contact Coordinator to Register")
                          else {
                          fatalError("Unable to instantiate event5")
                      }
                      
                      events += [event1, event2, event3, event4, event5]
            
            originalDataSource = ["\(event1.eventDate) \(event1.eventName)", "\(event2.eventDate) \(event2.eventName)", "\(event3.eventDate) \(event3.eventName)", "\(event4.eventDate) \(event4.eventName)",
            "\(event5.eventDate) \(event5.eventName)"]
                      
            
            adminDataSource = ["\(event1.eventDate) \(event1.eventName)",  "\(event3.eventDate) \(event3.eventName)",
                       "\(event5.eventDate) \(event5.eventName)"]
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


