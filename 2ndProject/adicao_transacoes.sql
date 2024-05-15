import datetime

class Transaction:
    def __init__(self, timestamp, operation, data):
        self.timestamp = timestamp
        self.operation = operation
        self.data = data

class Database:
    def __init__(self):
        self.memory_disk = []
        self.log_file = "transaction_log.txt"

    def add_transaction(self, operation, data):
        timestamp = datetime.datetime.now()
        transaction = Transaction(timestamp, operation, data)
        self.memory_disk.append(transaction)
        self.write_to_log(transaction)

    def write_to_log(self, transaction):
        with open(self.log_file, "a") as file:
            file.write(f"{transaction.timestamp}: {transaction.operation} - {transaction.data}\n")

    def display_memory_disk(self):
        print("Memory Disk:")
        for transaction in self.memory_disk:
            print(f"{transaction.timestamp}: {transaction.operation} - {transaction.data}")

def main():
    db = Database()

    while True:
        print("\n1. Add transaction")
        print("2. Display Memory Disk")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            operation = input("Enter operation: ")
            data = input("Enter data: ")
            db.add_transaction(operation, data)
            print("Transaction added successfully!")
        elif choice == '2':
            db.display_memory_disk()
        elif choice == '3':
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
