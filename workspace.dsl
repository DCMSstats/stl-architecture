
workspace "Short Term Lets Registration" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        admin = person "Administrator" "Manages registrations"
        operator = person "Operator" "Owns and runs a short term let"
        managementCompany = person "Management Company" ""

		group "Local Authority" {
			localAuthorityPlanner = person "Planner" "Plans housing schemes in Local Authority area"
    	    localAuthorityEnforcement = person "Enforcement" "Enforces STL scheme in Local Authority area"
		}

		bookingPlatform = softwaresystem "Booking Platform" "Lists short term lets and facilitates bookings" "External System"
        policyMakers = softwaresystem "Policy Makers" "" "External System"

        govpay = softwaresystem "GOV.UK Pay" "Allows users to make payments" "External System"
        oneLogin = softwaresystem "One Login" "Let's users sign in" "External System"
        govNotify = softwaresystem "GOV.UK Notify" "Sends users notifications" "External System"
        authProvider = softwaresystem "Authentication Provider" "Sign in for administrator's users" "External System"
        osPlacesApi = softwaresystem "OS Places API" "Identifies UK Addresses" "External System"

        group "Short Term Lets Service" {
            shortTermLets = softwaresystem "Short Term Lets Registration" "Platform for registering, and querying short term lets" "Software System" {
				application = container "Web Application" "Allows people to register short term lets and provides information" "TBD"
				register = container "STL Register" "Register of short term lets" "TBD" "Database"
				sessionStore = container "Session Store" "Session store for web application" "TBD" "Database"
				fileStore = container "File Store" "Storage for compliance documents" "TBD" "Database"
			}
        }

		group "VisitEngland" {
			veDataLake = softwaresystem "Visit England Data Lake" "" "External System"
			visitorReady = softwaresystem "Visitor Ready" "Entry level quality scheme" "External System"
		}

		operator -> shortTermLets "Registers a short term let" ""
		operator -> managementCompany "Hire to manage short term let"
		operator -> bookingPlatform "Lists STL on platform"
		managementCompany -> shortTermLets "Register short term lets on behalf of operator"
		managementCompany -> bookingPlatform "Lists short term let on platform"
		bookingPlatform -> shortTermLets "Verify registration of short term let"
		localAuthorityEnforcement -> shortTermLets "Reviews register"
		localAuthorityPlanner -> shortTermLets "Retrieve data on short term lets"
		shortTermLets -> visitorReady "Optionally enrol operators"
		shortTermLets -> veDataLake "Supply data on registration"
		policyMakers -> shortTermLets "Retrieve data on short term lets"

		shortTermLets -> govpay "User makes a payment"
		shortTermLets -> oneLogin "User signs into service"
		shortTermLets -> govNotify "Notify user of completed application"

		operator -> application "Registers a short term let" "HTTPS"
		admin -> application "Resolve queries about registrations" "HTTPS"
		application -> register "Store short term let data" "TCP/SQL"
		application -> govpay "User makes a payment" "HTTPS"
		application -> oneLogin "User signs into service" "HTTPS"
		application -> authProvider "Admin users sign into service" "HTTPS"
		application -> govNotify "Notify user of completed application" "HTTPS"
		application -> sessionStore "Store progress of user's registration"
		application -> fileStore "Upload/review compliance documents" "HTTPS"
		application -> osPlacesApi "Request addresses at postcode" "HTTPS"
    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            "structurizr.style.colors.primary" "#485fc7"
            "structurizr.style.colors.secondary" "#ffffff"
            "structurizr.style.logo.path" "site/logo.jpg"
        }

        systemContext shortTermLets {
            include *
            autoLayout
        }

        container shortTermLets "Containers" {
			title "[Container] Short Term Lets Registration - Target Architecture"
            include *
            autoLayout
        }

		systemlandscape "wholeProblem" {
			title "Solving a whole problem for users"
			include operator bookingPlatform localAuthorityEnforcement localAuthorityPlanner shortTermLets govpay oneLogin
			autoLayout
		}

		!include validation_view.dsl

        styles {
            element "Person" {
                color #ffffff
				background #999999
                fontSize 22
                shape Person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}
