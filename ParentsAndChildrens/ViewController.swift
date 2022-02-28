//
//  ViewController.swift
//  ParentsAndChildrens
//
//  Created by Timofey Kharitonov on 28.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 225
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    lazy var headerView = HeaderView()

    var childs: [Child] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(tableView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let child = childs[indexPath.row]
        
        cell.child = child
        cell.nameTextField.textField.text = child.name
        cell.ageTextField.textField.text = child.age
        
        cell.deleteChildButtonAction = { [weak self] in
            self?.childs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.headerView.addChildButtonAction = { [weak self] in
            
            guard let self = self else { return }
            
            if self.childs.count == 4 {
                self.headerView.addChildButton.isHidden = true
            }
            
            guard self.childs.count != 5 else { return }
            
            self.childs.append(Child())
            tableView.insertRows(at: [IndexPath(row: self.childs.count - 1, section: 0)], with: .fade)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterView()
        
        footerView.clearChildsButtonAction = { [weak self] in
            let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let handler = { (action: UIAlertAction!) -> Void in
                
                var indexPaths: [IndexPath] = []
                for i in 0..<(self?.childs.count ?? 0) {
                    indexPaths.append(IndexPath(row: i, section: 0))
                }
                
                self?.childs = []
                self?.headerView.addChildButton.isHidden = false
                self?.headerView.nameTextField.textField.text! = ""
                self?.headerView.ageTextField.textField.text! = ""
                
                tableView.deleteRows(at: indexPaths, with: .fade)
            }
            let deleteAction = UIAlertAction(title: "Сбросить данные", style: .default, handler: handler)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
            optionMenu.addAction(deleteAction)
            optionMenu.addAction(cancelAction)
            self?.present(optionMenu, animated: true, completion: nil)
            
        }

        return footerView
    }
    
}
