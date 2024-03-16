// void main() {
//   int marks = 78;

//   String grade = determineGrade(marks);

  
//   print("Grade: $grade");
// }

// // Function to determine the grade based on the marks
// String determineGrade(int marks) {
//   if (marks > 85) {
//     return "Excellent";
//   } else if (marks >= 75 && marks <= 85) {
//     return "Very Good";
//   } else if (marks >= 65 && marks < 75) {
//     return "Good";
//   } else {
//     return "Average";
//   }
// }



import 'dart:io';

void main() {
  // Request user input for marks
  stdout.write("Enter the student's marks: ");
  int marks = int.parse(stdin.readLineSync()!);

  String grade = determineGrade(marks);

  print("Grade: $grade");
}

// Function to determine the grade based on the marks
String determineGrade(int marks) {
  if (marks > 85) {
    return "Excellent";
  } else if (marks >= 75 && marks <= 85) {
    return "Very Good";
  } else if (marks >= 65 && marks < 75) {
    return "Good";
  } else {
    return "Average";
  }
}
