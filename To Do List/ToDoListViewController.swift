//
//  ViewController.swift
//  To Do List
//
//  Created by Samantha on 1/09/18.
//  Copyright © 2018 com.SamyDeveloper. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    //guardan la lista
    
    var itemArray = ["Find Mike", "Buy Eggos"," Destory Demogorgon"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK - TableView Datasource Methods
    
    //optener la cantidad de item
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //contenido de una celda por su indice buscar cellfor
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // se pone el nombre de la celda identifir del controlador de la tabla que esta en el main storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    // MARK - TableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        // esta tomando una referencia de la celda ruta particular
       // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        //este cambio es deseleccionar el checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        //animacion y se deseleccione
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK - add nuevo Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // para captar el nuevo item hacer la variable
        
        var textField = UITextField()
        
        
        
        // una alerta
        let alert = UIAlertController(title: "Add New ToDoList Item", message: "", preferredStyle: .alert)
        
        // accion de la alerta se setea
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // aqui sucede cuando presionas el boton agregar +
           
            self.itemArray.append(textField.text!)
            
            //refrescar la data
            
            self.tableView.reloadData()
            
            //print("success!")
            

            
        }
        // textfield en la alerta, hacer clik sobre el azul para insertar ese cierre
        
        alert.addTextField { (alertTextField) in
            //se crea un placeholder
            alertTextField.placeholder = "Crea tu nuevo item"
           
            
            //se crea el que capta el item por medio de la alerta
            
            textField = alertTextField
            
            
            
            
        }
        
        
        alert.addAction(action)
        
        // controlador de vista que se quiere presentar y el controlador de vista se presenta a la alerta
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}

