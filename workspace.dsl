
workspace "Short Term Lets Registration" "MISSING" {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        operator = person "Operator" "Owns and runs" "Person"

        group "DCMS" {
            bankingSystem = softwaresystem "Banking System" "Stores all of the core banking information about citizens, accounts, transactions, etc." "Existing System"
        }

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
