//
//  MenuViewController.swift
//  REPortfolioApp
//
//  Created by Desi Nikolova on 2023-07-19.
//

import Foundation
import UIKit

class MenuViewController:UITableViewController{
    
    @IBOutlet var menu:UITableView?
    
    let options = ["Solar",
                   "Wind",
                   "Biomass",
                   "Tidal",
                   "Geothermal",
                   "Nuclear"]
    
    let optionsSolar = ["Solar - Photovoltaic",
                        "Solar - Photovoltaic Thermal"]
    
    override func viewWillLayoutSubviews() {
        
        menu?.delegate = self
        
        super.viewWillLayoutSubviews()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //optionsSolar.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
