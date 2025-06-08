# Test Tasks: ASP.NET Core API & Delphi VCL Contact Manager

This repository contains two test task solutions:

## ASP.NET Core API
- Built with ASP.NET Core and Entity Framework Core (.Net version 8)
- Manages persons and addresses with CRUD operations
- Supports filtering persons by first name, last name, and city
- API documented and testable via Swagger UI

## Delphi VCL Contact Manager (Delphi 12 used)
- Windows VCL application for managing personal contacts
- Features adding, deleting, saving, and loading contacts
- Contacts stored in CSV format
- Uses standard VCL components and Delphi file I/O

---

## Getting Started

### ASP.NET Core API
- Configure your database connection string in `appsettings.json`
- Migrations are already created — just update the database by running:
  ```powershell
  Update-Database -Context AppDbContext


### Delphi VCL Contact Manager
- Open the Delphi project in the IDE
- Compile and run the application
- Use the UI to manage contacts and save/load them from CSV files
- The API URL used by the application to communicate with the backend is set in the `FormCreate` method of the main form (`TfrmContactManager`), for example:

  ```pascal
  FApiUrl := 'https://localhost:7262/api/';

---

Feel free to explore the projects and provide feedback.
