//
//  ViewController.swift
//  Econergia
//
//  Created by Fabio Santos on 10/01/15.
//  Copyright (c) 2015 Mobgeek. All rights reserved.
//

import UIKit

 // Como o ViewController será o delegate dos UITextFields, precisamos deixar claro que vamos implementar o protocolo UITextFieldDelegate.


class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Propriedades
    
    // Pelo preço do Kwh não variar durante o ciclo de vida do nosso App, definimos como constante.
    // O valor é do tipo Double porque o valor de uma moeda pode conter duas casas decimais.
    // Fonte de dados: ANEEL. (R$ / KWh)
    
    let precoKWhEletropaulo: Double = 0.28 // R$ / KWh
    let precoKWhLight: Double = 0.39
    
    // Por outro lado, as próximas variáveis variam dependendo da interação com o usuário. 
    // Por isso, vamos declarar todas elas como variáveis do tipo inteiro. 
    // Todas elas terão um valor padrão de zero.
    
    var minutos: Int = 0
    var potenciaEmWatts: Int = 0
    var dias = 31
    

    // MARK: - IBOutlets

    @IBOutlet weak var custoEnergiaSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var potenciaTextField: UITextField!
    @IBOutlet weak var minutosUsoDiarioTextField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var consumoLightLabel: UILabel!
    @IBOutlet weak var consumoEletropauloLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!

    
    // MARK: - IBActions
    
    @IBAction func toggleControls(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0 {
            
            // Apresenta o preço para Light.
        
            consumoLightLabel.hidden = false
            consumoEletropauloLabel.hidden = true
        
        } else {
            
            // Apresenta o preço para Eletropaulo.
            
            consumoLightLabel.hidden = true
            consumoEletropauloLabel.hidden = false
        
        }
        
    }
    
    @IBAction func sliderChanged(sender: UISlider)
    {
        let progresso = lroundf(sender.value)
        
        sliderLabel.text = "\(progresso)"
        
        dias = progresso
    }
    
    
    @IBAction func toqueBackground()
    {
            potenciaTextField.resignFirstResponder()
            minutosUsoDiarioTextField.resignFirstResponder()
    }
    
    @IBAction func calculoConsumo(sender: UIButton)
    {
        // E = P.t
        
        // C = (Watts x Horas X Dias) / 1000
        
        let consumoDiarioEmKWh = Double(minutos) / 60 * Double(potenciaEmWatts) / 1000
        let consumoMensalKWH = consumoDiarioEmKWh * Double(dias)
        
        // Calcular o valor a pagar:

        
        let valorAPagarEletropaulo = consumoMensalKWH * precoKWhEletropaulo
        let valorAPagarLight = consumoMensalKWH * precoKWhLight
        
        // Atualiza a interface:
        
        consumoEletropauloLabel.text = "R$ \(valorAPagarEletropaulo)"
        consumoLightLabel.text = "R$ \(valorAPagarLight)"
        
        if custoEnergiaSegmentedControl.selectedSegmentIndex == 0 {
        
            consumoLightLabel.hidden = false
            consumoEletropauloLabel.hidden = true
            
        } else {
        
            consumoLightLabel.hidden = true
            consumoEletropauloLabel.hidden = false
        
        }
    }

    // MARK: - UITextFieldDelegate
    
    // O delegate vai cuidar das notificações associadas a edição do campo de texto.
    
    // Esse protocolo define as mensagens enviadas ao delegate (nosso ViewController) como parte de uma sequência da edição do seu texto.
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // Chamado quando o usuário toca no botão 'return'.
        // Pergunta ao delegate se o textField deve processar que o botão 'return' foi pressioando.
        // O seu applicativo é responsável por dispensar o Teclado em certo momento.
        // Para dispensar o Teclado, chame resignFirstResponder() no campo de texto atual (textField)
        
        textField.resignFirstResponder()
        
        // True: o campo de texto pode implementar o seu comportamento padrão.
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool
    {
        // Basicamente, isso quer dizer que a edição de textField está prestes a terminar.
        // We validate entered text and save the current value of the field in our model.
        
        // Existe uma propriedade para leitura apenas que consulta se o string está vazio ou não...
        //..., ou seja, ele não possui nenhum caracter. Para maiores detalhes consulte a bibliote padrão de Swift.

        
        if textField.text.isEmpty { return true }
        
        
        // Identifique qual campo de texto está prestes a terminar a edição com switch.
        
        switch textField {
        
        case potenciaTextField:
            
            // Pergunta: Será que é possível converter o valor digitado em um número inteiro? (Optional Binding)
            
            if let value = potenciaTextField.text.toInt() {
            
                // Aceite apenas valores de potência acima de 0.
                if value > 0 {
                
                    potenciaEmWatts = value
                    return true
                }
                
            }
            
        case minutosUsoDiarioTextField:
            
            if let value = minutosUsoDiarioTextField.text.toInt() {
                
                if (value <= 60*24) && value > 0 {
                    minutos = value
                    return true
                }
            }
            
        default:
            
            break
            // "Ops! Something weird has just happened!"

            
        }
        
        // Você retorna false quando o conteúdo do campo de texto é inválido.
        // Assim, você evita que o usuário mude para um outro control antes que o campo de texto tenha um valor válido.
        
       return false
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        // Delegate method called when one of the text fields resigned. Editing stopped.
        
        // Check if all required fields are set so we can compute energy consumption.

        if !potenciaTextField.text.isEmpty && !minutosUsoDiarioTextField.text.isEmpty {

            // If so, enable the button

            calculateButton.enabled = true
        
        } else {
            
            // ... otherwise don't let people press compute.

        
            calculateButton.enabled = false
            
        }
    }
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculateButton.enabled = false
        
        consumoEletropauloLabel.text = ""
        consumoLightLabel.text = ""
        
        consumoEletropauloLabel.hidden = true
        consumoLightLabel.hidden = true
        
        sliderLabel.text = "31"
    }
}

