
workspace "Short Term Lets Registration" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        admin = person "Administrator" "Manages registrations"
        operator = person "Operator" "Owns and runs a short term let"
        managementCompany = person "Management Company" ""

		group "Local Authority" {
			localAuthorityPlanner = person "Planner" "Plans housing schemes in Local Authority area"
			localAuthorityOfficer = person "Officer" "Uses register to solve problems in local area"
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
				application = container "Web Application" "Allows people to register short term lets and provides information" "TBD" {
					registrationFlow = component "Operator Registration" "Flow for registering and renewing registration of short-term let"
					registerView = component "Register View" "View of register for approved groups"
					internalService = component "Internal Service" "Service to provide administrator access to complete registration tasks."
					aggregatedData = component "Data view" "Aggregated data from register"
					registerAdapter = component "Register Adapter" "Wrapper around register database"
				}
				register = container "STL Register" "Register of short term lets" "TBD" "Database"
				sessionStore = container "Session Store" "Session store for web application" "TBD" "Database"
				fileStore = container "File Store" "Storage for compliance documents" "TBD" "Database"
			}
        }

		group "VisitEngland" {
			veDataLake = softwaresystem "Visit England Data Lake" "" "External System"
			visitorReady = softwaresystem "Visitor Ready" "Entry level quality scheme" "External System"
		}

		operator -> managementCompany "Hire to manage short term let"
		operator -> bookingPlatform "Lists STL on platform"
		managementCompany -> shortTermLets "Register short term lets on behalf of operator"
		managementCompany -> bookingPlatform "Lists short term let on platform"
		bookingPlatform -> shortTermLets "Verify registration of short term let"
		localAuthorityPlanner -> shortTermLets "Retrieve data on short term lets"
		shortTermLets -> visitorReady "Optionally enrol operators"
		shortTermLets -> veDataLake "Supply data on registration"
		policyMakers -> shortTermLets "Retrieve data on short term lets"

		operator -> registrationFlow "Registers a short term let" "HTTPS"
		admin -> internalService "Resolve queries about registrations" "HTTPS"
		localAuthorityOfficer -> registerView "Finds contact details from register" "HTTPS"
		registerAdapter -> register "Store short term let data" "TCP/SQL"
		registrationFlow -> govpay "User makes a payment" "HTTPS"
		registrationFlow -> oneLogin "User signs into service" "HTTPS"
		registerView -> oneLogin "User signs into service" "HTTPS"
		internalService -> authProvider "Admin users sign into service" "HTTPS"
		registrationFlow -> govNotify "Notify user of completed application" "HTTPS"
		registrationFlow -> sessionStore "Store progress of user's registration"
		registerAdapter -> fileStore "Upload/review compliance documents" "HTTPS"
		registrationFlow -> osPlacesApi "Request addresses at postcode" "HTTPS"

		registrationFlow -> registerAdapter "Add or update registration"
		registerView -> registerAdapter "Retrieve information about registration"
		internalService -> registerAdapter "Manage registration"
		aggregatedData -> registerAdapter "Retrieve data about registrations"

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
            include *
            autoLayout
        }

		component application "Components" {
            include *
            autoLayout
        }

		systemlandscape "wholeProblem" {
			title "Solving a whole problem for users"
			include operator bookingPlatform localAuthorityOfficer localAuthorityPlanner shortTermLets govpay oneLogin
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
