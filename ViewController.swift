//
//  ViewController.swift
//  LangApp
//
//  Created by Matthew Owen on 8/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!


    var selectedLanguage: String = ""
    var selectedLanguageLength: Int = 0
    var allLangs: String = ""
    var languages: String = ""
    var tableDataSource: [LanguageKeys] = []

    struct Language: Codable {
        let languages: [LanguageKeys]
    }
    
    struct LanguageKeys: Codable {
        let name, creator: String
        let firstAppeared: Int
        let typing: [String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        

        


        
        
        guard let sourcesURL = Bundle.main.url(forResource: "ProgrammingLanguages", withExtension: "json") else {
            fatalError("Could not find ProgrammingLanguages.json")
        }
        
        guard let langData = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not Recover data")
        }
        
        
        let decoder = JSONDecoder()
        
        
        


        guard let programmingLanguages = try? decoder.decode(Language.self, from: langData)
        else {
            fatalError("There was a problem decoding the data...")
            
            
        }
        tableDataSource = programmingLanguages.languages
        
    }


    
}
    
    //Mark: - TableView
    
extension ViewController  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = tableDataSource[indexPath.row].name
        
        
        return cell
    }
}
    

    
//Mark: - TablewView Delegate
 
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            navigationController?.pushViewController(detailVC, animated: true)
            detailVC.detailText = tableDataSource[indexPath.row].creator        } else {
            print("DetailVC is nil")
        }
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100    }
                                                                
}


        
        
//extension ViewController : UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//
//        detailVC.detailText = tableDataSource[indexPath.row].creator
//
//        navigationController?.pushViewController(detailVC, animated: true)
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        
        
        

        


