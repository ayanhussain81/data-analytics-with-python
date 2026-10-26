# Question 01

student = {
    "Name": "Muhammad Hashir",
    "Age": 20,
    "Course": "Data Analytics with Python",
    "City": "Karachi",
}

print(f"Name: {student['Name']}\nAge: {student['Age']}\nCourse: {student['Course']}\nCity: {student['City']}")

# Question 02

car = {
"brand": "Toyota",
"model": "Corolla",
"year": 2018
}

car["color"] = "White"
car["year"] = 2022

print(car)

# Question 03

person = {
"name": "Ali",
"age": 25,
"city": "Karachi"
}

for key, value in person.items():
    print(f"{key}: {value}")

# Question 04

numbers = [1,2,2,3,3,3,4,4,4,4]

frequency = {}

for number in numbers:
    if number in frequency:
        frequency[number] += 1
    else:
        frequency[number] = 1

print(frequency)


# Question 05

Sen = input("Enter a sentence: ")

word_count = {}
for word in Sen.split():
    if word in word_count:
        word_count[word] += 1
    else:
        word_count[word] = 1

print(word_count)

# Question 06

marks = {
    "Math":80,
    "English":70,
    "Physics":90
}

# Total_sum = sum(marks.values()) 
# Average = Total_sum / len(marks)

# print("Total sum of marks:", Total_sum)
# print("Average marks:", Average)

# Question 07

students = {
"Ali":85,
"Sara":92,
"Ahmed":78,
"Zara":95
}
highest_score = 0
for name, score in students.items():
    if score > highest_score:
        highest_score = score
        top_student = name
    
print(f"Student with highest score: {top_student}")

# Question 08

dict1 = {
    "a":1,
    "b":2
}
dict2 = {
    "c":3,
    "d":4
}

merged_dict = {**dict1, **dict2}
print(merged_dict)

# Question 09

Contact_book = {
    "Ali":"123-456-7890",
    "Sara":"987-654-3210",
    "Ahmed":"555-555-5555"
}

contact_name = input("Enter the contact name: ").title()
if contact_name in Contact_book:
    print(f"{contact_name}'s contact number is: {Contact_book[contact_name]}")
else:
    print("contact not found")


