
workspace "Short Term Lets Registration" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        operator = person "Operator" "Owns and runs a short term let" "Person"
        booker = person "Booker" "Books short term lets" "Person"
        neighbour = person "Neighbour" "Lives near a short term let" "Person"
        managementCompany = person "Management Company" "" "Person"
        bookingPlatform = softwaresystem "Booking Platform" "Lists short term lets and facilitates bookings" "External System"
        localAuthority = softwaresystem "Local Authority" "The local government for an area that contains Short Term Lets" "External System"
        visitEngland = softwaresystem "Visit England" "" "External System"
        policyMakers = softwaresystem "Policy Makers" "" "External System"

        group "DCMS" {
            shortTermLets = softwaresystem "Short Term Lets Registration" "Platform for registering, and querying short term lets" "Software System" {
				application = container "Web Application" "Allows people to register short term lets and provides information" "TBD"
				registry = container "STL Registry" "Register of short term lets" "TBD" "Database"
			}
        }

		operator -> shortTermLets "Registers a short term let"
		booker -> shortTermLets "Reviews information for a short term let"
		booker -> bookingPlatform "Books a short term let"
		neighbour -> shortTermLets "Reviews information for a short term let"
		operator -> managementCompany "Hire to manage short term let"
		managementCompany -> shortTermLets "Register short term lets on behalf of operator"
		bookingPlatform -> shortTermLets "Verify registration of short term let"
		localAuthority -> shortTermLets "Retrieve data on short term lets"
		visitEngland -> shortTermLets "Retrieve data on short term lets"
		policyMakers -> shortTermLets "Retrieve data on short term lets"

		operator -> application "Registers a short term let" "HTTPS"
		application -> registry "Store short term let data" "TCP/SQL"
    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            "structurizr.style.colors.primary" "#485fc7"
            "structurizr.style.colors.secondary" "#ffffff"
            "structurizr.style.favicon.path" "site/made-tech-logo.png"
            "structurizr.style.logo.path" "site/made-tech-logo.png"
        }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        container shortTermLets "Containers" {
            include *
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
