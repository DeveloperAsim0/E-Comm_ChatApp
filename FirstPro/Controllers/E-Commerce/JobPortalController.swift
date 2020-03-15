//
//  JobPortalController.swift
//  FirstPro
//
//  Created by Tarun Meena on 07/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit
import SwiftyMenu

class JobPortalController: UIViewController {

// var button = dropDownBtn()

// buttons outlet
    @IBOutlet private weak var Accountant    : SwiftyMenu!
    @IBOutlet weak var selectCountry         : SwiftyMenu!
    @IBOutlet private weak var selectState   : SwiftyMenu!
    @IBOutlet private weak var selectCity    : SwiftyMenu!

    //pickerview outlet

    private let dropDownOptionsDataSource = ["Option 1", "Option 2", "Option 3"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setPortalNavBar()
        setDropDown()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setPortalNavBar()
    }
    
    @IBAction func jobSearchAction(_ sender: Any) {
       // let customImageMaker: UIImage!
       // customImageMaker = UIImageView(image: "remove", highlightedImage: nil)
    }
    
    
    
    
    // custom selection
    //customDropDownMenu
    func setDropDown() {

        // Setup component
        Accountant.delegate              = self as? SwiftyMenuDelegate
        Accountant.options               = dropDownOptionsDataSource
        selectCountry.delegate           = self as? SwiftyMenuDelegate
        selectCountry.options            = dropDownOptionsDataSource
        selectState.delegate             = self as? SwiftyMenuDelegate
        selectState.options              = dropDownOptionsDataSource
        selectCity.delegate              = self as? SwiftyMenuDelegate
        selectCity.options               = dropDownOptionsDataSource

        // Support CallBacks
        Accountant.didExpand = {
            print("SwiftyMenu Expanded!")
        }

        Accountant.didCollapse = {
            print("SwiftyMeny Collapsed")
        }

        Accountant.didSelectOption = { (selection: Selection) in
            print("\(selection.value) at index: \(selection.index)")
        }

        selectState.didExpand = {
            print("SwiftyMenu Expanded!")
        }

        selectState.didCollapse = {
            print("SwiftyMeny Collapsed")
        }

        selectState.didSelectOption = { (selection: Selection) in
            print("\(selection.value) at index: \(selection.index)")
        }

        selectCity.didExpand = {
            print("SwiftyMenu Expanded!")
        }

        selectCity.didCollapse = {
            print("SwiftyMeny Collapsed")
        }

        selectCity.didSelectOption = { (selection: Selection) in
            print("\(selection.value) at index: \(selection.index)")
        }

        selectCountry.didExpand = {
            print("SwiftyMenu Expanded!")
        }

        selectCountry.didCollapse = {
            print("SwiftyMeny Collapsed")
        }

        selectCountry.didSelectOption = { (selection: Selection) in
            print("\(selection.value) at index: \(selection.index)")
        }

        // Custom Behavior
        Accountant.scrollingEnabled                = false
        Accountant.isMultiSelect                   = false
        Accountant.hideOptionsWhenSelect           = true
        
        // Custom UI
        Accountant.rowHeight                       = 35
        Accountant.listHeight                      = 150
        Accountant.borderWidth                     = 1.0

        // Custom Colors
        Accountant.borderColor                     = .black
        Accountant.optionColor                     = .black
        Accountant.placeHolderColor                = .black
        Accountant.menuHeaderBackgroundColor       = .white
        Accountant.rowBackgroundColor              = .white

        // Custom Animation
        Accountant.expandingAnimationStyle         = .spring(level: .low)
        Accountant.expandingDuration               = 0.5
        Accountant.collapsingAnimationStyle        = .linear
        Accountant.collapsingDuration              = 0.5

       selectState.scrollingEnabled                = false
       selectState.isMultiSelect                   = false
       selectState.hideOptionsWhenSelect           = true

    // Custom UI
    selectState.rowHeight                          = 35
    selectState.listHeight                         = 150
    selectState.borderWidth                        = 1.0

    // Custom Colors
    selectState.borderColor                        = .black
    selectState.optionColor                        = .black
    selectState.placeHolderColor                   = .black
    selectState.menuHeaderBackgroundColor          = .white
    selectState.rowBackgroundColor                 = .white

    // Custom Animation
    selectState.expandingAnimationStyle            = .spring(level: .low)
    selectState.expandingDuration                  = 0.5
    selectState.collapsingAnimationStyle           = .linear
    selectState.collapsingDuration                 = 0.5

    selectCity.scrollingEnabled                    = false
    selectCity.isMultiSelect                       = false
    selectCity.hideOptionsWhenSelect               = true

    // Custom UI
    selectCity.rowHeight                           = 35
    selectCity.listHeight                          = 150
    selectCity.borderWidth                         = 1.0

    // Custom Colors
    selectCity.borderColor                         = .black
    selectCity.optionColor                         = .black
    selectCity.placeHolderColor                    = .black
    selectCity.menuHeaderBackgroundColor           = .white
    selectCity.rowBackgroundColor                  = .white

    // Custom Animation
    selectCity.expandingAnimationStyle             = .spring(level: .low)
    selectCity.expandingDuration                   = 0.5
    selectCity.collapsingAnimationStyle            = .linear
    selectCity.collapsingDuration                  = 0.5

    selectCountry.scrollingEnabled                 = false
    selectCountry.isMultiSelect                    = false
    selectCountry.hideOptionsWhenSelect            = true

    // Custom UI
    selectCountry.rowHeight                        = 35
    selectCountry.listHeight                       = 150
    selectCountry.borderWidth                      = 1.0

    // Custom Colors
    selectCountry.borderColor                      = .black
    selectCountry.optionColor                      = .black
    selectCountry.placeHolderColor                 = .black
    selectCountry.menuHeaderBackgroundColor        = .white
    selectCountry.rowBackgroundColor               = .white

    // Custom Animation
    selectCountry.expandingAnimationStyle          = .spring(level: .low)
    selectCountry.expandingDuration                = 0.5
    selectCountry.collapsingAnimationStyle         = .linear
    selectCountry.collapsingDuration               = 0.5


    }


