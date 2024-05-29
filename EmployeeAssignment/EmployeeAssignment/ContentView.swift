//
//  ContentView.swift
//  EmployeeManagement
//
//  Created by SpringCT on 29/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var isActive = false;
    @State var isLoggedIn = false;
    
    var body: some View {
        NavigationView {
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                if(isActive){
                    if(isLoggedIn){
                        EmployeeView()
                    }
                   LoginView()
                }else{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                withAnimation{
                    isActive = true
                    
                    if let storedName = UserDefaults.standard.string(forKey: "username") {
                        print("Welcome back, \(storedName)!")
                        isLoggedIn = true
                    }
                }
            }
        }
    }

    
}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
