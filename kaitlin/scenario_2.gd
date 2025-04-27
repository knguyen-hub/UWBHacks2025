extends Node2D

var decision_made = false

func _ready():
	var sprawler = $sprawler/AnimatedSprite2D
	sprawler.play("2 hearts")
	dialogue1("The city’s annual traffic report has come in and reports increased traffic accidents, traffic levels, and pedestrian deaths. Propose a solution that would be best to solve the problem.")

func _process(delta):
	var stamp = $stamp
	var paper1 = $paper1
	var paper2 = $paper2
	var paper3 = $paper3
	var paper4 = $paper4
	if not stamp.draggable:
		
		if paper1.was_clicked:
			paper1.was_clicked = false
			dialogue1("Propose legislation to widen the lanes of our most used streets")
			
		elif paper2.was_clicked:
			paper2.was_clicked = false
			dialogue1("Propose legislation to add more lanes to our most used streets")
			
		elif paper3.was_clicked:
			paper3.was_clicked = false
			dialogue1("Propose legislation to invest more in public transportation, dedicating a workforce to identify what sectors of public transport are needed the most")
		
		elif paper4.was_clicked:
			paper4.was_clicked = false
			dialogue1("Introduce legislation to eliminate bike lanes and sidewalks on our most used streets so there are no more pedestrians near the street")
		
	# when the stamp has been dropped
	if stamp.has_been_dropped and not decision_made:
		decision_made = true
		if stamp.body_ref == paper3:
			dialogue1("Good choice Mrs Mayor! Personal cars have a much higher accident rate than public transportation. Investing in public transportation creates safer roads, less traffic, and better air quality.")
			var sprawler = $sprawler/AnimatedSprite2D
			var sprawler_real = $sprawler
			sprawler_real.flash()
			await get_tree().create_timer(2.0).timeout
			sprawler.play("1 heart")
		else:
			dialogue1("That is a choice for sure!")
		
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
