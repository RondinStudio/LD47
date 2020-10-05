extends Control

var text_to_show = []
var number_of_pages
var current_page = 0
onready var tie = $TextInterfaceEngine

signal end_reached

# Called when the node enters the scene tree for the first time.
func _ready():
		# Connect every signal to check them using the "print()" method
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	
func init(text_param: Array):
	tie.reset()
	text_to_show = text_param
	number_of_pages = text_to_show.size()
	current_page = 0
	print_page()
	
func print_page():
	tie.buff_text(text_to_show[current_page], 0.02)
	tie.set_state(tie.STATE_OUTPUT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ButtonNext_pressed():
	if current_page < number_of_pages - 1:
		current_page += 1
		tie.reset()
		print_page()
	else:
		tie.reset()
		emit_signal("end_reached")

func _on_input_enter(s):
	print("Input Enter ",s)
	
#	tie.add_newline()
#	tie.buff_text("Oooh, so your name is " + s + "? What a beautiful name!", 0.01)
	pass

func _on_buff_end():
	print("Buff End")
	pass

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ",s)
	pass
