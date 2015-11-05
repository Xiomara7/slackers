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

    var refreshControl:UIRefreshControl!
    var shouldUpdateConstraints = true
    
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
        
        tableView = UITableView(frame: CGRectZero, style: .Grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: IMG_BG))
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: LOADING_MSG)
        refreshControl.addTarget(self, action: "refreshAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
        tableView.sendSubviewToBack(refreshControl)
        
        self.view.addSubview(tableView)
        
        // AutoLayout
        if(shouldUpdateConstraints) {
            tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)

            shouldUpdateConstraints = false
        }
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
        let defaults = NSUserDefaults.standardUserDefaults()
        self.title = defaults.valueForKey("appTitle") as? String
        
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
        cell.username.text = "@\(user.username!)"
        cell.profileImage.image = user.cell_img
        
        if((user.is_admin) == 1) {
            cell.isAdminLabel.text = ADMIN
        }
        
        let colorString = user.theme_color
        cell.view.layer.borderColor = UIColor(hexString: colorString!).CGColor
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        let user = users[indexPath.row] as User!
        let profile = user.profile as Profile!
        
        let profileController = ProfileViewController(profile: profile, img: profile.profile_img)
        self.presentViewController(profileController, animated: true, completion: nil)
    }
}

