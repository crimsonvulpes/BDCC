extends "res://CrimsonLib/Base/CheatMenu.gd"

var inventoryScreenScene = preload("res://UI/Inventory/InventoryScreen.tscn")

var sellingItemsTags = [
	ItemTag.SoldByGeneralVendomat,
	ItemTag.SoldByMedicalVendomat,
	ItemTag.SoldByUnderwearVendomat,
	ItemTag.SoldByTheAnnouncer,
	ItemTag.SoldByAlexRynard,
	ItemTag.SoldByMirri
]
var sellingItems = [
	
]

var sellItemsData = {}
var sortedItemsIds = []
var finalSellingItemsObjects = []

var lockedInto = false

# NEW: quick sell
var shoppingCart = []
var shoppingIsSelling = true
var shoppingCost = 0
# END: quick sell

func _initScene(_args = []):
	if ( _args.size() > 0 ):
		if _args[0] == true:
			from_floor = _args[0]
			
		#print(_args[0])
		#lockedInto = true
		#setState(_args[1])

func _reactInit():
	updateSellingItems()
	shoppingCost = GM.pc.getCredits()

func _init():
	sceneID = getId("Vendomat")

func _run():
	._run()
	
	if ( state == "" ):
		# NEW: quick sell
		if(lockedInto):
			endScene()
			shoppingReceipt()
			return
		# END: quick sell
		else:
			saynn("MEOW!!")
			
			# NEW: quick sell
			shoppingReceipt()
			# END: quick sell
			
			addButton("Buy", "See what the machine has to sell", "buymenu")
			addButton("Sell", "See what you can sell", "sellmenu")
			addButton("Inventory", "Inventory", "inventoryScene")
			addButton("Stash", "Stash", "playerStashScene")
			addButton("Step away", "Step away from the machine", "endthescene")
	
	if ( state == "buymenu" ):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(finalSellingItemsObjects, "buy")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		
		addButton("Back", "Don't buy anything", "")
	
	if ( state == "sellmenu" ):
		var inventory = inventoryScreenScene.instance()
		GM.ui.addFullScreenCustomControl("inventory", inventory)
		inventory.setItems(GM.pc.getInventory().getAllSellableItems(), "sell")
		var _ok = inventory.connect("onItemSelected", self, "onInventoryItemSelected")
		var _ok2 = inventory.connect("onInteractWith", self, "onInventoryItemInteracted")
		var _ok3 = inventory.connect("onInteractWithGroup", self, "onInventoryItemGroupInteracted")
		
		addButton("Back", "Don't sell anything", "")


func _react(_action: String, _args):
	._react(_action, _args)
#	if ( _action == "" ):	# removed for Quick Sell
#		if(lockedInto):
#			endScene()
#			return
	if ( _action == "inventoryScene"):
		runScene("InventoryScene")
		return
	if ( _action == "playerStashScene"):
		runScene("PlayerStashScene")
		return
		
	if ( _action == "buy" ):
		var itemID = _args[0]
		var amount = 1
		if(_args.size() > 1):
			amount = _args[1]
		var item = sellItemsData[itemID]
		var itemName = item["name"]
		if((item["amount"] * amount) > 1):
			itemName = str(item["amount"] * amount)+"x "+itemName
		
		for _i in range(amount):
			var itemObject = GlobalRegistry.createItem(itemID)
			if(item["amount"] > 1):
				itemObject.setAmount(item["amount"])
			GM.pc.getInventory().addItem(itemObject)
		GM.pc.addCredits(-sellItemsData[itemID]["price"] * amount)

		
		addMessage(""+itemName+" was added to your inventory")
		
		# NEW: quick sell
		shoppingIsSelling = false
		var shoppingList = str(itemName)
		shoppingCart.append(shoppingList)
		# END: quick sell
		
#		if(lockedInto):	# removed for Quick Sell
#			endScene()
#			return
#		setState("")
#		setState("buymenu")
		return
		
	if ( _action == "sell" ):
		var item = _args[0]
		var howMuch = 1
		if(_args.size() > 1):
			howMuch = _args[1]
		howMuch = Util.mini(item.getAmount(), howMuch)
		var howMuchStr = str(howMuch)+"x "
		
		GM.pc.addCredits(item.getSellPrice() * howMuch)
		GM.pc.getInventory().removeXFromItemOrDelete(item, howMuch)
		
		addMessage(howMuchStr+item.getVisibleName()+" was sold for "+str(item.getSellPrice() * howMuch) + " credits")
		
		# NEW: quick sell
		shoppingIsSelling = true
		var shoppingList = str(howMuchStr+item.getVisibleName())
		shoppingCart.append(shoppingList)
		# END: quick sell
		
