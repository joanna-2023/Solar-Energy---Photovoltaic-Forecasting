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
    static let shared = UIFactory()
    
    let options = ["Solar",
                   "Wind",
                   "Biomass",
                   "Tidal",
                   "Geothermal",
                   "Nuclear"]
    
    let optionsSolar = ["Photovoltaic (PV)",
                        "PV Thermal (PVT)"]
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        menu?.delegate = self
        menu?.reloadData()
        menu?.backgroundView = nil
        //UIFactory.styleMainSection(section: self.tableView)
        tableView.layoutSubviews()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuItem
        cell.title?.text = optionsSolar[indexPath.row]
        if indexPath.section >= 1{
            cell.title?.text = "Coming soon"
        }
        for v in tableView.subviews{
            //v.backgroundColor = ThemeColorDuskSky
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIFactory.designMenuHeader(title: options[section],
                                               tableView:  tableView)
        return v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section >= 1{
            return 1
        }
        return optionsSolar.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return options[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
