class Calculator {
  List<String> formatPostFix(String equation) {
    List<String> numbers = equation.split(" ");
    List<String> postFixArr = []; //
    List<String> stack = []; //
    for (String number in numbers) {
      if (number == "✕" || number == "÷") {
        stack.add(number);
      } else if (number == "%") {
        while (stack.isNotEmpty) {
          if (stack.last == "✕" || stack.last == "÷") {
            postFixArr.add(stack.removeLast());
          } else {
            break;
          }
        }
        stack.add(number);
      } else if (number == "+" || number == "—") {
        while (stack.isNotEmpty) {
          if (stack.last == "✕" || stack.last == "÷" || stack.last == "%") {
            postFixArr.add(stack.removeLast());
          } else {
            break;
          }
        }
        stack.add(number);
      } else {
        postFixArr.add(number);
      }
    }
    while (stack.isNotEmpty) {
      postFixArr.add(stack.removeLast());
    }
    return postFixArr;
  }

  String calculatePostFix(String equation) {
    List<String> postFix = formatPostFix(equation);
    // print(postFix);
    List<String> stack = [];
    String result = "";
    for (String number in postFix) {
      switch (number) {
        case "%":
          double num2 = double.parse(stack.removeLast());
          double num1 = double.parse(stack.removeLast());
          stack.add("${num1 % num2}");
          break;
        case "✕":
          double num2 = double.parse(stack.removeLast());
          double num1 = double.parse(stack.removeLast());
          stack.add("${num1 * num2}");
          break;
        case "÷":
          double num2 = double.parse(stack.removeLast());
          double num1 = double.parse(stack.removeLast());
          stack.add("${num1 / num2}");
          break;
        case "+":
          double num2 = double.parse(stack.removeLast());
          double num1 = double.parse(stack.removeLast());
          stack.add("${num1 + num2}");
          break;
        case "—":
          double num2 = double.parse(stack.removeLast());
          double num1 = double.parse(stack.removeLast());
          stack.add("${num1 - num2}");
          break;
        default:
          stack.add(number);
          break;
      }
    }
    result = stack.last;

    return result;
  }
}
