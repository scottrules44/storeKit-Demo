local store = require("plugin.storeKit")
local json = require("json")
store.init(function(e)
	print( "init") 
	print( "------" )
	print(json.prettify(e) )
    print( "------" )
	if e.transaction.state == "purchased" then
		native.showAlert("storeKit", "the purchase worked", {"ok"})
	end
end)

--note you have to load product before restoreing

local Products = {"com.anscamobile.NewExampleInAppPurchase.NonConsumableTier1", "com.anscamobile.NewExampleInAppPurchase.SubscriptionTier2"}
local thePurchaseProduct = "com.anscamobile.NewExampleInAppPurchase.NonConsumableTier1"

local textLoadProduct =display.newText( "Load Products", display.contentCenterX, display.contentCenterY+50, native.systemFontBold )
textLoadProduct:addEventListener( "tap", function ( e )
	store.loadProducts( Products, function ( e )
        print( "loadProducts")
        print( "------" )
        print(json.prettify(e) )
        print( "------" )
		native.showAlert("storeKit", "products loaded", {"ok"})
	end )
end )

local textPurchase =display.newText( "Purchase", display.contentCenterX, display.contentCenterY, native.systemFontBold )
textPurchase:addEventListener( "tap", function ( e )
	store.purchase(thePurchaseProduct)
end )

local textRestore =display.newText( "Restore", display.contentCenterX, display.contentCenterY-50, native.systemFontBold )
textRestore:addEventListener( "tap", function ( e )
    print("restore")
	store.restore()
end )
