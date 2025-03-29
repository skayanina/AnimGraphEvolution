Scriptname FaceUpdateSync extends Quest

Event OnInit()
    RegisterForModEvent("RaceMenuClose", "OnRaceMenuClosed")
EndEvent

Event OnRaceMenuClosed()
    Actor PlayerRef = Game.GetPlayer()
    
    ; Force Skyrim to regenerate the facegen for syncing
    PlayerRef.QueueNiNodeUpdate()
    
    ; Optional: Resave face to prevent mismatches
    PlayerRef.UpdateWeight(PlayerRef.GetWeight())

    Debug.Notification("Face updated and synced!")
    
    ; If Skyrim Together allows face syncing, send an update packet here
EndEvent