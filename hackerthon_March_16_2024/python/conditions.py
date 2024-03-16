
def main():
    # Prompt the user to enter their age
    age = int(input("Enter your age: "))
    
    # Check if the age is greater than or equal to 18
    if age >= 18:
        print("You are eligible to vote.")
    else:
        print("You are not eligible to vote.")

if __name__ == "__main__":
    main()