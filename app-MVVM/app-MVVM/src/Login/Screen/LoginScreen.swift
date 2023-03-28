//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 14/05/22.
//

import UIKit

protocol LoginScreenProtocol: class{
    func actionLoginButton()
    func actionRegisterButton()
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
        email.textColor = .darkGray
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
      
        return email
    }()
    
    lazy var loginPasswordTextField : UITextField = {
       let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.placeholder = "digite sua senha"
        password.textColor = .darkGray
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        password.keyboardType = .emailAddress
       // password.isSecureTextEntry = true
      
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
        self.addSubview(self.loginPasswordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        
    }
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.loginPasswordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validarTextFields(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.loginPasswordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable : Bool ){
        if enable{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.loginPasswordTextField.text ?? ""
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
            logoAppImageView.heightAnchor.constraint(equalToConstant: 300),
            
            emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            loginPasswordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            loginPasswordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            loginPasswordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            loginPasswordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: self.loginPasswordTextField.bottomAnchor, constant: 15 ),
            loginButton.leadingAnchor.constraint(equalTo: self.loginPasswordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: self.loginPasswordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: self.loginPasswordTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor,constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor)
            
        ])
    }
     
     
    
    
    
    
    
    
}
