print("Welcome to calculator")
var history: [String] = []

while true {
    let action = getDataFromUser(description: "What do you to do? c - run. q - exit. h - history.")
    
    switch action {
    case "c":
        calculate()
    case "q":
        break
    case "h":
        showHistory()
    default:
        print("You write incorrect action")
    }
    print("____________________________________________________")
}

func showHistory() {
    for item in history {
        print(item)
    }
}

func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
    
}

func showResult(_ result: Int) {
    print("Result: \(result)")
}

func calculate() {
    let operation = getDataFromUser(description: "Choice operation: +, -, * or /")
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else {
        print("You enter incorrect operation")
        return
    }
    let firstNumber = getDataFromUser(description: "Write first number")
    guard let firstNumber = Int(firstNumber) else {
        print("you write incorrect number")
        return
    }
    let secondNumber = getDataFromUser(description: "Write second number:")
    guard let secondNumber = Int(secondNumber) else {
        print("you write incorrect number")
        return
    }

    print("running:\(firstNumber) \(operation) \(secondNumber)")

    let result = calculate(operation: operation, firstNumber: firstNumber, secondNumber: secondNumber)
    guard let result = result else { return }

    showResult(result)
    history.append(String(result))
}

func calculate(operation: String, firstNumber first: Int, secondNumber second: Int) -> Int? {
    
    switch operation {
    case "+":
        return first + second
    case "-":
        return first - second
    case "*":
        return first * second
    case "/" where second == 0:
        print("error")
    case "/":
        return first / second
    default:
        print("You write incorrect operation")        
        return nil
    }
    
}