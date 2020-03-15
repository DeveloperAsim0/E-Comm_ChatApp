

import UIKit
import AVFoundation

class PhotoStreamViewController: UICollectionViewController, ENSideMenuDelegate {
  var photos = Photo.allPhotos()
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
     self.sideMenuController()?.sideMenu?.delegate = self
    //setPrivacySecurityNavBar()
    view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 0.968627451, alpha: 1)
    collectionView?.backgroundColor = .clear
    collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
  }
  
    
    @IBAction func sideMenuBar(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
//  func setPrivacySecurityNavBar() {
//      self.navigationItem.title          = "ProductDetails"
//      let gradientLayer                  = CAGradientLayer()
//      var updatedFrame                   = self.navigationController!.navigationBar.bounds
//      updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
//      gradientLayer.frame                = updatedFrame
//      gradientLayer.colors               = [UIColor.orange.cgColor, UIColor.orange.cgColor]
//      gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
//      gradientLayer.endPoint             = CGPoint(x: 1.0, y: 0.0)
//
//      UIGraphicsBeginImageContext(gradientLayer.bounds.size)
//      gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
//      let image = UIGraphicsGetImageFromCurrentImageContext()
//      UIGraphicsEndImageContext()
//      self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//  }
    
    
    @IBAction func checkProductAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProductDetailController") as! ProductDetailController
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
         print("sideMenuShouldOpenSideMenu")
            return true
    }
    
    func sideMenuDidOpen() {
         print("sideMenuDidClose")
    }
    
    func sideMenuDidClose() {
         print("sideMenuDidOpen")
    }
    
    func customOffSet() {
        print("set by default")
    }
    
}

extension PhotoStreamViewController: UICollectionViewDelegateFlowLayout {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
    
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath as IndexPath) as! AnnotatedPhotoCell
    cell.photo = photos[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: 250)
  }

}
