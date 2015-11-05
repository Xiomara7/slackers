//
//  MembersViewController.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRectZero, style: .Grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: IMG_BG))
        
        self.view.addSubview(tableView)
        
        // AutoLayout
        
        tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        tableView.autoPinToBottomLayoutGuideOfViewController(self, withInset: 0.0)
    }
    
    // Mark: - TableView DataSource & Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        
        cell.textLabel?.text = "Xiomara"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

