
workspace "Short Term Lets Registration" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        operator = person "Operator" "Owns and runs a short term let" "mva"
        booker = person "Booker" "Books short term lets"
        neighbour = person "Neighbour" "Lives near a short term let"
        managementCompany = person "Management Company" ""
        bookingPlatform = softwaresystem "Booking Platform" "Lists short term lets and facilitates bookings" "External System"
        localAuthority = softwaresystem "Local Authority" "The local government for an area that contains Short Term Lets" "External System"
        visitEngland = softwaresystem "Visit England" "" "External System"
        policyMakers = softwaresystem "Policy Makers" "" "External System"

        group "DCMS" {
            shortTermLets = softwaresystem "Short Term Lets Registration" "Platform for registering, and querying short term lets" "Software System" {
				application = container "Web Application" "Allows people to register short term lets and provides information" "TBD" "mva"
				registerAdapter = container "Resgister Adapter" "Controls management and access of the register" "TBD"
				register = container "STL Register" "Register of short term lets" "TBD" "Database,mva"
			}
        }

		operator -> shortTermLets "Registers a short term let" "mva"
		booker -> shortTermLets "Reviews information for a short term let"
		booker -> bookingPlatform "Books a short term let"
		neighbour -> shortTermLets "Reviews information for a short term let"
		operator -> managementCompany "Hire to manage short term let"
		managementCompany -> shortTermLets "Register short term lets on behalf of operator"
		bookingPlatform -> shortTermLets "Verify registration of short term let"
		localAuthority -> shortTermLets "Retrieve data on short term lets"
		visitEngland -> shortTermLets "Retrieve data on short term lets"
		policyMakers -> shortTermLets "Retrieve data on short term lets"

		# MVA
		operator -> application "Registers a short term let" "HTTPS" "mva"
		application -> register "Store short term let data" "TCP/SQL" "mva,only-mva"

		# Final architecture
		application -> registerAdapter "Request updates to the register" "HTTPS"
		registerAdapter -> register "Store and request short term let data" "TCP/SQL"
    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            "structurizr.style.colors.primary" "#485fc7"
            "structurizr.style.colors.secondary" "#ffffff"
            "structurizr.style.logo.path" "site/logo.jpg"
        }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        container shortTermLets "Containers" {
            include *
			exclude element.tag==only-mva relationship.tag==only-mva
            autoLayout
        }

        container shortTermLets "MVA-Containers" {
			title "[Container] Short Term Lets Registration - Minimum Viable Architecture"
			include element.tag==mva relationship.tag==mva
			autoLayout
		}

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
