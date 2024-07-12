
workspace "Short Term Lets Registration" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        operator = person "Operator" "Owns and runs a short term let" "Person"
        booker = person "Booker" "Books short term lets" "Person"
        neighbour = person "Neighbour" "Lives near a short term let" "Person"
        managementCompanies = person "Management Companies" "" "Person"
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
		operator -> application "Registers a short term let"
		application -> registry "Store short term let data"
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