    //MARK:- Custom Nav Bar
    func setPortalNavBar() {
        self.navigationItem.title                    = "Job Portal"
        let gradientLayer                            = CAGradientLayer()
        var updatedFrame                             = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height                    += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                          = updatedFrame
        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors           = [color1, color2]
        gradientLayer.startPoint                     = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint                       = CGPoint(x: 0.0, y: 0.0)


        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - SwiftMenuDelegate

extension ViewController: SwiftyMenuDelegate {
    func didSelectOption(_ swiftyMenu: SwiftyMenu, _ selectedOption: SwiftyMenuDisplayable, _ index: Int) {
        print("Selected option: \(selectedOption), at index: \(index)")
    }

    func swiftyMenuWillAppear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu will appear.")
    }

    func swiftyMenuDidAppear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu did appear.")
    }

    func swiftyMenuWillDisappear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu will disappear.")
    }

    func swiftyMenuDidDisappear(_ swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu did disappear.")
    }

}

// String extension to conform SwiftyMenuDisplayable for defult behavior
extension String: SwiftyMenuDisplayable {
    public var displayableValue: String {
        return self
    }

    public var retrivableValue: Any {
        return self
    }
}






////MARK:- Custom DropDown Menu Class
//class dropDownBtn: UIButton {
//
//    var dropView = dropDownView()
//    var height = NSLayoutConstraint()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.backgroundColor = UIColor.darkGray
//        dropView = dropDownView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//
//        dropView.translatesAutoresizingMaskIntoConstraints = false
//
//    }
//
//    override func didMoveToSuperview() {
//        self.superview?.addSubview(dropView)
//        self.superview?.bringSubviewToFront(dropView)
//
//        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive         = true
//        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive    = true
//        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive        = true
//        height = dropView.heightAnchor.constraint(equalToConstant: 0)
//    }
//
//    var isOpen = false
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if isOpen == false {
//
//            isOpen = true
//            NSLayoutConstraint.deactivate([self.height])
//
//            if self.dropView.tableView.contentSize.height > 150 {
//            self.height.constant = 150
//            } else {
//                self.height.constant = self.dropView.tableView.contentSize.height
//            }
//
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                self.dropView.layoutIfNeeded()
//                self.dropView.center.y += self.dropView.frame.height / 2
//            }, completion: nil)
//
//        } else {
//            isOpen = false
//            NSLayoutConstraint.deactivate([self.height])
//            self.height.constant = 0
//            NSLayoutConstraint.activate([self.height])
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//                self.dropView.center.y += self.dropView.frame.height / 2
//                self.dropView.layoutIfNeeded()
//            }, completion: nil)
//
//        }
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
////MARK:- Custom View of DropDown Menu Class
//class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
//    var dropDownOptions = [String]()
//    var tableView = UITableView()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        tableView.backgroundColor = UIColor.darkGray
//        self.backgroundColor = UIColor.darkGray
//
//        tableView.delegate                                    = self
//        tableView.dataSource                                  = self
//        tableView.translatesAutoresizingMaskIntoConstraints   = false
//
//        self.addSubview(tableView)
//
//        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive       = true
//        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive     = true
//        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive         = true
//        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive   = true
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dropDownOptions.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = UITableViewCell()
//        cell.textLabel?.text = dropDownOptions[indexPath.row]
//        cell.backgroundColor = UIColor.darkGray
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(dropDownOptions[indexPath.row])
//    }
//
//
//}
