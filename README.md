# 🏨 Hotel Reservation Management System

A simple Streamlit web application for managing hotel reservations.

## 📁 Project Structure

```
project-base-donnees/
├── app/
│   ├── pages/                   
│   │   ├── agences_page.py       
│   │   ├── chambers_page.py      
│   │   └── reservations_page.py   
│   ├── utils/
│   │   ├── __init__.py
│   │   └── database_connection.py  
│   ├── images/                    
│   └── home_page.py              
├── data/
│   └── mysqlsampledatabase.sql    # Database schema and data
├── .env                           # Environment variables
├── docker-compose.yml             # Docker configuration
├── requirements.txt               # Python dependencies
└── README.md                      # This file
```

## 🚀 How to Run

### Step 1: Start the Database
```bash
docker-compose up -d
```

### Step 2: Install Python Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run the Streamlit App
```bash
cd app
streamlit run home_page.py
```

### Step 4: Open in Browser
Go to: http://localhost:8501


## 📝 Notes

- Make sure Docker is running before starting the app
- The database is automatically initialized with sample data
