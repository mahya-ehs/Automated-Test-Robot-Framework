# Invalid Nordea Login using Script 

### Overview
In this script I have used **Robot framework** and **SeleniumLibrary** in order to login to Nordea with wrong credentials and see whether the error message shows up or not. After running the Robot script, two important files are generated; `log.html` and `report.html`. 

In `log.html` you can see whether your test has passed or failed. In this case, if the login page shows the expected error message for wrong credentials, the test is passed, otherwise it's failed.

---

### Prerequisites
Before running this script, ensure the following dependencies are installed on your system:

**1. Install Python**
Download and install Python from [python.org](https://www.python.org/)

**2. Install a Python IDE**
You can use any IDE; VScode, PyCharm, etc.

**3. Install Robot Framework**

```sh
pip install robotframework
```

**4. Install SeleniumLibrary for Robot Framework**
```sh
pip install --upgrade robotframework-seleniumlibrary
```

**5. Install a WebDriver for Your Browser**
Robot Framework requires a WebDriver to automate a web browser. Install a driver based on your preferred browser:

- Google Chrome:
```sh
pip install webdriver-manager
```
- Mozilla Firefox:
```sh
pip install geckodriver-autoinstaller
```

---

### Usage
After installing the required libraries and dependices, open your IDE and write the following command in terminal to run the script:
```sh
robot script.robot
```

---

### Results
I used **Code Calculator** login method and entered `12345` as User ID and `123456789` as Response Code. The error message `"Tarkista syöttämäsi tiedot ja yritä uudelleen."` shows up after submitting these invlaid credentials; therefore, the test is passed.


