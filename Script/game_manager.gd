extends Node

enum PNUM
{
	P1,
	P2,
	NPC
}

#プレイヤーが何か識別する
var player_identification : Array[PNUM] = [PNUM.P1, PNUM.P2]

func vs_npc():
	player_identification[1] = PNUM.NPC
func vs_p2():
	player_identification[1] = PNUM.P2
