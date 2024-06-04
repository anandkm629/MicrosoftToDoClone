//
//  ViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 24/05/24.
//

import UIKit
struct mainData: Codable {
    var imgIcon : String
    var btnTxt : String
}


enum DestinationViewController {
    case ImportantViewController
    case MyDayViewController
    case CustomViewController1
    case CustomViewController2
    case CustomViewController3
    }
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, CustomTableViewCellDelegate , AddItemDelegate {
    func buttonTapped(_ cell: CustomTableViewCell) {
        
    }
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToDo: UIButton!
    @IBOutlet weak var navView: UIView!
    
    @IBOutlet weak var grpBtn: UIButton!
    var mainArr = [mainData(imgIcon: "sunIcon", btnTxt: "My Day"),
                 mainData(imgIcon: "starIcon", btnTxt: "Important"),
                 mainData(imgIcon: "Planned", btnTxt: "Planned"),
                 mainData(imgIcon: "Assigned", btnTxt: "Assigned to me"),
                 mainData(imgIcon: "Tasks", btnTxt: "Tasks")]
    
    
    
    private let manager = ToDoItemManager()
    var todoList : [ToDoItem]? = nil
   // var selectedToDoItem: ToDoItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetUp()
        //view.addSubview(navView)
        
        let gesture = UITapGestureRecognizer(target: self, action:#selector(viewTapped))
        
        
        navView.isUserInteractionEnabled = true
        searchIcon.isUserInteractionEnabled = true
        //navView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: //#selector(handleTap(_:))))
        let imageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
                searchIcon.addGestureRecognizer(imageViewTapGesture)
        navView.addGestureRecognizer(gesture)
    
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
               tableView.delegate = self
               tableView.dataSource = self
        
    }
    
    
    //MARK: view will appear
    
    override func viewWillAppear(_ animated: Bool) {
           // Do any additional setup after loading the view.
           todoList = manager.fetchToDoItem()
           if(todoList != nil && todoList?.count != 0)
           {
               self.tableView.reloadData()
               print("view will appear called ")
           }
       }
    
    func viewWillSetUp()
        {
//            self.txtEmployeeName.text = selectedEmployee?.name
//            self.txtEmployeeEmailId.text = selectedEmployee?.email
//            self.imgProfilePicture.image = UIImage(data: (selectedEmployee?.profilePicture)!)
        }
    
    @IBAction func openList(_ sender: UIButton) {
        if let viewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewListController") as? NewListController {
            viewController1.delegate = self
            self.navigationController?.pushViewController(viewController1, animated: true)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            
        let cellData = mainArr[indexPath.row]

        cell.customImageView.image = UIImage(named: cellData.imgIcon)
        cell.customButton.setTitle(cellData.btnTxt, for: .normal)
        
            
        cell.delegate = self
            return cell
        }
    //MARK: did select row at
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
//         let detailViewController = UIViewController()
//         guard let reusableView = Bundle.main.loadNibNamed("ReusableView", owner: nil, options: nil)?.first as? ReusableView else {
//                     print("Failed to load ReusableView from nib")
//                     return
//                 }
//         reusableView.translatesAutoresizingMaskIntoConstraints = false
            
            let selectedViewController: DestinationViewController
            switch indexPath.row {
            case 0:
                selectedViewController = .MyDayViewController
            case 1:
                selectedViewController = .ImportantViewController
            case 2:
                selectedViewController = .CustomViewController1
            case 3:
                selectedViewController = .CustomViewController2
            case 4:
                selectedViewController = .CustomViewController3
            default:
                return
            }
            
            // Instantiate the corresponding view controller based on the selected enum value
            switch selectedViewController {
            case .MyDayViewController:
                let viewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyDayViewController")
                navigationController?.pushViewController(viewController1, animated: true)
                
            case .ImportantViewController:
                let viewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImportantViewController")
                navigationController?.pushViewController(viewController2, animated: true)
            // Add more cases as needed
                
            case .CustomViewController1:
                if let viewController3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController {
                    viewController3.configure(title: "Planned", detail: "Tasks with due dates or reminders show up here.", backgroundColor: .systemCyan)
                    navigationController?.pushViewController(viewController3, animated: true)
                }
                
            case .CustomViewController2:
                if let viewController4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController {
                    viewController4.configure(title: "Assigned to me", detail: "Tasks assigned to you  show up here.", backgroundColor: .systemMint)
                    navigationController?.pushViewController(viewController4, animated: true)
                }
            case .CustomViewController3:
                if let viewController5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController {
                    viewController5.configure(title: "Tasks", detail: "Tasks show up here if they aren't part of any lists you've created.", backgroundColor: .systemTeal)
                    navigationController?.pushViewController(viewController5, animated: true)
                }
            }
             }
             
        
    
    @objc func imageViewTapped(sender: UITapGestureRecognizer) {
        let location = sender.location(in: searchIcon)
        if searchIcon.bounds.contains(location) {
            // Handle tap on the imageView, e.g., open a detail view
            print("ImageView tapped")
            navigateToAnotherViewController()
        }
    }
    func navigateToAnotherViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SearchViewController")
        as! SearchViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }


    
    @objc func viewTapped() {
        print("ViewTapped")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "UserDetailController") as! UserDetailController


        if let navigationController = self.navigationController {
            navigationController.pushViewController(targetViewController, animated: true)
        } else {
            print("Navigation controller is not available")
        }
            
        }
    func addItem(_ name: String, _ imageName: String?) {
        
        
        
        let newItem = mainData(imgIcon: imageName ?? "", btnTxt:name )
            mainArr.append(newItem)
        let newIndexPath = IndexPath(row: mainArr.count - 1, section: 0)
         tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
  
//    func buttonTapped(_ cell: CustomTableViewCell) {
//           
//           let newViewController = MyDayViewController()
//           navigationController?.pushViewController(newViewController, animated: true)
//       }
//    
}
