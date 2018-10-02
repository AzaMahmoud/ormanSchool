
//
//  MaterialViewController.swift
//  ormanSchools
//
//  Created by Mostafa on 9/24/18.
//  Copyright © 2018 Orman. All rights reserved.
//

import UIKit
import Popover

class MaterialViewController: UIViewController , UIDocumentInteractionControllerDelegate , URLSessionDownloadDelegate , subjects{
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subjectButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var downloadTask: URLSessionDownloadTask!
    var backgroundSession = URLSession(configuration: .default)
    let saveTypeOfFile = UserDefaults.standard
    let saveTitleOfFile = UserDefaults.standard
    var subjectArray: [Subjects] = []
    var materialsArray: [Materials] = []
    var popover: Popover!
    var students: Students?
    var subjectID:  Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        let backgroundSessionConfiguration = URLSessionConfiguration.default
        backgroundSession = Foundation.URLSession(configuration: backgroundSessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        title = "Materials"
        menuButton()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 300
        self.revealViewController().rearViewRevealDisplacement = 50
        self.revealViewController().toggleAnimationDuration = 0.5
        self.revealViewController().toggleAnimationType = .spring
        self.revealViewController().frontViewShadowColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        
        tableView.alpha = 0
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func menuButton(){
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu") , style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(animated:)))
        self.navigationItem.setLeftBarButton(barButton, animated: true)
    }

    func getSubject(_ name: String, _ id: Int) {
        subjectLabel.text = name
        subjectID = id
        print(id)
        print(students?.class_id ?? 0)
        print(students?.grid_id ?? 0)
        startAnimating()
        API.init().getMaterials(subjectID: 8614, classID: 0, grid_Id: 315) { (done, materials) in
            if done {
                self.materialsArray = materials
                if self.materialsArray.count == 0 {
                    self.showAlert("No Materials to this subject", "")
                }else{
                    self.tableView.alpha = 1
                    self.stopAnimating()
                    self.tableView.reloadData()
                }
                
            }else{
                self.tableView.alpha = 0
                self.stopAnimating()
            }
        }
        
        
    }

    
    @IBAction func subjectButtonAction(_ sender: Any) {
        setupPopover()
    }
    
    func showFileWithPath(path: String){
        let isFileFound:Bool? = FileManager.default.fileExists(atPath: path)
        if isFileFound == true{
            let viewer = UIDocumentInteractionController(url: URL(fileURLWithPath: path))
            viewer.delegate = self
            viewer.presentPreview(animated: true)
        }
    }

    //MARK: UIDocumentInteractionControllerDelegate
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController
    {
        return self
    }

    func cutString(_ url: String) -> String {
        print(url)
        let index = url.index(of: ".")!
        let newStr = url[index...]
        
        print(newStr)
        return String(newStr)
    }

    @IBAction func download(_ sender: UIButton) {
        //        indexDownloadObject = sender.tag
        if downloadTask != nil{
            downloadTask.cancel()
        }else{
            
            let url = URL(string: "http://www.mywebsite.com/myfile.pdf")
            print(url!)
////            saveTypeOfFile.set(type, forKey:"typeofFile")
//            saveTitleOfFile.set(url, forKey: "titleOfFile")
            downloadTask = backgroundSession.downloadTask(with: url!)
            downloadTask.resume()
        }
        
    }
    

    //MARK: URLSessionDownloadDelegate
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL){
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentDirectoryPath:String = path[0]
        let fileManager = FileManager()
        let destinationURLForFile = URL(fileURLWithPath: documentDirectoryPath.appendingFormat("C.W&H.W sheet 9 May.pdf"))
        
        if fileManager.fileExists(atPath: destinationURLForFile.path){
            showFileWithPath(path: destinationURLForFile.path)
        }
        else{
            do {
                try fileManager.moveItem(at: location, to: destinationURLForFile)
                // show file
                showFileWithPath(path: destinationURLForFile.path)
            }catch{
                print("An error occurred while moving file to destination url")
            }
        }
    }
    // 2
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64){
        
        var bytesStr = "\(bytesWritten)"
        bytesStr.remove(at:bytesStr.startIndex)
        let prefix = bytesStr.prefix(2)
        bytesStr = String(prefix)
        let byteFloat = Float(bytesStr)
        
        print(CGFloat(byteFloat ?? 0) , "   "  , CGFloat(totalBytesExpectedToWrite))
        
    }
    
    //MARK: URLSessionTaskDelegate
    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    didCompleteWithError error: Error?){
        downloadTask = nil
        if (error != nil) {
            print(error!.localizedDescription)
        }else{
            print("The task finished transferring data successfully")
            
        }
    }

    
    
    func loadData(){
        startAnimating()
        API.init().getSubject(gridId: students?.grid_id ?? 0)
        {(done ,childs) in
            if done {
                self.subjectArray = childs
                self.stopAnimating()
            }else{
                self.stopAnimating()
            }
            
        }
        
    }

}

extension MaterialViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allMaterialCell") as! AllMaterialCell
        cell.subjectName.text = materialsArray[indexPath.row].name ?? ""
        return cell
    }
    
    
    
    
    
}


extension MaterialViewController {
    func setupPopover() {
        if let subjectView = Bundle.main.loadNibNamed("SubjectView", owner: nil, options: nil)?.first as? SubjectView {
            popover = Popover()
            subjectView.popover = popover
            subjectView.subjects = subjectArray
            subjectView.subject = self
            subjectView.frame = CGRect(x: 0, y: 0, width: subjectButtonOutlet.frame.size.width, height: 300)
            popover?.show(subjectView, fromView: subjectButtonOutlet)
            
        }
    }
}
