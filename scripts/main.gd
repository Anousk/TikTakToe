extends Node

signal changed_player

@onready var sprite_2d = $Sprite2D
@onready var label = $Label

var positions = {
	"1_1":	"aplaceholder",
	"1_2":	"bplaceholder",
	"1_3":	"cplaceholder",
	"2_1":	"dplaceholder",
	"2_2":	"eplaceholder",
	"2_3":	"fplaceholder",
	"3_1":	"gplaceholder",
	"3_2":	"hplaceholder",
	"3_3":	"iplaceholder",
}
var player:bool = true

func player_updater() -> String:
	var currentPlayer:String
	if player == true:
		player = false
		currentPlayer = "x"
	else:
		player = true
		currentPlayer = "o"
	
	return currentPlayer
	
func game_over(type:String) -> void:
	sprite_2d.visible = true
	
	if type == "drawn":
		label.text = "Game drawn"
	else:
		label.text = type + " won the game!"
	label.visible = true
	
func game_running() -> void:
	var won:bool = false
	for i in range(1,3):
		if positions[str(i) + "_1"] == positions[str(i) + "_2"] && positions[str(i) + "_2"] == positions[str(i) + "_3"]:
			player_updater()
			game_over(player_updater())
			won = true
			break
		if positions["1_" + str(i)] == positions["2_" + str(i)] && positions["2_" + str(i)] == positions["3_" + str(i)]:
			player_updater()
			game_over(player_updater())
			won = true
			break
	if positions["1_1"] == positions["2_2"] && positions["2_2"] == positions["3_3"]:
		player_updater()
		game_over(player_updater())
	elif positions["1_3"] == positions["2_2"] && positions["2_2"] == positions["3_1"]:
		player_updater()
		game_over(player_updater())
	var positionsLength = positions
	if len(positions) == 9 && !won && len(str(positionsLength)) <= 110:
		print(str(positionsLength))
		game_over("drawn")
		

func _on__3_changing_player_3_3():
	changed_player.emit()
	positions["3_3"] = player_updater()
	
	game_running()

func _on__2_changing_player_3_2():
	changed_player.emit()
	positions["3_2"] = player_updater()
	
	game_running()

func _on__1_changing_player_3_1():
	changed_player.emit()
	positions["3_1"] = player_updater()
	
	game_running()


func _on__3_changing_player_2_3():
	changed_player.emit()
	positions["2_3"] = player_updater()
	
	game_running()


func _on__2_changing_player_2_2():
	changed_player.emit()
	positions["2_2"] = player_updater()
	
	game_running()


func _on__1_changing_player_2_1():
	changed_player.emit()
	positions["2_1"] = player_updater()
	
	game_running()


func _on__3_changing_player_1_3():
	changed_player.emit()
	positions["1_3"] = player_updater()
	
	game_running()


func _on__2_changing_player_1_2():
	changed_player.emit()
	positions["1_2"] = player_updater()
	
	game_running()


func _on__1_changing_player_1_1():
	changed_player.emit()
	positions["1_1"] = player_updater()
	
	game_running()
	

