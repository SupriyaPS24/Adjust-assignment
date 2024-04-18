# Adjust Assignment

## Task: Play with File and Characters
### Objective
This readme file has the details of the challenge given and solutions offered.

- Task involves performing various operations on text files using Linux commands.

### Overview of the challenge.
 To create a text file, <b>file.txt</b> with given random string and a <b>README.md</b> file with well formatted output
 on how I have achieved the answers, of the below tasks.
1. How many lines in this file?
2. How many “Z” Characters in this file ?
3. Find on which line is “Junior”, “Platform” and “Engineer”,not case
   sensitive.
4. Change “Junior” to “Senior”

### Information regarding Solution
I have followed two approaches to achieve the task.

- <b>Approach 1:</b> Provides detailed commands and explanations for manual execution of the tasks.
- <b>Approach 2:</b> Uses a script file for automated execution of all tasks.

### Approach 1
<b>1. How many lines in this file?</b>
  - <b><u>Command:</u></b> `wc -l file.txt`
  - `wc -l` followed by a filename, reads the contents of the file and outputs the count of lines present in that file.
  - <b><u>Output:</u></b>`98 file.txt`
  - <b><u>Description of the output:</u></b> number of lines in the file i.e., 98 followed by the file name i.e., file.txt

<b>Note:</b> We can use 'awk' to print only the line count.
    `wc -l filename | awk '{print $1}'`  
     awk '{print $1}' extracts and prints the first field (line count) from the output of wc.

<b>2. How many “Z” Characters in this file ?</b>
- <b><u>Command:</u></b> `grep -o 'Z' file.txt | wc -l`
- `grep -o 'Z' file.txt`: Searches for occurrences of 'Z' in file.txt and outputs each 'Z' on a new line.  
  `|`: Takes the output of the previous command.  
  `wc -l`: Counts the number of lines it receives as input.
-  <b><u>Output:</u></b>`44`
- <b><u>Description of the output:</u></b> Occurance of the Character 'Z' in the file, file.txt

<b>3. Find on which line is “Junior”, “Platform” and “Engineer”,not case
sensitive.</b>
- <b><u>Command:</u></b> `grep -in -e 'Junior' -e 'Platform' -e 'Engineer' file.txt | awk -F: '{ print $1 }'
  `
- `grep`: will read the contents of file.txt line by line.  
  It will search for lines that contain any of the specified patterns <b>('Junior', 'Platform', 'Engineer')</b>.  
  For each line that matches any of these patterns (case-insensitively), grep will display the line number (-n) along with the matched line.  
- `-i`: This option tells grep to perform a case-insensitive search, meaning it will match patterns regardless of case (e.g., 'Junior', 'junior', 'JUNIOR' will all be considered matches).  
  `-n`: This option tells grep to display line numbers along with the matched lines from the input file.  
- `-e`: This option specifies the patterns to be searched for by grep.
- `awk -F: '{ print $1 }'`:  
  - `awk` is used here to process the output from grep.  
  - `-F:`: Specifies the field separator as :. This tells awk to split each input line into fields based on the colon (:) character.  
  - `'{ print $1 }'`: For each line of input, awk will print the first field ($1), which corresponds to the line number (extracted by grep and provided before the colon :).
-  <b><u>Output:</u></b>  
`28`  
`65`  
`88`
- <b><u>Description of the output:</u></b> line number of the occurance of the String.

<b>4.Change “Junior” to “Senior”</b>
- <b><u>Command:</u></b> `sed -i -e 's/Junior/Senior/g' file.txt`
- `sed`reads the contents of file.txt.
  It applies the specified sed script `('s/Junior/Senior/g')` to perform a global, <b>case-sensitive</b> substitution of every occurrence of <b>'Junior'</b> with <b>'Senior'</b>.
  The modified content is then written back to file.txt, replacing its original content.  
<br><i>String 'Junior' will be replaced with 'Senior' in the file, file.txt</i>

<b>Note</b>: if we want a case-insensitive substitution (meaning it would replace 'Junior', 'junior', 'JUNIOR', etc.), we to use the sed command with the 'I' flag `sed -i -e 's/Junior/Senior/gI' file.txt`.

### Approach 2
I created a script file, <b>script_file.sh</b> which contains all commands for automated execution of tasks.
#### Instructions to run the script_file.sh

- save the script file(e.g., script_file.sh)
- Make the script executable: `chmod +x script_file.sh`.
- Run the script: `./script_file.sh`  
This script will perform all the above tasks and prints the desired output to the console.

<b><u>Output:</u></b>  


`Number of lines in file.txt:       98`  
`Number of 'Z' characters in file.txt:       44`  
`Line number for 'Junior': 65`  
`Line number for 'Platform': 28`  
`Line number for 'Engineer': 88`  
`All occurrence of 'Junior' is replaced by 'Senior'`  
`Analysis completed!`


 


