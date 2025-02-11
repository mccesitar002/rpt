#pragma once


class CWarehouseHandler
{
public:
	CWarehouseHandler();
	virtual ~CWarehouseHandler();

	CWarehouseBase			* Open( const std::string strFile, BOOL bReadFile = TRUE );

	BOOL					HaveFile( CWarehouseBase * pcWarehouse ) { return pcWarehouse->bHaveFile; }

	bool					Receive( CWarehouseBase * pcWarehouse, PacketWarehouse * psPacket );
	BOOL					Send( User * pcUser, CWarehouseBase * pcWarehouse );

	BOOL					Encrypt( CWarehouseBase * pcWarehouse );
	BOOL					Decrypt( CWarehouseBase * pcWarehouse );

	BOOL					Save( CWarehouseBase * pcWarehouse );

	void					Close( CWarehouseBase * pcWarehouse );

	void					HandlePacket( User * pcUser, PacketWarehouseOpen * psPacket );
	void					HandlePacket( User * pcUser, PacketWarehouse * psPacket );

	DWORD					GetChecksum( WarehouseData * psData, UINT uSize );

	bool					DoImport();

private:

	CWarehouseBase			* OpenSQL( const std::string strCharacterName, BOOL bRead );
	bool					  SaveSQL( const std::string strCharacterName, CWarehouseBase * pcWarehouse );

	std::vector<PacketWarehouse*> GetEncryptedBuffer( CWarehouseBase * pcWarehouse );

	void					SQLGoldLog( User * pcUser, int iGold, BOOL bOpenWarehouse );
	void					SQLItemLog( User * pcUser, int iItemID, int iChk1, int iChk2, BOOL bGotItem );

	void					AddWarehouseInventoryItems( User * pcUser, CWarehouseBase * pcWarehouse );

	BOOL					CheckWarehouseInventoryItems( User * pcUser, CWarehouseBase * pcWarehouse );

	void					MakeBackup( User * pcUser );

	BOOL					AddItemWarehouse( User * pcUser, int iItemID, int iChk1, int iChk2 );
	BOOL					DelItemWarehouse( User * pcUser, int iItemID, int iChk1, int iChk2 );
	int						GetItemWarehouseIndex( User * pcUser, int iItemID, int iChk1, int iChk2 );
	void					ClearWarehouseInventory( User * pcUser );

	bool 					SQLWarehouseGoldExists( int iAccountID );
	void					SQLSetWarehouseData( int iAccountID, int iGold, int iItemCount );
	bool					SQLGetWarehouseData( int iAccountID, int & iGold, int & iItemCount );
};

