//
//  LoginView.swift
//  EmployeeManagement
//
//  Created by SpringCT on 29/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @state var isLoginSuccess = false  
    var body: some View {
        NavigationStack{
            if(!self.isLoginSuccess){
            VStack {
                
                Spacer()
                
                VStack {
                    TextField(
                        "Username",
                        text: $viewModel.username
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    
                    Divider()
                    
                    SecureField(
                        "Password",
                        text: $viewModel.password
                    )
                    .padding(.top, 20)
                    
                    Divider()
                }
                
                Spacer()
                
                Button(
                    action: viewModel.login,
                    label: {
                        Text("Login")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                )/*.navigationDestination(isPresented: self.viewModel.$isLoginSuccess, destination: EmployeeView())*/
            }
            }else{
                EmployeeView()
            }
        }
        .padding(30)
        .onReceive(self.viewModel.$isLoginSuccess, perform: { _ in
                      self.isLoginSuccess = self.viewModel.$isLoginSuccess                                       
//            navigationDestination(for: self.viewModel.$isLoginSuccess, destination: EmployeeView())
//            NavigationLink{
//                EmployeeView()
//            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
