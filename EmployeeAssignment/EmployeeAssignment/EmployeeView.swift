//
//  EmployeeView.swift
//  EmployeeManagement
//
//  Created by SpringCT on 29/05/24.
//

import SwiftUI
import CoreData

struct EmployeeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Employee.name, ascending: true)],
        animation: .default)
    private var employees: FetchedResults<Employee>

    //[Employee(name: "Amit", age: "26", address:"Pune" ),
//                     Employee(name: "Radha", age: "36", address:"Pune" )]
//
    var body: some View {
        NavigationStack{
            
            List(employees, id: \.name) { employee in
                HStack{
                    Text(employee.name ?? "Dummy")
                        .scaledToFit()
                        .frame(width:100,height:50)
                    
                    Divider()
                    
                    Text(employee.age ?? "0")
                        .scaledToFit()
                        .frame(width:100,height:50)
                        
                    Divider()
                    
                    Text(employee.address ?? "Dummy")
                        .scaledToFit()
                        .frame(width:100,height:50)
                    
                }
                        
            }.navigationTitle("Employee Details")
            
            Spacer()
            
            NavigationLink(destination: AddEmployee()){
                    Text("Add New")
            }
                
        }
    }
}



#Preview {
    EmployeeView()
}
