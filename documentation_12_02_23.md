## Backend




# NOTE:  
# 1) The Base URL is: "api/"
# 2) The response from the api always contains two or three(if a get request) variables:
# 3) The message variable will be replaced by an error message if the request fails.
# 4) Get requests will contain another variable "response" which will contain the data fetched from the database.
### response from the database:
    {
        "message":"Description",
        "result":"a boolean value true or false depending on the success of the response"
    }




# TABLE OF CONTENTS:
### 1)[**CONTRACTOR**](#contractor-apis)
### 2)[**EMPLOYEE**](#employee-apis)
### 3)[**PAYMENTS**](#payment-apis)
### 4)[**RECEIVING**](#receiving-apis)
### 5)[**Cumulative**]()
# For SIGNUP
##  **1) POST** :  &nbsp;&nbsp; /getOTP
### desc: Sends an OTP to the given number.
### body:
        {
            phone_no: "phone_no"
        }

## **2) POST** : &nbsp;&nbsp; /verifyOTP
### desc: Verifies the SENT OTP.
### body: 
        {
            phone_no: "phone_no"
            otp:"6 digit OTP"
        }
### response: 
### Sends a cookie with the token created which will be required for all other transactions .
        {
            message: "OTP verified! session created", 
            result: true 
        }



# FOR LOGIN

## **1) POST: /loginVerifyOTP**
### desc: Verifies the OTP for LOGIN
### body:
        {
           phone_no: "phone_no"
           otp:"6 digit OTP"    
        }
### response: same as loginOTP

# ---------------------------**Contractor APIs**-------------:
## **1)POST: &nbsp; construction/contractor/add_project**
### desc: adds project of the logged in Contractor
### header: session cookie sent during login 
### body : can include other work categories as well, The below is just an example
        {
            "Name":"ABC",
            "Location":"Mumbai",
            "withMaterial":"yes",
            "work":[
                {
                "description":"Layout",
                "rate":"2312",
                "unit":"SQM"
                },
                {
                "description":"Excavation",
                "rate":"213",
                "unit":"SFT"
                }
            ]
        }


## **2)POST: &nbsp; &nbsp; construction/contractor/calculateBill**
### desc: calculates bill of an existing project
### header: session cookie
### request body: An Example: Note: To Explain, The granite object has an array of object named subItem which contains objects. Each Object can contain description (string), a subheading (object), and subItems(array of objects). The subheading can also contain a description(string) and subItems(array of objects). The subItems contain Unit length with NOS Quantity, Height etc. Refer to the model for more info.

            {
    "Name":"Kiran",
    "BillDate":"2022-12-15",
    "Location":"Mumbai",
    "CalculateBill":"768",
    "work":[
        {
            "title":"Granite",
            "unit":"SQT",
            "description": [
                    {
                        "description": "BLOCK-2,Main Entrance",
                        "total":"700",
                        "brief": [
                            {
                                "brief": "Tread",
                                "unit": "SQM",
                                "number": "7",
                                "length": "5.090",
                                "width": "0.330",
                                "height": "11.758"
                            },
                            {
                                "brief": "NewBrief",
                                "unit": "SQM",
                                "number": "1",
                                "length": "5.090",
                                "width": "2.840",
                                "height": "14.456"
                            },
                            {
                                "description": "BASIN COUNTER(FEMALE TOILET OFFICE AREA)",
                                "unit": "SQM",
                                "number": "2",
                                "length": "12.12",
                                "width": "213",
                                "height": "0.750"
                            }
                        ]
                    },
                    {
                        "description": "BLOCK-1,Main Entrance",
                        "total":"500",
                        "brief": [
                            {
                                "brief": "Tread",
                                "unit": "SQM",
                                "number": "7",
                                "length": "5.090",
                                "width": "0.330",
                                "height": "11.758"
                            },
                            {
                                "brief": "NewBrief",
                                "unit": "SQM",
                                "number": "1",
                                "length": "5.090",
                                "width": "2.840",
                                "height": "14.456"
                            },
                            {
                                "description": "BASIN COUNTER(FEMALE TOILET OFFICE AREA)",
                                "unit": "SQM",
                                "number": "2",
                                "length": "12.12",
                                "width": "213",
                                "height": "0.750"
                            }
                        ]
                    }
                ]
        },
        {
            "title":"Tile",
            "unit":"SQT",
            "description": [
                    {
                        "description": "BLOCK-2,Main Entrance",
                        "total":"692",
                        "brief": [
                            {
                                "brief": "Tread",
                                "unit": "SQM",
                                "number": "7",
                                "length": "5.090",
                                "width": "0.330",
                                "height": "11.758"
                            },
                            {
                                "brief": "NewBrief",
                                "unit": "SQM",
                                "number": "1",
                                "length": "5.090",
                                "width": "2.840",
                                "height": "14.456"
                            },
                            {
                                "description": "BASIN COUNTER(FEMALE TOILET OFFICE AREA)",
                                "unit": "SQM",
                                "number": "2",
                                "length": "12.12",
                                "width": "213",
                                "height": "0.750"
                            }
                        ]
                    },
                    {
                        "description": "BLOCK-1,Main Entrance",
                        "total":"282",
                        "brief": [
                            {
                                "brief": "Tread",
                                "unit": "SQM",
                                "number": "7",
                                "length": "5.090",
                                "width": "0.330",
                                "height": "11.758"
                            },
                            {
                                "brief": "NewBrief",
                                "unit": "SQM",
                                "number": "1",
                                "length": "5.090",
                                "width": "2.840",
                                "height": "14.456"
                            },
                            {
                                "description": "BASIN COUNTER(FEMALE TOILET OFFICE AREA)",
                                "unit": "SQM",
                                "number": "2",
                                "length": "12.12",
                                "width": "213",
                                "height": "0.750"
                            }
                        ]
                    }
                ]
        }
    ]
    
    }   

