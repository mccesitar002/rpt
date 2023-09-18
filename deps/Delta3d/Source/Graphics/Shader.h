#pragma once

#include "Graphics.h"
#include "Texture.h"

namespace Delta3D::Graphics
{

struct ShaderDefine
{
	const char* name;
	const char* value;

	bool operator==( const ShaderDefine& other ) const
	{
		if( name && other.name && value && other.value )
			return _strcmpi( name, other.name ) == 0 && _strcmpi( value, other.value ) == 0;
		else if( ( name && !other.name ) || ( value && !other.value ) )
			return false;
		else if( ( !name && other.name ) || ( !value && other.value ) )
			return false;
		
		return true;
	}
};

class Shader : public std::enable_shared_from_this<Shader>
{
friend class ShaderFactory;
public:
	//! Default constructor for Effect.
	Shader( ID3DXEffect* effect_, const std::string& filePath_ );

	//! Deconstructor.
	~Shader();

	//! Device has been lost.
	void OnLostDevice();

	//! Device must be reseted.
	void OnResetDevice();

	//! Set Effect Technique.
	bool SetTechnique( const std::string& techniqueName );

	//! Begin Effect.
	int Begin();

	//! Set Data Value.
	void SetData( const std::string& variable, const char* data, unsigned int size );

	//! Set Matrix Value.
	void SetMatrix( const std::string& variable, const D3DXMATRIX& matrix );

	//! Set Matrix Array Value.
	void SetMatrixArray( const std::string& variable, const D3DXMATRIX* matrix, unsigned int count );

	//! Set Integer Value.
	void SetInt( const std::string& variable, int value );

	//! Set Integer Array Value.
	void SetIntArray( const std::string& variable, const int* value, unsigned int count );

	//! Set Float Value.
	void SetFloat( const std::string& variable, float value );

	//! Set Float Array Value.
	void SetFloatArray( const std::string& variable, const float* value, unsigned int count );

	//! Set Boolean Value.
	void SetBool( const std::string& variable, BOOL value );

	//! Set Boolean Array Value.
	void SetBoolArray( const std::string& variable, const BOOL* value, unsigned int count );

	//! Set Texture Sampler.
	void SetTexture( const std::string& variable, std::shared_ptr<Texture> texture );

	//! Set Texture Sampler.
	void SetTexture( const std::string& variable, IDirect3DTexture9* texture );

	//! Begin Effect Pass.
	bool BeginPass( unsigned int pass );

	//! Commit Changes.
	void CommitChanges();

	//! End Pass.
	void EndPass();

	//! End Effect.
	void End();

	//! Set a new Effect Object.
	void Renew( ID3DXEffect* effect_ );

	//! Get Effect Object.
	ID3DXEffect* Get() { return effect; }

	//! Get Num Passes of Effect.
	unsigned int NumPasses() const { return numPasses; }

	//! Get File Path.
	const std::string& FilePath() const { return filePath; }

	//! Get Effect Defines.
	std::vector<ShaderDefine> Defines() const { return effectDefines; }
private:
	ID3DXEffect* effect;	//!< Effect Object
	std::string filePath;	//!< Effect File Path
	unsigned int numPasses;	//!< Number of Passes on Effect

	std::vector<ShaderDefine> effectDefines;	//!< Effect Defines
};

class ShaderFactory
{
public:
	//! Default Constructor for Effect Factory.
	ShaderFactory( Graphics* graphics_ );

	//! Device has been lost.
	void OnLostDevice();

	//! Device must be reseted.
	void OnResetDevice();

	//! Reload All Effects.
	void Reload();

	//! Create Effect.
	std::shared_ptr<Shader> Create( const std::string& filePath, std::vector<ShaderDefine> defines = {} );
private:
	ID3DXEffect* CreateShader( const std::string& filePath, std::vector<ShaderDefine> defines );
private:
	std::vector<std::shared_ptr<Shader>> cache;	//!< Cache of Effect's

	Graphics* graphics;	//!< Graphics Pointer
};

}