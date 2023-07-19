//
//  MenuViewController.swift
//  REPortfolioApp
//
//  Created by Joanna Nikolova on 2023-07-19.
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
    
    let optionsSolar = ["Solar - Photovoltaic (PV)",
                        "Solar - PV Thermal (PVT)"]
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        menu?.delegate = self
        menu?.reloadData()
        
        self.view.backgroundColor = ThemeColorSeaGreen
        menu?.backgroundView = nil
        
        tableView.backgroundColor = ThemeColorSeaGreen
        self.view.backgroundColor = ThemeColorSeaGreen
        tableView.layoutSubviews()
        self.view.superview?.backgroundColor = ThemeColorSeaGreen
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuItem
        cell.title?.text = optionsSolar[indexPath.row]
        for v in tableView.subviews{
            v.backgroundColor = ThemeColorSeaGreen
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsSolar.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
