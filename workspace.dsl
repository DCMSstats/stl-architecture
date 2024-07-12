
workspace "Short Term Lets Registration" "MISSING" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        operator = person "Operator" "Owns and runs a short term let" "Person"

        group "DCMS" {
            shortTermLets = softwaresystem "Short Term Let Registration" "Platform for registering, and querying short term lets" "Software System"
        }

		operator -> shortTermLets "Registers a short term let"

        deploymentEnvironment "Development" {
        }

        deploymentEnvironment "Live" {
        }
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

        styles {
            element "Person" {
                color #ffffff
				background #999999
                fontSize 22
                shape Person
            }
            element "Citizen" {
                background #08427b
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
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
