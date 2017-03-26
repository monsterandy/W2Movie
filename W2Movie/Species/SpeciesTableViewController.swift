//
//  SpeciesTableViewController.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit
import SafariServices

private let kRefreshViewHeight: CGFloat = 200

class SpeciesTableViewController: UITableViewController {

    private var dragView: DragView!
    var speciesNum = 0

    let speciesData = ["国内电影","欧美电影","高分经典","华语电视","动漫资源","欧美电视","最新综艺","旧版综艺","日韩电影"]
    let urlData = ["http://www.ygdy8.net/html/gndy/china/index.html","http://www.ygdy8.net/html/gndy/oumei/index.html","http://www.ygdy8.net/html/gndy/jddy/20160320/50510.html","http://www.dytt8.net/html/tv/hytv/index.html","http://www.dytt8.net/html/dongman/index.html","http://www.dytt8.net/html/tv/rihantv/index.html","http://www.dytt8.net/html/zongyi2013/index.html","http://www.dytt8.net/html/2009zongyi/index.html","http://www.ygdy8.net/html/tv/rihantv/index.html"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dragView = DragView(frame: CGRect(x: 0, y: -kRefreshViewHeight, width: view.bounds.width, height: kRefreshViewHeight), scrollView: tableView)
        view.insertSubview(dragView, at: 0)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let nib = UINib(nibName: "SpeciesTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "speciesCell")
        tableView.rowHeight = 99.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //  检测下拉动作
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //  将滚动通知传递给refreshView
        dragView.scrollViewDidScroll(scrollView)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speciesData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "speciesCell", for: indexPath) as! SpeciesTableViewCell
        
        // Configure the cell...
        cell.speciesLabel.text = speciesData[indexPath.row]
        cell.speciesImageView.image = UIImage(named: "background\(indexPath.row)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.speciesNum = indexPath.row
        switch speciesNum {
        case 0,1,4:
            self.performSegue(withIdentifier: "showList", sender: self)
        case 2:
            self.performSegue(withIdentifier: "showHighScore", sender: self)
        default:
            let url = URL(string: urlData[indexPath.row])
            let safariController = SFSafariViewController(url: url!, entersReaderIfAvailable: true)
            self.present(safariController, animated: true, completion: nil)
        }
        
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
        if segue.identifier == "showList" {
            let ds = segue.destination as! SpeciesListTableViewController
            ds.speciesNum = self.speciesNum
        }
        
    }

}
