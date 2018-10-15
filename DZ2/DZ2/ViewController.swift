//
//  ViewController.swift
//  DZ2
//
//  Created by Юрий Шашкин on 14/10/2018.
//  Copyright © 2018 Юрий Шашкин. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var ViewTable: UIView!
    @IBOutlet weak var Settings: UIButton!
    
    var model = Labs()
    var refresh: UIRefreshControl?
    
    private let estimatedRowHeight: CGFloat = 100
    private let cellId = "LabCell"
    private let adID = "AdCell"
    private let segueName = "toInformation"
    
    @objc func refreshD() {
        Table.reloadData()
        refresh?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addRefresh()
    }
    
    func addRefresh(){
        refresh = UIRefreshControl()
        refresh?.attributedTitle = NSAttributedString(string: "Идет обновление...")
        refresh?.addTarget(self, action: #selector(refreshD), for: .valueChanged )
        Table.addSubview(refresh!)
    }
    


    func configureTableView() {
        Table.delegate = self
        Table.dataSource = self
        Table.tableFooterView = UIView()
        Table.rowHeight = estimatedRowHeight
        Table.tableHeaderView = ViewTable
        Table.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        Table.register(UINib(nibName: adID, bundle: nil), forCellReuseIdentifier: adID)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.labs.count + model.labs.count / 2 + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((indexPath.row % 3) != 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? LabCell else {
                return UITableViewCell()
            }
            let x = (indexPath.row)/3 + 1
            cell.configureView(lab: model.labs[indexPath.row - x])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: adID, for: indexPath) as! AdCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ((indexPath.row % 3) != 0) {
            let x = (indexPath.row)/3 + 1
            let lab = model.labs[indexPath.row - x]
            performSegue(withIdentifier: segueName, sender: lab)
        }
    }
    
    @IBAction func ViewSettings(_ sender: Any) {
        performSegue(withIdentifier: "toSettings", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard
                let vc = segue.destination as? LabController,
                let lab = sender as? Lab
                else { return }
            vc.lab = lab
        }
    }
}
