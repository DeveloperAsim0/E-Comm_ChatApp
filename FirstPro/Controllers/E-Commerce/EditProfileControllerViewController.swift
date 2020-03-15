//
//  EditProfileControllerViewController.swift
//  FirstPro
//
//  Created by Mihir Vyas on 15/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FacebookLogin
import FBSDKLoginKit
import FBSDKCoreKit
import SDWebImage

class EditProfileControllerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var editname: UITextField!
    @IBOutlet weak var contactBackgroundView: UIView!
    @IBOutlet weak var editemail: UITextField!
    @IBOutlet weak var editpassword: UITextField!
    @IBOutlet weak var editphone: UITextField?
    
    var userModel: UserModel?
    fileprivate func imageContent() {
        userImageview?.layer.borderWidth = 1.0
        userImageview?.layer.masksToBounds = false
        userImageview?.layer.borderColor = UIColor.white.cgColor
        userImageview?.layer.cornerRadius = (userImageview?.frame.size.width)! / 2
        userImageview?.clipsToBounds = true
    }
    
    fileprivate func setPrivacySecurityNavBar() {
        self.navigationItem.title          = "Edit Profile"
        let gradientLayer                  = CAGradientLayer()
        var updatedFrame                   = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                = updatedFrame
        let color1                         = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                         = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors               = [color1, color2]
        gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint             = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    fileprivate func backgroundView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color1 = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradient.colors                    = [color1, color2]
        var updatedFrame                   = self.contactBackgroundView.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
       // updatedFrame.size.width += UIApplication.shared.statusBarFrame.size.width
        gradient.startPoint                = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint                  = CGPoint(x: 1.0, y: 0.0)
        gradient.frame                     = updatedFrame
        self.contactBackgroundView.layer.insertSublayer(gradient, at: 0)
        //setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    func getFacebookUserInfo() {
        if (AccessToken.current != nil)
        {
            //print permissions, such as public_profile
            print(AccessToken.current?.permissions)
            let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            let connection = GraphRequestConnection()
            
            connection.add(graphRequest, completionHandler: { (connection, result, error) -> Void in
                
                let data = result as! [String : AnyObject]
                self.editname?.text = data["name"] as? String
                self.editemail?.text = data["email"] as? String
                let FBid = data["id"] as? String
                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                self.userImageview?.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
            })
            connection.start()
        }
    }
   
    override func viewDidAppear(_ animated: Bool) {
        getFacebookUserInfo()
    }
    
    fileprivate func fetchgoogleProfile() {
        // [START_EXCLUDE]
        if (GIDSignIn.sharedInstance()?.currentUser != nil) {
            print("google user: \(String(describing: GIDSignIn.sharedInstance()?.currentUser))")
            self.editemail.text = GIDSignIn.sharedInstance()?.currentUser.profile.email
            self.editname.text = GIDSignIn.sharedInstance()?.currentUser.profile.name
            self.userImageview.sd_setImage(with: GIDSignIn.sharedInstance()?.currentUser.profile.imageURL(withDimension: 200), completed: nil)
            UserDefaults.standard.setImage(image: userImageview?.image, forKey: "userupdateimage")
            UserDefaults.standard.set(self.editemail.text, forKey: "emailKey")
            UserDefaults.standard.set(self.editname.text, forKey: "fullname")
        } else {
            print("user not signed with goole")
        }
//        do {
//       try self.editemail.text = GIDSignIn.sharedInstance()?.currentUser.profile.email
//        self.editname.text = GIDSignIn.sharedInstance()?.currentUser.profile.name
//        self.userImageview.sd_setImage(with: GIDSignIn.sharedInstance()?.currentUser.profile.imageURL(withDimension: 200), completed: nil)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let name3 = defaults.imageForKey(key: "userupdateimage"){
            self.userImageview.image = name3
            print("userimage: \(self.userImageview)")
        }
        if let name2 = defaults.string(forKey: "fullname") {
            self.editname.text = name2
            print("username: \(self.editname)")
        }
        if let name = defaults.string(forKey: "emailKey"){
            self.editemail.text = name
            print("useremail: \(self.editemail)")
        }
        
        setPrivacySecurityNavBar()
        backgroundView()
        imageContent()
        DispatchQueue.main.async{
        self.getFacebookUserInfo()
        }
        fetchgoogleProfile()
    }
    

    @IBAction func saveDetails(_ sender: Any) {
        let alert: UIAlertController
        alert = UIAlertController(title: "User-Profile", message: "Saved", preferredStyle: .alert)
        alert.dismiss(animated: true, completion: nil)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController 
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func Editname(_ sender: Any) {
        editname?.isUserInteractionEnabled = true
        editname?.becomeFirstResponder()
    }
    
    @IBAction func Editemail(_ sender: Any) {
       editemail?.isUserInteractionEnabled = true
       editemail?.becomeFirstResponder()
    }
    
    @IBAction func Editpassword(_ sender: Any) {
       editpassword?.isUserInteractionEnabled = true
       editpassword?.becomeFirstResponder()
    }
    
    @IBAction func Editphone(_ sender: Any) {
       editphone?.isUserInteractionEnabled = true
       editphone?.becomeFirstResponder()
    }
    
    @IBAction func signOutAction(_ sender: Any) {
         let loginManager = LoginManager()
        do {
            try loginManager.logOut()
            self.dismiss(animated: true, completion: nil)
               print("logout from facebook")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        //If you to make the user log out from the app itself programmatically, you can check the following code.
        do {
            try GIDSignIn.sharedInstance()?.signOut()
            //print("logout from facebook")
            self.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
            self.navigationController?.popToRootViewController(animated: true)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func pickUserImage(_ sender: Any) {
        print("gallery will be open in few mirco seconds")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Choose an option", message: "to set your profile", preferredStyle: .actionSheet)
        
        //camera access
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
                 } else {
                    print("camera is not available!!!")
                    }
         }))
        
        //gallery access
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
    
        //cancel action for decline alert
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        userImageview?.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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

extension UserDefaults {
    func imageForKey(key: String) -> UIImage? {
        var image: UIImage?
        if let imageData = data(forKey: key) {
            image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage
        }
        return image
    }
    func setImage(image: UIImage?, forKey key: String) {
        var imageData: NSData?
        if let image = image {
            imageData = NSKeyedArchiver.archivedData(withRootObject: image) as NSData?
        }
        set(imageData, forKey: key)
    }
}
