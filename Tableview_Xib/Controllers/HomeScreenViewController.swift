//
//  HomeScreenViewController.swift
//  Tableview_Xib
//
//  Created by APPLE on 22/02/23.
//

import UIKit

class HomeScreenViewController: UIViewController {

    let array = ["iOS", "Android", "Flutter", "CollectionView Items"]
    
    let collectionItems = ["item 1", "item 2", "item 3", "item 4"]
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "CustomeTableViewCell", bundle: nil), forCellReuseIdentifier: "NibCell")
        self.tableView.register(UINib(nibName: "CVTableViewCell", bundle: nil), forCellReuseIdentifier: "CVCell")
        
        
        headerForTable()
        footerForTable()
    }
}

// For Setting Header and Footer of TableView...
extension HomeScreenViewController {
    
    //Header of Table's Function...
    func headerForTable() {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        headerView.backgroundColor = .blue
        
        let label = UILabel(frame: headerView.bounds)
        label.text = "Header..."
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        headerView.addSubview(label)
        
        tableView.tableHeaderView = headerView
    }
    
    //Footer of Table's Function...
    func footerForTable() {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        footerView.backgroundColor = .blue
        
        let label = UILabel(frame: footerView.bounds)
        label.text = "Footer..."
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        footerView.addSubview(label)
        
        tableView.tableFooterView = footerView
    }
    
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Number OF Section...
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    
    //Header OF Section...
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50.0))
        headerView.backgroundColor = .orange

        let titleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: view.frame.size.width / 2, height: 50.0))
        titleLabel.textColor = .black
        titleLabel.text = array[section]
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    //Header Height OF Section...
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 100.0
    }
    
    //Footer OF Section...
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50.0))
        footerView.backgroundColor = .orange
        
        let button = UIButton(frame: footerView.bounds)
        button.setTitle("View All", for: .normal)
        button.backgroundColor = .red
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        footerView.addSubview(button)
        
        return footerView
    }
    
    @objc func buttonAction() {

        print("Button Pressed..!!")

        self.performSegue(withIdentifier: "goToNext", sender: HomeScreenViewController.self)
    }
    
    
    //Number OF Rows in Section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 4
        }
        else if section == 1 {
            return 4
        }
        else if section == 2 {
            return 4
        }
        else {
            return 1
        }
    }
    
    
    //Height of Row in Section Row...
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    //Table's Cell Configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NibCell", for: indexPath) as! CustomeTableViewCell

            cell.aakashLabel.text = "KK"
            cell.pkLabel.text = "AA"

            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NibCell", for: indexPath) as! CustomeTableViewCell
            
            cell.aakashLabel.text = "AA"
            cell.pkLabel.text = "KK"
            
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NibCell", for: indexPath) as! CustomeTableViewCell

            cell.aakashLabel.text = "KK"
            cell.pkLabel.text = "KK"

            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CVCell", for: indexPath) as! CVTableViewCell
            cell.register()
            cell.collectionView.reloadData()
         return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToNext", sender: self)
    }
    
    
    //Target CollectionView From Table's Section's Header
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        let cell = self.
//    }
    
    
    
    
    
    
}
