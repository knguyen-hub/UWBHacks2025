extends Node2D

var decision_made = false

func _ready():
	$paper3.flip_horiz()
	$paper4.flip_horiz()
	dialogue1("Your city is plagued by the current housing crisis, and a rise in remote work in local companies have left many vacant office buildings in the city. Choose a solution that best addresses the problem while abiding by smart growth principles")

func _process(delta):
	var stamp = $stamp
	var paper1 = $paper1
	var paper2 = $paper2
	var paper3 = $paper3
	var paper4 = $paper4
	if not stamp.draggable:
		
		if paper1.was_clicked:
			paper1.was_clicked = false
			dialogue1("Propose legislation to convert office buildings into residential buildings")
			
		elif paper2.was_clicked:
			paper2.was_clicked = false
			dialogue1("Propose legislation to transform the office buildings into parking garages")
			
		elif paper3.was_clicked:
			paper3.was_clicked = false
			dialogue1("Demolish the office buildings to build public parks")
		
		elif paper4.was_clicked:
			paper4.was_clicked = false
			dialogue1("Write a Tweet dissuading people from doing remote work")
		
	# when the stamp has been dropped
	if stamp.has_been_dropped and not decision_made:
		decision_made = true
		if stamp.body_ref == paper1:
			dialogue1("Good choice Mrs Mayor! This decision helps solve the problem of a lack of affordable housing and solves the problem of the empty office buildings not being used")
		else:
			dialogue1("Ah yes")
		
		await get_tree().create_timer(2.0).timeout
		stamp.global_position = Vector2(1075, 307)
			
func dialogue1(text_: String):
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = text_
	events.append(text_event)
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	timeline.events_processed = true
	Dialogic.start(timeline)

func _on_timeline_ended():
	get_tree().change_scene_to_file('res://kaitlin/yarn_scene.tscn')
