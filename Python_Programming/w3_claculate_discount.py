def calculate_discount(price, discount_percent):
    if discount_percent >= 20:
        discount_amount = price * (discount_percent / 100)
        final_price = price - discount_amount
        return final_price
    else:
        return price

# Prompt the user for input
original_price = float(input("Enter the original price of the item: "))
discount_percent = float(input("Enter the discount percentage: "))

# Calculate the final price using the function
final_price = calculate_discount(original_price, discount_percent)

# Print the result
if final_price != original_price:
    print(f"The final price after applying {discount_percent}% discount is: ${final_price:.2f}")
else:
    print("No discount applied. The original price remains: ${:.2f}".format(original_price))


list1 = [3 , 2 , 5 , 6 , 0 , 7, 9]

sum = 0
sum1 = 0
for elem in list1:

    if (elem % 2 == 0):
        sum = sum + elem
    continue

if (elem % 3 == 0):
    sum1 = sum1 + elem

print(sum , end=" ")