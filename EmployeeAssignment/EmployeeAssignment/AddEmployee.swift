//
//  AddEmployee.swift
//  EmployeeAssignment
//
//  Created by SpringCT on 29/05/24.
//

import SwiftUI


struct AddEmployee: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State var employee: Employee?
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var address: String = ""
    
    var body: some View {
        NavigationStack{
            Form {
                    Section {
                        TextField("Enter Name", text: $name)
                            } header: {
                                Text("Name")
                            }
                
                Section {
                    TextField("Enter Age", text: $age)
                        } header: {
                            Text("Age")
                        }
                            
                Section {
                    TextField("Enter Address", text: $address)
                        } header: {
                            Text("Address")
                        }
                
                Spacer()
                
                Button("Save"){
                    saveEmployee(name: name, age: age, address: address)
                    
                }

                
            }.navigationTitle("Enter Employee Details")
        }
    }
    
    // Core Data Operations
        func saveEmployee(name: String, age: String, address: String) {
            if employee == nil {
                employee = Employee(context: self.viewContext)
            }
            employee?.name = name
            employee?.age = age
            employee?.address = address
            
            do {
                try self.viewContext.save()
                print("Employee saved!")
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
}


    
    struct ContentView_Previews: PreviewProvider {
      
        static var previews: some View {
            AddEmployee()
        }
    }
   

