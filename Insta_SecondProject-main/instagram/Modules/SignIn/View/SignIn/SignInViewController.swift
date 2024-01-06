//
//  SignInViewController.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit


protocol signInViewControllerProtocol {
    func didSignedUser()
}

class SignInViewController: UIViewController, signInViewControllerProtocol {
    func didSignedUser() {
        <#code#>
    }
    
    
    
    @IBOutlet weak var Facebutton: UIButton!
    @IBOutlet weak var GoogleButton: UIButton!
     var presenter: SignInPresenterProtocol
    
    //private var databaseReference: DatabaseReference?
    
    init() {
        
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
        presenter = SignInPresenter(delegate: self)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        presenter = SignInPresenter(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        presenter.viewDidLoad()
        
    }
    
    func setUp() {
        Facebutton.setTitle("Continue with facebook", for: .normal)
        GoogleButton.setTitle("Continue with Google", for: .normal)
    }
    
    
    //    private func setupGoogleAuth() {
    //          guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    //
    //          // Create Google Sign In configuration object.
    //          let config = GIDConfiguration(clientID: clientID)
    //          GIDSignIn.sharedInstance.configuration = config
    //      }
    @IBAction func didPressFacebook(_ sender: Any) {
    }
    
    @IBAction func didPressGoogle(_ sender: Any) {
        presenter.didPressGoogle(in: self)    }
    
    
    func navigateToHome(){
        let tabBar = AppTabBarController()
        RootRouter.presentRootScreen(with: tabBar)
    }
    
    
    
    
    
    
    
    
    //    private func signInWithGoogle() {
    //            // Start the sign in flow!
    //            GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
    //                guard error == nil else {
    //                    print(error)
    //                    return
    //                }
    //
    //                guard let user = result?.user,
    //                      let idToken = user.idToken?.tokenString
    //                else {
    //                    print("User or idToken null..")
    //                    return
    //                }
    //
    //                let credential = GoogleAuthProvider.credential(
    //                    withIDToken: idToken,
    //                    accessToken: user.accessToken.tokenString)
    //
    //                Auth.auth().signIn(with: credential) { result, error in
    //                    print("Success!")
    //
    //                    let id = result?.user.uid ?? ""
    //                    let profile = result?.additionalUserInfo?.profile
    //                    let name = (profile?["name"] as? String) ?? ""
    //                    let email = (profile?["email"] as? String) ?? ""
    //                    let imageUrl = (profile?["picture"] as? String) ?? ""
    //
    //                    self.saveUserData(id: id,
    //                                      name: name,
    //                                      email: email,
    //                                      imageUrl: imageUrl)
    //
    //                    // result?.user.uid
    //                    //
    //                    // result?.additionalUserInfo?.profile
    //                    // name: Mohamed Elbana
    //                    // email:
    //                    // image:
    //                    // MARK: - TODO
    //                    // Save user info in DB
    //                }
    //            }
    //        }
    
    //        private func saveUserData(id: String,
    //                                  name: String,
    //                                  email: String,
    //                                  imageUrl: String) {
    //            databaseReference = Database.database().reference()
    //            guard let databaseReference else { return }
    //            databaseReference.child("Users")
    //                .child(id).setValue(["id": id,
    //                                     "name": name,
    //                                     "email": email,
    //                                     "imageUrl": imageUrl])
    //        }
    
    //        private func logOut() {
    //            let firebaseAuth = Auth.auth()
    //            do {
    //              try firebaseAuth.signOut()
    //            } catch let signOutError as NSError {
    //              print("Error signing out: %@", signOutError)
    //            }
    //        }
    //    }
}

// MARK : - [PRESENTER] -> [VIEW]
extension SignInViewController: signInViewControllerProtocol {
    func didSignedUser() {
        navigateToHome()
    }
}
