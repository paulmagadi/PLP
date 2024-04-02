def create_file():
    try:
        # Create a new text file named "my_file.txt" in write mode ('w')
        with open("my_file.txt", "w") as file:
            # Write three lines of text to the file
            file.write("This is line 1\n")
            file.write("12345\n")
            file.write("Another line here\n")
        print("File created successfully.")
    except Exception as e:
        print("Error occurred while creating the file:", e)

def read_file():
    try:
        # Open "my_file.txt" in read mode
        with open("my_file.txt", "r") as file:
            # Read and display the contents of the file
            print("Contents of my_file.txt:")
            print(file.read())
    except FileNotFoundError:
        print("File not found.")
    except PermissionError:
        print("Permission denied to access the file.")
    except Exception as e:
        print("Error occurred while reading the file:", e)

def append_to_file():
    try:
        # Open "my_file.txt" in append mode ('a')
        with open("my_file.txt", "a") as file:
            # Append three additional lines of text to the existing content
            file.write("Appending line 1\n")
            file.write("67890\n")
            file.write("Final line appended\n")
        print("Content appended to the file successfully.")
    except FileNotFoundError:
        print("File not found.")
    except PermissionError:
        print("Permission denied to access the file.")
    except Exception as e:
        print("Error occurred while appending to the file:", e)

if __name__ == "_main_":
    # File Creation
    create_file()

    # File Reading and Display
    read_file()

    # File Appending
    append_to_file()
    



# Demonstrate your understanding of Python file handling by completing the following tasks.

# Tasks:

# File Creation:
# Create a Python script (file_handling_assignment.py) that does the following:
# Creates a new text file named "my_file.txt" in write mode ('w').
# Write at least three lines of text to the file, including a mix of strings and numbers.


# File Reading and Display:
# Enhance your script to read the contents of "my_file.txt" and display them on the console.


# File Appending:
# Modify the script to open "my_file.txt" in append mode ('a').
# Append three additional lines of text to the existing content.


# Error Handling:
# Implement error handling using try, except, and finally blocks to manage potential file-related exceptions (e.g., FileNotFoundError, PermissionError).