#pragma once

#define CLAN_ID_GAME				(*(int*)0x03B17BF0)

#define CLAN_BELLATRA_CROWN			(*(int*)0x03B18BC8)

class BellatraGame
{
protected:
	const DWORD dwSodCrownGold					= 0x096A0001;
	const DWORD dwSodCrownSilver				= 0x096A0002;
	const DWORD dwSodCrownBronze				= 0x096A0003;

	DWORD										dwTextureCrownTimerGold = 0;
	DWORD										dwTextureCrownTimerSilver = 0;
	DWORD										dwTextureCrownTimerBronze = 0;
	BOOL										bKilledTimers = FALSE;
public:
	BellatraGame();
	virtual ~BellatraGame();

	void										SetCrown();
};

