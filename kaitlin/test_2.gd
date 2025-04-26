extends Node2D

var decision_made = false

func _process(delta):
	var stamp = $stamp
	var left_paper = $left_paper
	var right_paper = $right_paper
	if left_paper.was_clicked:
		left_paper.was_clicked = false
		var events : Array = []
		var text_event = DialogicTextEvent.new()
		text_event.text = "Plan to askdlfjaslkdfjlaskdf"
		events.append(text_event)
		var timeline : DialogicTimeline = DialogicTimeline.new()
		timeline.events = events
		# if your events are already resources, you need to add this:
		timeline.events_processed = true
		Dialogic.start(timeline)
		
	if stamp.has_been_dropped and not decision_made:
		decision_made = true
		if stamp.body_ref == left_paper:
			var events : Array = []
			var text_event = DialogicTextEvent.new()
			text_event.text = "you chose the left paper wowowwo"
			events.append(text_event)
			var timeline : DialogicTimeline = DialogicTimeline.new()
			timeline.events = events
			# if your events are already resources, you need to add this:
			timeline.events_processed = true
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			Dialogic.start(timeline)
			
func _on_timeline_ended():
	get_tree().change_scene_to_file('res://kaitlin/yarn_scene.tscn')
