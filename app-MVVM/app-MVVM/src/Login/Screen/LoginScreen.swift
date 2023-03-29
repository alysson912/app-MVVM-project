//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 14/05/22.
//

import UIKit

protocol LoginScreenProtocol: class{
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
private weak var delegate : LoginScreenProtocol?
    
    func delegate(delegate : LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var loginLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "Login" )
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .red
        return image
    }()
    
    lazy var emailTextField : UITextField = {
       let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.placeholder = "digite seu e-mail"
        email.text = "alysson@gmail.com"
        email.textColor = .darkGray
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
      
        return email
    }()
    
    lazy var passwordTextField : UITextField = {
       let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.placeholder = "digite sua senha"
        password.text = "12345a"
        password.textColor = .darkGray
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.keyboardType = .emailAddress
        password.isSecureTextEntry = true
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
      
        return password
    }()
    
    lazy var loginButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor( red: 102/255, green: 103/255, blue: 171/255, alpha: 1.0)
        button.addTarget(self , action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton : UIButton = {
       let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("cadastre-se", for: .normal)
        register.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        register.setTitleColor(.darkGray, for: .normal)
        register.addTarget(self, action: #selector(tappedRegisterButton) , for: .touchUpInside)
        return register
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground() // cor de fundo
        self.configSuperView() // elementos add
        //------------------------------
      
        self.setUpConstraints()// constraints nativo
    }

    private func configBackground(){
        self.backgroundColor = .white
    }
    
    
    private func configSuperView(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        
    }
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.tappedLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.tappedRegisterButton()
    }
    
    
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   private func setUpConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 40),
            logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 150),
            
            emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15 ),
            loginButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor,constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor)
            
        ])
    }
}
