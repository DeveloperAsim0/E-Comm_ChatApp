//
//  SignInController.swift
//  FirstPro
//
//  Created by Tarun Meena on 06/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.

import UIKit
import FacebookCore
import FacebookLogin
import FirebaseAuth
import GoogleSignIn

class SignInController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate{
    
   // let sharedInstance = SignInController()
    let sharedInstanceTest = EditProfileControllerViewController()

    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var signInoutlet: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailField: UITextField! {
        didSet {
            emailField.tintColor = UIColor.orange
            emailField.setIcon(#imageLiteral(resourceName: "smartphone"))
        }
    }
    
    @IBOutlet weak var constraintsContentHeight: NSLayoutConstraint!
    
    var activeField: UITextField?
    var lastOffSet: CGPoint!
    var KeyboardHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        setPrivacySecurityNavBar()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(newViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func googleAction(_ sender: Any) {
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    //MARK:- Google Sign In Method
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        } else {
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
            let userModel = UserModel(name: user.profile.name, email: user.profile.email, imageURL: user.profile.imageURL(withDimension: 200))
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if error == nil {
               print("Login Successful.")
                UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController
                newViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.present(newViewController, animated: true, completion: nil)
            } else {
                print(error?.localizedDescription)
                //This is where you should add the functionality of successful login
                //i.e. dismissing this view or push the home view controller etc
            }
        }
    }
}
    
    func loginManagerDidComplete(_ result: LoginResult) {
        let alertController: UIAlertController
        switch result {
        case .cancelled:
            alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login", preferredStyle: .alert)
            alertController.dismiss(animated: true, completion: nil)
            
        case .failed(let error):
            alertController = UIAlertController(title: "Login Fail", message: "Login failed with error \(error)", preferredStyle: .alert)
            alertController.dismiss(animated: true, completion: nil)
                print("login failed due request decline")
            
        case .success(let grantedPermissions,_, _):
            print("Login successfull")
//            alertController = UIAlertController(title: "Login Success", message: "Login succeeded with granted permissions: \(grantedPermissions)", preferredStyle: .)
//            alertController.dismiss(animated: true, completion: nil)
        }
//        self.present(alertController, animated: true, completion: nil)
//        alertController.dismiss(animated: true, completion: nil) 
    }
    
//    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
//        //This line does the trick to fix signin web not showing issue
//        viewController.view.layoutIfNeeded()
//
//        self.present(viewController, animated: true, completion: nil)
//    }
    
    @IBAction func facebookAction(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(
            permissions: [.publicProfile, .userFriends, .email],
            viewController: self
        ) { result in
            self.loginManagerDidComplete(result)
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(newViewController, animated: true, completion: nil)
        }
      sharedInstanceTest.getFacebookUserInfo()
    }

    func setPrivacySecurityNavBar() {
        self.navigationItem.title          = "SignIn"
        let gradientLayer                  = CAGradientLayer()
        var updatedFrame                   = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                = updatedFrame
        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors               = [color1, color2]
        gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint             = CGPoint(x: 1.0, y: 0.0)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
}

extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}
