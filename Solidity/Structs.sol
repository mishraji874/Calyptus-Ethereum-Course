// Structs in Solidity are used to combine multiple related data types into a single component.

// For example, if we need to create a structure for containing related data of a student like his/her name, roll number, qualification status etc., we can do it using Struct.

// In the following example, we create a struct called Student that contains the student name (string), roll number (uint), and the qualification status (bool).

// struct Student {
//      string name;
//      uint roll_num;
//      bool qualified;
//  }
// Thus, Student becomes a data type in itself.

// A variable of type Student will be declared as follows:

//  Student public student;
// Or we can create an array of type Student called students:

// Student[] public students;
// In the following smart contract, we create a list of students in an array of type Student. Each student’s data contains his/her name, roll number and qualification status:

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Struct {
    struct Student {
        string name;
        uint roll_num;
        bool qualified;
    }

    Student[] public students;

    function addStudent(
        string calldata _name,
        uint _roll_num,
        bool _qualified
    ) public {
        students.push(Student(_name, _roll_num, _qualified));
    }
}

// The function addStudent takes three arguments for the new student’s name, roll number and qualification status, and finally adds the student’s data to the students array with the following line:

//  students.push(Student(_name, _roll_num, _qualified));
// There are different ways of executing the above command. We can also write it as follows:

//  students.push(Student({roll_num: _roll_num, name: _name, qualified: _qualified));
// Or we can also write it as follows:

//  function addStudent(string calldata _name, uint _roll_num, bool _qualified) public {
      
//        Student memory student;
      
//        student.name = _name;
//        student.roll_num = _roll_num;
//        student.qualified = _qualified;
      
//        students.push(student);
//   }
// With any of the above 3 statements, we can add a new student’s data to the students array.