// The challenge consists of the following tasks:

// Create a function that takes two numbers as input and returns the sum of those numbers.
// Write a program that uses a for loop to print out the numbers from 1 to 10.
// Create a program that uses a switch statement to check for different string values and output a response based on the value.
// Create a program that uses a while loop to print out the numbers from 20 to 10.
// Create a program that uses an if-else statement to check if a number is even or odd and output the result.
// Create a program that takes a list of numbers as input and outputs the largest number in the list.
// Write a program that uses a try-catch block to catch an exception and output an error message.





// Function to calculate the sum of two numbers
int calculateSum(int a, int b) {
  return a + b;
}


// Program using a for loop to print numbers from 1 to 10
void printNumbers() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}


// Program using a switch statement to check for different string values
void checkString(String value) {
  switch (value) {
    case 'hello':
      print('Hello there!');
      break;
    case 'goodbye':
      print('Goodbye!');
      break;
    default:
      print('Unknown value');
  }
}



// Program using a while loop to print numbers from 20 to 10
void printNumbersReverse() {
  int i = 20;
  while (i >= 10) {
    print(i);
    i--;
  }
}

// Program using an if-else statement to check if a number is even or odd
void checkEvenOdd(int number) {
  if (number % 2 == 0) {
    print('$number is even');
  } else {
    print('$number is odd');
  }
}



// Program to find the largest number in a list
int findLargest(List<int> numbers) {
  int largest = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }
  return largest;
}


// Program using a try-catch block to catch an exception
void divide(int a, int b) {
  try {
    print(a ~/ b); // Division operation
  } catch (e) {
    print('Error: $e');
  }
}


