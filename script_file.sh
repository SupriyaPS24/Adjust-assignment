#Script to execute the tasks automatically in sequence.

# Defining the filename
filename="file.txt"

# 1. Number of lines
num_lines=$(wc -l < "$filename")
echo "Number of lines in $filename: $num_lines"

# 2. Number of "Z" characters
num_z=$(grep -o 'Z' "$filename" | wc -l)
echo "Number of 'Z' characters in $filename: $num_z"

# 3. Find line numbers for keywords
keywords=("Junior" "Platform" "Engineer")
for keyword in "${keywords[@]}"; do
  line_number=$(grep -i -n "$keyword" "$filename" | cut -d: -f1)
  if [[ ! -z "$line_number" ]]; then
    echo "Line number for '$keyword': $line_number"
  else
    echo "'$keyword' not found in $filename"
  fi
done

# 4. Replace "Junior" with "Senior"
sed -i -e 's/Junior/Senior/g' "$filename"
echo  "All occurrence of 'Junior' is replaced by 'Senior'"

echo "Analysis completed!"
