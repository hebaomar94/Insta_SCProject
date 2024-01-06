//
//  SignInPresenter.swift
//  instagram
//
//  Created by Heba Omar94 on 02/01/2024.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase


protocol SignInPresenterProtocol {
    func viewDidLoad ()
    func didPressGoogle(in view: UIViewController)
}

class SignInPresenter: NSObject {
    
    

    private var databaseReference: DatabaseReference
    private var delegate: signInViewControllerProtocol
    init(delegate: signInViewControllerProtocol) {
        self.delegate = delegate
        databaseReference = Database.database().reference()

    }
    

    
    
    
    
        private func setupGoogleAuth() {
              guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    
              // Create Google Sign In configuration object.
              let config = GIDConfiguration(clientID: clientID)
              GIDSignIn.sharedInstance.configuration = config
          }
    
    
    private func signInWithGoogle(in view: UIViewController) {
                // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: view)
        { [unowned self] result, error in
                    guard error == nil else {
                        print(error)
                        return
                    }
    
                    guard let user = result?.user,
                          let idToken = user.idToken?.tokenString
                    else {
                        print("User or idToken null..")
                        return
                    }
    
                    let credential = GoogleAuthProvider.credential(
                        withIDToken: idToken,
                        accessToken: user.accessToken.tokenString)
    
                    Auth.auth().signIn(with: credential) { result, error in
                        print("Success!")
    
                        let id = result?.user.uid ?? ""
                        let profile = result?.additionalUserInfo?.profile
                        let name = (profile?["name"] as? String) ?? ""
                        let email = (profile?["email"] as? String) ?? ""
                        let imageUrl = (profile?["picture"] as? String) ?? ""
    
                        self.saveUserData(id: id,
                                          name: name,
                                          email: email,
                                          imageUrl: imageUrl)
                    }
                }
            }
    
            private func saveUserData(id: String,
                                      name: String,
                                      email: String,
                                      imageUrl: String) {
//                guard let databaseReference else { return }
                databaseReference.child("Users")
                    .child(id).setValue(["id": id,
                                         "name": name,
                                         "email": email,
                                 
                                         "imageUrl": imageUrl])
                //navigate to home...
                delegate.didSignedUser()
            }
            private func logOut() {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }
        }


//MARK:- [VIEW] -> Presenter

extension SignInPresenter: SignInPresenterProtocol{
    func viewDidLoad(){
        setupGoogleAuth()
    }
    
    func didPressGoogle(in view: UIViewController) {
        signInWithGoogle(in: view)
    }
}