#		setState("")	# removed for Quick Sell
#		setState("sellmenu")
#		if(lockedInto):
#			endScene()
#			return
		return

	if ( _action == "sellall" ):
		var item = _args[0]
		var allSellableItems = GM.pc.getInventory().getAllSellableItems().duplicate()
		var resultAdd = 0
		var howMuch = 0
		
		for sellitem in allSellableItems:
			if(sellitem.id == item.id):
				var amountToSell = sellitem.getAmount()
				howMuch += amountToSell
				
				resultAdd += sellitem.getSellPrice() * amountToSell
				
				GM.pc.getInventory().removeXFromItemOrDelete(sellitem, amountToSell)

		var howMuchStr = str(howMuch)+"x "
		resultAdd = int(resultAdd)
		addMessage(howMuchStr+item.getVisibleName()+" was sold for "+str(resultAdd) + " credits")
		GM.pc.addCredits(resultAdd)
		
		# NEW: quick sell
		shoppingIsSelling = true
		var shoppingList = str(howMuchStr+item.getVisibleName())
		shoppingCart.append(shoppingList)
		# END: quick sell
		
#		setState("")	# removed for Quick Sell
#		setState("sellmenu")
#		if(lockedInto):
#			endScene()
#			return
		return
	
	setState(_action)




func sort_stock(a, b):
	if sellItemsData[a]["price"] < sellItemsData[b]["price"]:
		return true
	return false

func updateSellingItems():
	sellItemsData.clear()
	sortedItemsIds.clear()
	
	var finalSellingItems = []
	finalSellingItems.append_array(sellingItems)
	
	for itemTag in sellingItemsTags:
		var itemIDs = GlobalRegistry.getItemIDsByTagSlow(itemTag)
		finalSellingItems.append_array(itemIDs)
	
	for itemID in finalSellingItems:
		if(sellItemsData.has(itemID)):
			continue
		
		var itemObject = GlobalRegistry.getItemRef(itemID)
		sellItemsData[itemID] = {
			"name": itemObject.getVisibleName(),
			"desc": itemObject.getVisisbleDescription(),
			"price": itemObject.getPrice(),
			"amount": itemObject.getBuyAmount(),
		}
		sortedItemsIds.append(itemID)
		finalSellingItemsObjects.append(itemObject)
	sortedItemsIds.sort_custom(self, "sort_stock")	

func onInventoryItemInteracted(item: ItemBase):
	if ( state == "buymenu" ):
		GM.main.pickOption("buy", [item.id])
	if ( state == "sellmenu" ):
		GM.main.pickOption("sell", [item, item.getAmount()])

func onInventoryItemSelected(item: ItemBase):
	GM.ui.clearButtons()
	addButton("Back", "Don't do anything", "")
	
	if ( state == "buymenu" ):
		var itemData = sellItemsData[item.id]
		var itemAmountPerBuy = itemData["amount"]
		var itemPrice = itemData["price"]
		
		var credits = GM.pc.getCredits()
		var amounts = [1, 2, 3, 4, 5, 10, 20]
		for amount in amounts:
			var newPrice = itemPrice * amount
			var newAmount = itemAmountPerBuy * amount
			
			if(credits >= newPrice):
				addButton("Buy "+(str(newAmount))+" for "+str(newPrice)+" credits", "Amount: "+str(newAmount)+"\nPrice: "+str(newPrice)+" credits", "buy", [item.id, amount])
			else:
				addDisabledButton("Buy "+(str(newAmount))+" for "+str(newPrice)+" credits", "Amount: "+str(newAmount)+"\nPrice: "+str(newPrice)+" credits\nYou don't have enough credits")
	if ( state == "sellmenu" ):
		var itemAmount = item.getAmount()
		var amounts = [1, 2, 3, 4, 5, int(itemAmount * 0.3), int(itemAmount * 0.5), int(itemAmount * 0.7), itemAmount]
		amounts.sort()
		var amountsUsed = {}
		
		for amount in amounts:
			if(amount < 1):
				continue
			if(itemAmount < amount):
				break
			if(amountsUsed.has(str(amount))):
				continue
			amountsUsed[str(amount)] = true
			
			var newSellPrice = item.getSellPrice() * amount
			
			addButton("Sell "+(str(amount))+" for "+str(newSellPrice)+" credits", "Amount: "+str(amount)+"\nPrice: "+str(newSellPrice)+" credits", "sell", [item, amount])
			
func onInventoryItemGroupInteracted(item: ItemBase):
	if ( state == "sellmenu" ):
		GM.main.pickOption("sellall", [item])



func saveData():
	var data = .saveData()
	
	data["lockedInto"] = lockedInto

	return data

func loadData(data):
	.loadData(data)
	
	lockedInto = SAVE.loadVar(data, "lockedInto", false)
	
	updateSellingItems()



# NEW: quick sell		
func shoppingReceipt():
	var shoppingMessage
	if(shoppingIsSelling == true && shoppingCart.size() > 0):
		shoppingMessage = "Items Sold:"
	if(shoppingIsSelling == false && shoppingCart.size() > 0):
		shoppingMessage = "Items Purchased:"
	var finalCreds = GM.pc.getCredits() - shoppingCost
	var finalCredsString = "%+d" % finalCreds if finalCreds != 0 else "0"
	if(shoppingCart.size() > 0):
		addMessage("Credits:   "+str(finalCredsString))
		addMessage(str(shoppingMessage))
		addMessage("")
		for i in shoppingCart:
			addMessage(i)
	shoppingCart.clear()
	shoppingCost = GM.pc.getCredits()
# END: quick sell
	
