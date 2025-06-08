import csv
from faker import Faker
import tkinter as tk
from tkinter import filedialog

fake = Faker()

# Ask user for file save location and name
root = tk.Tk()
root.withdraw()  # Hide the main window

file_path = filedialog.asksaveasfilename(
    defaultextension=".csv",
    filetypes=[("CSV files", "*.csv")],
    title="Save CSV file as"
)

if file_path:
    num_records = 1000  # Number of random rows

    with open(file_path, mode="w", newline="") as file:
        writer = csv.writer(file)
        #writer.writerow(["Name", "LastName", "City", "AddressLine"])

        for _ in range(num_records):
            writer.writerow([
                fake.first_name(),
                fake.last_name(),
                fake.city(),
                fake.street_address()
            ])

    print(f"CSV file saved successfully at: {file_path}")
else:
    print("No file selected, exiting.")
