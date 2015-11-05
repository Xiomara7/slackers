//
//  MembersViewController.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import UIKit
import CoreData

class MembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var users = [User!]()

    var loadingImage: UIImageView!
    var refreshControl:UIRefreshControl!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        APIClient.shared.authTeam(TOKEN) { (success, error) -> Void in
            if (success) {
                APIClient.shared.getUsers(TOKEN) { (success, error) -> Void in
                    if(success) {
                        self.fetchData()
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        self.title = defaults.valueForKey("appTitle") as? String
        
        tableView = UITableView(frame: CGRectZero, style: .Grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: IMG_BG))
        
        self.view.addSubview(tableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: LOADING_MSG )
        refreshControl.addTarget(self, action: "refreshAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
        tableView.sendSubviewToBack(refreshControl)
        
        // AutoLayout
        
        tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
    }
    
    // MARK: - Selector Methods
    
    func refreshAction(sender:AnyObject) {
        APIClient.shared.authTeam(TOKEN) { (success, error) -> Void in
            if (success) {
                APIClient.shared.getUsers(TOKEN) { (success, error) -> Void in
                    if(success) {
                        self.tableView.reloadData()
                        self.tableView.reloadInputViews()
                        self.refreshControl.endRefreshing()
                    }
                }
            }
        }
    }
    
    func fetchData() {
        let fetchRequest = NSFetchRequest(entityName: USER_ENTITY)
        
        do {
            let results =
            try DELEGATE.managedObjectContext.executeFetchRequest(fetchRequest)
            
            users = results as! [User!]

            self.tableView.reloadData()
            self.tableView.reloadInputViews()
            
        } catch let error as NSError {
            print("\(FETCH_ERR)\(error),\(error.userInfo)")
        }
    }
    
    // Mark: - TableView DataSource & Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return defaultCellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(defaultReuseIdentifier) as! MembersViewCell!
        
        if cell == nil {
            cell = MembersViewCell(reuseIdentifier: defaultReuseIdentifier)
        }
        
        let user = users[indexPath.row] as User!
        
        cell.name.text = user.real_name
        
        let username = user.username
        cell.username.text = "@\(username!)"
        
        cell.profileImage.image = UIImage(data: self.getImage(user, forCell: true))
        
        let colorString = user.theme_color
        cell.view.layer.borderColor = UIColor(hexString: colorString!).CGColor
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        let user = users[indexPath.row] as User!
        
        let profile = user.profile as Profile!
        let profileImage = UIImage(data:getImage(user, forCell: false))
        
        let profileController = ProfileViewController(profile: profile, img: profileImage)
        self.presentViewController(profileController, animated: true, completion: nil)
    }
    
    func getImage(user: NSManagedObject!, forCell: Bool) -> NSData {

        let profile = user.valueForKey("profile") as! Profile!
        
        var urlString: String
        
        if(forCell) {
            urlString = (profile.valueForKey("image_48") as? String)!
        } else {
            urlString = (profile.valueForKey("image_192") as? String)!
        }
        
        let imageUrl = NSURL(string: urlString)
        let data = NSData(contentsOfURL: imageUrl!)
        
        return data!
    }
}

