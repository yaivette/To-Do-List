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
    
    let itemArray = ["Find Mike", "Buy Eggos"," Destory Demogorgon"]
    

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
    
    
    
    
    
    
    
    
    
    
    
}

