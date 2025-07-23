class StringCalculator {
  int add(String input) {
    if (input.isEmpty) return 0;

    final delimiterPattern = RegExp(r'^//(.)\n');
    String delimiter = ',|\n';
    String numbers = input;

    if (delimiterPattern.hasMatch(input)) {
      final match = delimiterPattern.firstMatch(input)!;
      delimiter = RegExp.escape(match.group(1)!);
      numbers = input.substring(match.end);
    }

    final splitNumbers = numbers.split(RegExp(delimiter));
    final intList = <int>[];
    final negativeNumbers = <int>[];

    for (var str in splitNumbers) {
      if (str.trim().isEmpty) continue;

      final number = int.parse(str);
      if (number < 0) {
        negativeNumbers.add(number);
      } else {
        intList.add(number);
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negativeNumbers.join(',')}');
    }

    return intList.fold(0, (sum, n) => sum + n);
  }
}
