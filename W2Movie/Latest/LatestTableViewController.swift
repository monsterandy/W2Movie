//
//  LatestTableViewController.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

private let kRefreshViewHeight: CGFloat = 200

class LatestTableViewController: UITableViewController, RefreshViewDelegate {

    private var refreshView: RefreshView!
    private var firstLoadingView: UIView!

    
    var selectedNum: Int = 0
    let netConnectErrorAlert = UIAlertController(title: "糟糕，连接走丢了", message: "请检查你的网络", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView = RefreshView(frame: CGRect(x: 0, y: -kRefreshViewHeight, width: view.bounds.width, height: kRefreshViewHeight), scrollView: tableView)
        refreshView.delegate = self
        view.insertSubview(refreshView, at: 0)
        firstLoadingView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        firstLoadingView.backgroundColor = UIColor.white
        view.insertSubview(firstLoadingView, aboveSubview: refreshView)
        refreshView.initRefreshing()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        V2netTool.shared.getLatestMovieList(success: { 
            self.tableView.reloadData()
            self.firstLoadingView.removeFromSuperview()
            self.refreshView.endRefreshing()
        }) {
            self.refreshView.endRefreshing()
            print("Network Error!")
            self.present(self.netConnectErrorAlert, animated: true, completion: nil)
        }
        
        
        let nib = UINib(nibName: "MovieCellTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "movieCell")
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        netConnectErrorAlert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil))

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  检测下拉动作
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //  将滚动通知传递给refreshView
        refreshView.scrollViewDidScroll(scrollView)
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        refreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }

    
    // MARK: - Refresh view delegate
    // 检测到刷新动作时会调用此方法
    func RefreshViewDidRefresh(refreshView: RefreshView) {
        V2netTool.shared.getLatestMovieList(success: {
            self.tableView.reloadData()
            self.refreshView.endRefreshing()
        }) {
            self.refreshView.endRefreshing()
            print("Network Error!")
            self.present(self.netConnectErrorAlert, animated: true, completion: nil)
        }
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCellTableViewCell
        let latest = latestData[indexPath.row]
        // Configure the cell...
        cell.title.text = latest.title
        cell.director.text = latest.director
        cell.releaseTime.text = latest.releaseTime
        cell.decade.text = latest.decade
        cell.specise.text = latest.specise
        
        let speciesWidthConstranit = cell.specise.constraints.filter{
            return $0.identifier == "speciesWidth"
        }.first
        speciesWidthConstranit?.constant = v2tools.getTextWidth(string: latest.specise, font: cell.specise.font) + 5.0
        let directorWidthConstraint = cell.director.constraints.filter{
            return $0.identifier == "directorWidth"
        }.first
        directorWidthConstraint?.constant = v2tools.getTextWidth(string: latest.director, font: cell.director.font) + 5.0
        let releaseTimeWidthConstraint = cell.releaseTime.constraints.filter{
            return $0.identifier == "releaseTimeWidth"
        }.first
        releaseTimeWidthConstraint?.constant = v2tools.getTextWidth(string: latest.releaseTime, font: cell.releaseTime.font) + 5.0
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let ds = segue.destination as! MovieDetailViewController
            ds.detailNum = self.selectedNum
            ds.sourceViewNum = 0
        }
        
    }
    

}
