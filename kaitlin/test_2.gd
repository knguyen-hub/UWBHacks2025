extends Node2D

var decision_made = false

func _ready():
	await get_tree().create_timer(2.0).timeout
	var sprawler = $sprawler/AnimatedSprite2D
	sprawler.play("3 hearts")
	dialogue1("Your city is burdened by the current housing crisis, and a rise in remote work has left many buildings vacant downtown. Choose a solution that best addresses the problem using smart growth")

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
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		if stamp.body_ref == paper1:
			dialogue1("Good choice Mrs Mayor! This decision helps solve the problem of a lack of affordable housing and solves the problem of the empty office buildings not being used")
			var sprawler = $sprawler/AnimatedSprite2D
			var sprawler_real = $sprawler
			sprawler_real.flash()
			await get_tree().create_timer(2.0).timeout
			sprawler.play("2 hearts")
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
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file('res://kaitlin/scenario_2.tscn')
