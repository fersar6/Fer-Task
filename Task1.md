Task 1
=====

Problem:
----

Design a script that writes the numbers from 1 - 10 in random order. Each number should appear only once. You can use bash only.

Solution:
----


There are different ways to solve this problem, I will keep it simple and apply the easy ones and demonstrate two example solutions here.

First Solution:
----

We use the system command  `shuf` for this script. `shuf` writes a random permutation of the input lines to standard output.  The solution is implemented in the file `first_solution.sh`

Second Solution:
----

In the second approach, we are going to use two columns and the first one will be a random number and second one is the numbers in between 1 and 10. The first column will be used to randomize the second column values. The solution is implemented in the file "second_solution.sh"
Build instructions :  Clone the repository and execute the solution scripts. 
It is possible to make them executable with  `chmod 755 '<solution-file>'`


Usage: 
-----  

From the root directory
 `./first_solution.sh`
 `./second_solution.sh`
 
Description: this command writes the numbers from 1 - 10 in random order. Each number should appear only once.
Limitations:  Our approach hard codes the number interval so it  generates the random numbers only for the interval 1-10.
