Scriptname SyncAnimations extends Quest

; Register animation event listener
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if akSource == Game.GetPlayer()
        SyncAnimation(asEventName)
    endif
EndEvent

Function SyncAnimation(string animEvent)
    ; Send animation event over Skyrim Together's networking system
    Debug.Notification("Syncing animation: " + animEvent)

    ; Example: Force animation on other players
    Actor targetPlayer = GetOtherPlayer()
    if targetPlayer
        targetPlayer.PlayIdle(animEvent)
    endif
EndFunction

Function RegisterEvents()
    Game.GetPlayer().RegisterForAnimationEvent(Game.GetPlayer(), "")
EndFunction
