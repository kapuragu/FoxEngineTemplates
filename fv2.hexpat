/********************************
 * FV2 (.fv2) Template
 * By: BobDoleOwndU
 ********************************/
//Structs
struct BoneModelAttachEntry {
	s16 fmdlIndex;
	s16 frdvIndex;
	s16 unkIndex0;
	s16 unkIndex1;
	s16 simIndex;
	s16 unkIndex2;
};

struct CnpModelAttachEntry {
	u32 cnpStrCode32;
	u32 emptyStrCode32;
	s16 fmdlIndex;
	s16 frdvIndex;
	s16 unkIndex0;
	s16 unkIndex1;
	s16 simIndex;
	s16 unkIndex2;
};

struct VariableDataSubEntry {
	u32 meshGroupEntries[parent.meshGroupCount];
	u32 textureSwapMaterialInstanceStrCode32s[parent.textureSwapCount];
	u32 textureSwapTextureTypeStrCode32s[parent.textureSwapCount];
	s16 textureSwapTextureIndices[parent.textureSwapCount];
	s16 textureSwapMaterialParameterIndices[parent.textureSwapCount];
	BoneModelAttachEntry boneModelAttachEntries[parent.boneModelAttachmentCount];
	CnpModelAttachEntry cnpModelAttachEntries[parent.cnpModelAttachmentCount];
};

struct VariableDataEntry {
	u8 typeEnum;
	u8 unknown0;
	u8 subEntryCount;
	u8 meshGroupCount;
	u8 textureSwapCount;
	u8 unknown1;
	u8 boneModelAttachmentCount;
	u8 cnpModelAttachmentCount;
	padding[4];
	u32 offset;
	
	VariableDataSubEntry variableDataSubEntries[subEntryCount] @offset;
};

struct Vector4 {
	float x;
	float y;
	float z;
	float w;
};

struct FV2 {
	char signature[8];
	u16 variableDataSectionOffset;
	u16 externalFileSectionOffset;
	u16 variableDataSectionCount;
	u16 externalFileSectionCount;
	u32 materialParameterSectionOffset;
	u32 materialParameterSectionCount;
	u16 textureCount;
	padding[6];
	u8 hideMeshGroupCount;
	u8 showMeshGroupCount;
	u8 textureSwapCount;
	u8 unk0;
	u8 boneModelAttachmentCount;
	u8 cnpModelAttachmentCount;
	padding[2];

	//Static Data
	u32 hideMeshGroupEntries[hideMeshGroupCount];
	u32 showMeshGroupEntries[showMeshGroupCount];
	u32 textureSwapMaterialInstanceStrCode32s[textureSwapCount];
	u32 textureSwapTextureTypeStrCode32s[textureSwapCount];
	s16 textureSwapTextureIndices[textureSwapCount];
	s16 textureSwapMaterialParameterIndices[textureSwapCount];
	BoneModelAttachEntry boneModelAttachEntries[boneModelAttachmentCount];
	CnpModelAttachEntry cnpModelAttachEntries[cnpModelAttachmentCount];
	
	//Variable Data
	$ = variableDataSectionOffset;
	VariableDataEntry variableDataEntries[variableDataSectionCount];
	
	//Material Parameter Data
	$ = materialParameterSectionOffset;
	Vector4 materialParameterEntries[materialParameterSectionCount];
	
	//External File Data
	$ = externalFileSectionOffset;
	u64 externalFileEntries[externalFileSectionCount];
};

FV2 fv2 @0x0;
