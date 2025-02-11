#pragma once

#include "CLoginScreen.h"
#include "CCharacterScreen.h"
#include "CWorldScreen.h"
#include "TestScreen.h"


class CGameScreen
{
public:
	CGameScreen();
	virtual ~CGameScreen();


	void					Init();
	void					Shutdown();

	void					Frame();
	void					Update( float fTime );

	void					Render3D();
	void					Render2D();

	void					OnMouseMove( class CMouse * pcMouse );

	BOOL					OnKeyPress( class CKeyboard * pcKeyboard );
	BOOL					OnMouseClick( class CMouse * pcMouse );
	BOOL					OnMouseScroll( class CMouse * pcMouse );
	BOOL					OnKeyChar( class CKeyboard * pcKeyboard );

	void					OnResolutionChanged();

	void					ChangeScreen( EScreen iNewScreen );
	void					SetScreen( EScreen iNewScreen );

	EScreen					GetActiveScreenType() { return iActiveScreen; }
	CScreen					* GetActiveScreen() { return pcActiveScreen; }

private:

	const float				SCREEN_TIME_TO_CHANGE = 2000.0f;

	BOOL					bActiveScreen;
	EScreen					iActiveScreen;
	CScreen					* pcActiveScreen;

	EScreen					iNewScreen;
	float					fScreenChangeTimeUp;
	float					fScreenChangeTimeDown;

	DX::Texture_ptr			pMiscTexture = nullptr;
};

