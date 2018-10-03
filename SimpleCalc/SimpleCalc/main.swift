//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//




//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//
import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count > 1 {
            let operation = args[1]
            if operation == "+" || operation == "-" || operation == "/" || operation == "%" || operation == "*" {
                switch operation {
                case "+":
                    return Int(args[0])! + Int(args[2])!
                case "-":
                    return Int(args[0])! - Int(args[2])!
                case "/":
                    return Int(args[0])! / Int(args[2])!
                case "%":
                    let x = Int(args[0])! / Int(args[2])!
                    return Int(args[0])! - (Int(args[2])! * x)
                case "*":
                    return Int(args[0])! * Int(args[2])!
                default:
                    return 0
                }
            } else {
                let compOp = args[args.count - 1]
                switch compOp {
                    case "count":
                        return args.count - 1
                    case "avg":
                        return avg(operation : args)
                    case "fact":
                        return fact(num : Int(args[0])!)
                    default:
                        return 0
                }
            }
        } else {
            return 0
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    func avg(operation : [String]) -> Int {
        var sum = 0
        let total = operation.count - 1
        for i in 0..<total {
            sum = sum + Int(operation[i])!
        }
        return sum / total
    }
    
    func fact(num : Int) -> Int {
//        let n = a
        if(num == 1){
            return 1
        }else{
            return num * fact(num : num - 1)
        }
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
if first.count > 1 {
    print(Calculator().calculate("\(first)"))
} else {
    let operation = readLine()!
    var equation = first + " " + operation
    if operation == "+" || operation == "-" || operation == "/" || operation == "%" || operation == "*" {
        let second = readLine()!
        print(Calculator().calculate([first, operation, second]))
    } else {
        var next = operation
        while next != "count" && next != "avg" && next != "fact" {
            next = readLine()!
            equation = equation + " " + next
        }
        print(Calculator().calculate("\(equation)"))
    }
}
