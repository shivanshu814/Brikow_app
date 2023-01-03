<!-- @format -->

## Backend

##http://admin.brikow.com/api/ ##http://3.109.154.123/api

# For SIGNUP

## **1) POST** : &nbsp;&nbsp; /getOTP

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

# Contractor:

## **1)POST: &nbsp; /contractor/add_project**

### desc: adds project of the logged in Contractor

### header: session cookie sent during login

### body : can include other work categories as well, The below is just an example

        {
            "Name":"ABC",
            "Location":"Mumbai",
            "withMaterial":"yes",
            "work":{
                "Layout":{
                "rate":"2312",
                "unit":"SQM"
                },
                "Excavation":{
                "rate":"213",
                "unit":"SFT"
                }
            }
        }

## **2)POST: &nbsp; &nbsp; /contractor/calculateBill**

### desc: calculates bill of an existing project

### header: session cookie

### request body: An Example: Note: To Explain, The granite object has an array of object named subItem which contains objects. Each Object can contain description (string), a subheading (object), and subItems(array of objects). The subheading can also contain a description(string) and subItems(array of objects). The subItems contain Unit length with NOS Quantity, Height etc. Refer to the model for more info.

            {
                {"Name": "ABC",
            "Location": "Mumbai",
            "CalculateBill": "",
            "work":
            {
                "Layout": {
                    "Total": "200"
                },
                "Excavation": {
                    "Total": "300"
                },
                "PCC": {
                    "Total": "212"
                },
                "Reinforcement_With_Tools": {
                    "Total": "awdaw"
                },
                "Granite": {
                    "subItem": [
                    {
                        "description": "BLOCK-2,Main Entrance",
                        "subHeading": {
                            "description": "BLOCK-1A, Main Entrance",
                            "subItems": [
                                {
                                    "description": "Tread",
                                    "Unit": "SQM",
                                    "NOS": "7",
                                    "Length": "5.090",
                                    "Width": "0.330",
                                    "Quantity": "11.758"
                                },
                                {
                                    "description": "LANDING",
                                    "Unit": "SQM",
                                    "NOS": "1",
                                    "Length": "5.090",
                                    "Width": "2.840",
                                    "Quantity": "14.456"
                                }
                            ]
                        },
                        "subItems": [
                            {
                                "description": "Tread",
                                "Unit": "SQM",
                                "NOS": "7",
                                "Length": "5.090",
                                "Width": "0.330",
                                "Quantity": "11.758"
                            },
                            {
                                "description": "LANDING",
                                "Unit": "SQM",
                                "NOS": "1",
                                "Length": "5.090",
                                "Width": "2.840",
                                "Quantity": "14.456"
                            },
                            {
                                "description": "BASIN COUNTER(FEMALE TOILET OFFICE AREA)",
                                "Unit": "SQM",
                                "NOS": "2",
                                "Length": "12.12",
                                "Width": "213",
                                "Quantity": "0.750"
                            }
                        ]
                    },
                    {
                        "description": "GRANITE PATTI",
                        "subHeading": {
                            "description": "BLOCK-1A, Main Entrance",
                            "subItems": [
                                {
                                    "description": "RISER",
                                    "Unit": "SQM",
                                    "NOS": "7",
                                    "Length": "5.090",
                                    "Quantity": "30.600"
                                }
                            ]
                        },
                        "subItems": [
                            {
                                "description": "BLOCK-2, MAIN ENTRANCE RISER",
                                "Unit": "MTR",
                                "NOS": "7",
                                "Length": "5.090",
                                "Width": "0.330",
                                "Quantity": "11.758"
                            },
                            {
                                "description": "BLOCK-2, DRINKING AREA COUNTER",
                                "Unit": "MTR",
                                "NOS": "1",
                                "Length": "5.090",
                                "Quantity": "14.456"
                            },
                            {
                                "description": "LATAK (HANDICAP TOILET)",
                                "Unit": "MTR",
                                "NOS": "2",
                                "Length": "12.12",
                                "Quantity": "0.750"
                            },
                            {
                                "description": "LATAK (MALE TOILET)",
                                "Unit": "MTR",
                                "NOS": "2",
                                "Length": "12.12",
                                "Quantity": "0.750"
                            }
                        ]
                    },
                    {
                        "description": "GRANITE HALF MOULDING",
                        "subHeading": {
                            "description": "BLOCK-1A, Main Entrance",
                            "subItems": [
                                {
                                    "description": "RISER",
                                    "Unit": "SQM",
                                    "NOS": "7",
                                    "Length": "5.090",
                                    "Quantity": "30.600"
                                }
                            ]
                        },
                        "subItems": [
                            {
                                "description": "BLOCK-2, MAIN ENTRANCE TREAD",
                                "Unit": "MTR",
                                "NOS": "7",
                                "Length": "5.090",
                                "Width": "0.330",
                                "Quantity": "11.758"
                            },
                            {
                                "description": "BLOCK-2, DRINKING AREA COUNTER",
                                "Unit": "MTR",
                                "NOS": "1",
                                "Length": "5.090",
                                "Quantity": "14.456"
                            }
                        ]
                    }
                ]
            }
        }
    }

}

## **2)POST: &nbsp; &nbsp; /contractor/CompanyCred**

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

## **3)POST: &nbsp; &nbsp; /contractor/profile**

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

## **3)GET: &nbsp; &nbsp; /contractor/profile**

### desc: gets all the projects of the logged in Contractor

### header: session cookie

## **4)POST: &nbsp; &nbsp; /contractor/getProject**

### header: session cookie

### body:

    {
        "Name":"PROJECT NAME"
    }

## **5)GET: &nbsp; &nbsp; /contractor/logout**

### desc: deletes the session cookie.