## **2)POST: &nbsp; &nbsp; construction/contractor/CompanyCred**
### desc: Company Credentials
### header: session token
### body: 
        
            {
                "GST":"adwd",
                "PAN":"awdaw",
                "GSTNumber":"awwa",
                "CompanyName":"awdaw",
                "PlaceOfSupply":"awdaw"
            }

## **3)POST: &nbsp; &nbsp; construction/contractor/profile**
### desc: Company Profile
### header: session token
### body:
        {
              Construction: {
        type: String
            },
            Interior: {
                type: String
            },
            Architecture: {
                type: String
            },
            Carpenter: {
                type: String,
            },
            Plumber: {
                type: String,
            },
            Electrician: {
                type: String,
            },
            Broker: {
                type: String
            } 
        }


## **3)GET: &nbsp; &nbsp; construction/contractor/profile**

### desc: gets all the projects of the logged in Contractor
### header: session cookie

## **4)GET: &nbsp; &nbsp; construction/contractor/getProject/:ProjectName**
### header: session cookie
### desc: gets the specified project
## **5)GET: &nbsp; &nbsp; construction/contractor/logout**
### desc: deletes the session cookie.



## **6)GET: &nbsp; &nbsp; construction/contractor/getAllProjects**
### desc: Gets all projects



## **-----------PAYMENT APIs:---------------------------**

## **7)GET: &nbsp; &nbsp; construction/Payment/getPayment/:PaymentID**
### desc: Gets a payment with the Payment ID

## **8)POST: &nbsp; &nbsp; : construction/Payment/AddPayment**
    BODY:
        {
           PaymentID: {
                type: String,
                unique: true,
                required: true
            },
            EmployeeID: {
                type: String,
            },
            PaymentFor: {
                type: String,
                required: true
            },
            EmployeeName: {
                type: String,
            },
            PaymentDate: {
                type: Date,
                required: true
            },
            Image: {
                type: String,
            }
        }
### desc: Adds a payment

## **9)GET:  construction/Payment/getAllPayments**
### desc: Gets all Payments

## **10)PUT: construction/Payment/UpdatePayment**
### desc: Updates the Payment
    BODY:
        {
            SAME AS ADD PAYMENT
        }

## **11)delete: construction/Payment/DeletePayment/:PaymentID**
### desc: Delets the Payment

## **12)GET:  construction/Payment/getPayments/EmployeePayments**
### desc: Gets the Payments made to Employee in descending order of date

## **13)GET:  construction/Payment/getPayments/TravelPayments**
### desc: Gets the Payments made to Travel in descending order of date


## **14)GET:  construction/Payment/getPayments/FoodPayments**
### desc: Gets the Payments made to Food in descending order of date

## **15)GET:  construction/Payment/getPayments/MaterialPayments**
### desc: Gets the Payments made to Material in descending order of date

## **16)GET:  construction/Payment/getPayments/TravelPayments**
### desc: Gets the Payments made to Travel in descending order of date


# ---------Receiving APIs----------

## **17)POST: api/construction/Receiving/AddReceiving**
### desc: Adds the Receiving with the given details
        {
            ReceivingID: {
                type: String,
                required: true,
                unique: true
            },
            ReceivedFrom: {
                type: String,
                required: true
            },
            Project: {
                type: String,
                required: true
            },
            ReceivedDate: {
                type: Date,
                required: true
            },
            Reason: {
                type: String
            }
        }

## **17)PUT: api/construction/Receiving/UpdateReceiving**
### desc: Updates the existing receiving with the given details in the body
        {
            Same as Add Receiving
        }
##  **18)delete: api/construction/Receiving/DeleteReceiving/:ReceivingID**
### desc: deletes the existing receiving with the receiving ID as the params

## **19)get: api/construction/Receiving/getAllRecevings**
### desc: gets all the receivings


# ---------Employee APIs----------

## **20)GET: api/construction/Employee/getEmployee/:EmployeeID**
### desc: gets the specific employee 

## **21)GET: api/construction/Employee/getAllEmployees**
### desc: gets all the employees

## **22)POST: api/construction/Employee/addEmployee**
### desc: adds the Employee given the details
        {
            EmployeeID: {
                type: String,
                required: true,
                unique: true
            },
            Name: {
                type: String,
                required: true
            },
            Mobile: {
                type: String,
                required: true
            },
            Salary: {
                type: String,
                required: true
            },
            StartDate: {
                type: Date,
                required: true
            },
            Project: {
                type: String,
                required: true
            }
        }

## **23)PUT: api/construction/Employee/UpdateEmployee**
### desc: Updates the existing employee with the given details
        {
            Same as Add Employee
        }
## **24)delete: api/construction/Employee/DeleteEmployee/:EmployeeID**
### desc: deletes the Employee with the given ID in the params



# ----------Cumulative API----------------

## **25)GET: api/construction/cumulative/getcumulative/:ProjName**
### desc: gets the cumulative bill for the given Project Name