extends Node

###
#Exemple de comment déclarer des signaux
#signal new_ressources_per_sec_value(type, value)
#signal refresh_per_tick(type)
#signal new_food_needed_per_tick(value)
#signal new_monster()
#signal monster_death()

#Comment se mettre à écouter un signal (nom du signal, truc à connecter, la fonction à utiliser)
#Events.connect("use_bones", self, "on_use_bones") 

#Comment envoyer un signal (nom du signal, attribut1, attribut2, ...)
#Events.emit_signal("new_food_needed_per_tick", food_needed_per_tick)
###

# warning-ignore:unused_signal
signal change_background_fin_premier(name)

# warning-ignore:unused_signal
signal new_checkpoint(pos)

# warning-ignore:unused_signal
signal player_death()

# warning-ignore:unused_signal
signal end_of_level_reached()

# warning-ignore:unused_signal
signal player_enter_orbit(planet_pos)
# warning-ignore:unused_signal
signal player_leave_orbit()

signal reset()

signal next_level()

signal fin_niveau()
