# Functions
def fibonacci(n):
    """
    This function generates the Fibonacci sequence up to a specified term n using iteration.

    Args:
        n: The number of terms in the Fibonacci sequence.

    Returns:
        A list containing the Fibonacci sequence up to n terms.
    """
    if n <= 1:
        return n
    else:
        fibonacci_sequence = [0, 1]  # Initialize the Fibonacci sequence with the first two terms
        for _ in range(2, n):
            next_term = fibonacci_sequence[-1] + fibonacci_sequence[-2]  # Calculate the next term
            fibonacci_sequence.append(next_term)  # Add the next term to the sequence
        return fibonacci_sequence

# Get the number of terms from the user
num_terms = int(input("Enter the number of terms: "))

# Generate the Fibonacci sequence
fibonacci_sequence = fibonacci(num_terms)

# Print the Fibonacci sequence
print("The Fibonacci sequence up to term {} is:".format(num_terms))
print(fibonacci_sequence)






    
    

