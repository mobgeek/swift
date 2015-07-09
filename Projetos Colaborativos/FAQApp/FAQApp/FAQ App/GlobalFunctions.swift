//
//  File.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 04/07/15.
//  Copyright © 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

//Este arquivo contém todas as funções usadas em diversos módulos do programa, para que não fosse preciso replicá-las ao longo de diferentes arquivos que requerem suas funcionalidades

///Gambiarra para testar conexão com a internet usando a url da Google, caso não haja internet retorna um alerta já pronto para ser apresentado na interface
func checkForInternet() -> Bool {
    
    let url = NSURL(string: "http://google.com/")
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "HEAD"
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
    request.timeoutInterval = 10.0
    
    var response: NSURLResponse?
    
    do {
        try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
    } catch {
        print(error)
    }
    
    if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode == 200 {
            return true
        }
    }
    
    return false

}

///Cria o alerta de falta de internet, retornando um já pronto
func createNoInternetAlert() -> UIAlertController {
    
    ///Alerta para ser mostrado na falta de internet
    let noInternetAlert = UIAlertController(title: "Sem Acesso à Internet", message: "Certifique-se de que seu dispositivo está conectado à Internet", preferredStyle: .Alert)
    
    let actionOK = UIAlertAction(title: "Ok", style: .Default) { _ in}
    
    noInternetAlert.addAction(actionOK)
    
    return noInternetAlert
    
}

///Cria alerta para dizer que um site está offline (vários fatores podem levar a isso: link quebrado, digitado errado, site está realmente fora do ar, ...)
//func createSiteOfflineAlert() -> UIAlertController {
//    
//    ///Alerta para ser mostrado na falta de internet
//    let siteOffilneAlert = UIAlertController(title: "Falha na Conexão", message: "O site está fora do ar!", preferredStyle: .Alert)
//    
//    let actionOK = UIAlertAction(title: "Ok", style: .Default) { _ in}
//    
//    siteOffilneAlert.addAction(actionOK)
//    
//    return siteOffilneAlert
//    
//}

