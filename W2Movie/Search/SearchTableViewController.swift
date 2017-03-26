//
//  SearchTableViewController.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/21.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var titleSearchController = UISearchController(searchResultsController: nil)
    var selectedNum: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        navigationItem.title = "搜索"

        self.titleSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            controller.searchBar.placeholder = "搜索电影"
            definesPresentationContext = true
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        self.titleSearchController.searchBar.delegate = self
        
        
        let nib = UINib(nibName: "MovieCellTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "movieCell")
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.titleSearchController.isActive && titleSearchController.searchBar.text != "" {
            return searchResult.count
        }
        else {
            return 0
        }

    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCellTableViewCell
        let search = searchResult[indexPath.row]
        // Configure the cell...
        cell.title.text = search.title
        cell.director.text = search.director
        cell.releaseTime.text = search.releaseTime
        cell.decade.text = search.decade
        cell.specise.text = search.specise
        
        let speciesWidthConstranit = cell.specise.constraints.filter{
            return $0.identifier == "speciesWidth"
            }.first
        speciesWidthConstranit?.constant = v2tools.getTextWidth(string: search.specise, font: cell.specise.font) + 5.0
        let directorWidthConstraint = cell.director.constraints.filter{
            return $0.identifier == "directorWidth"
            }.first
        directorWidthConstraint?.constant = v2tools.getTextWidth(string: search.director, font: cell.director.font) + 5.0
        let releaseTimeWidthConstraint = cell.releaseTime.constraints.filter{
            return $0.identifier == "releaseTimeWidth"
            }.first
        releaseTimeWidthConstraint?.constant = v2tools.getTextWidth(string: search.releaseTime, font: cell.releaseTime.font) + 5.0
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNum = indexPath.row
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    //  Search
    func searchForTitle(_ title:String){
        self.navigationItem.title = "搜索中..."
        V2netTool.shared.getSearchResult(searchText: title, success: {
            if searchResult.count == 0 {
                self.navigationItem.title = "未找到结果"
            }
            else {
                self.navigationItem.title = "搜索结果"
            }
            self.tableView.reloadData()
        }) {
            self.navigationItem.title = "未找到结果"
        }
        searchResult.removeAll()
        self.tableView.reloadData()

    }
    func updateSearchResults(for searchController: UISearchController) {
        searchForTitle(searchController.searchBar.text!)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.title = "搜索"
        print("cacel")
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let ds = segue.destination as! MovieDetailViewController
            ds.detailNum = self.selectedNum
            ds.sourceViewNum = 10
        }
        
    }

}
