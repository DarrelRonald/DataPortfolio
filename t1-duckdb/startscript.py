print("startup complete")

with open("requirements.txt", "r") as file:
    for line in file:
        print(line.strip())
