" Language: Slang: Making it easier to work with shaders 
" Author: Omar Huseynov <huseynov_omar@pm.me>
" Maintainer: Omar Huseynov <huseynov_omar@pm.me>

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax") && b:current_syntax == "slang"
  finish
endif

" Preprocessor
syn region slangPreCondit start="^\s*#\s*\(if\|ifdef\|ifndef\|else\|elif\|endif\)" skip="\\$" end="$" keepend
syn region slangDefine start="^\s*#\s*\(define\|undef\)" skip="\\$" end="$" keepend
syn keyword slangTokenConcat ##
syn region slangPreProc start="^\s*#\s*\(error\|pragma\|extension\|version\|line\)" skip="\\$" end="$" keepend

" Integer Numbers
syn match slangDecimalInt display "\<\(0\|[1-9]\d*\)[uU]\?"
syn match slangOctalInt display "\<0\o\+[uU]\?"
syn match slangHexInt display "\<0[xX]\x\+[uU]\?"

" Float Numbers
syn match slangFloat display "\<\d\+\.\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="
syn match slangFloat display "\<\.\d\+\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="
syn match slangFloat display "\<\d\+[eE][+-]\=\d\+\(lf\|LF\|f\|F\)\="
syn match slangFloat display "\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="

" Swizzles
syn match slangSwizzle display /\.[xyzw]\{1,4\}\>/
syn match slangSwizzle display /\.[rgba]\{1,4\}\>/

" Structure
syn keyword slangStructure struct nextgroup=slangIdentifier skipwhite skipempty
syn match slangIdentifier contains=slangIdentifierPrime "\%([a-zA-Z_]\)\%([a-zA-Z0-9_]\)*" display contained

" Integers
syn keyword slangScalarIntegerTypes int8_t int16_t int int64_t uint8_t uint16_t uint uint64_t

" Floats
syn keyword slangScalarFloatTypes half float double

" Bools
syn keyword slangScalarBooleanTypes bool

" Boolean Constants
syn keyword slangScalarBooleanConstants true false

" Void
syn keyword slangScalarVoidType void

" Vectors
syn keyword slangVectorPredefinedTypes vector half2 half3 half4 float2 float3 float4 double2 double3 double4 uint2 uint3 uint4 int2 int3 int4

" Matrices
syn keyword slangMatrixPredefinedTypes matrix half2x2 half2x3 half2x4 half3x2 half3x3 half3x4 half4x2 half4x3 half4x4 float2x2 float2x3 float2x4 float3x2 float3x3 float3x4 float4x2 float4x3 float4x4 double2x2 double2x3 double2x4 double3x2 double3x3 double3x4 double4x2 double4x3 double4x4 uint2x2 uint2x3 uint2x4 uint3x2 uint3x3 uint3x4 uint4x2 uint4x3 uint4x4 int2x2 int2x3 int2x4 int3x2 int3x3 int3x4 int4x2 int4x3 int4x4

" Compound Types
syn keyword slangCompoundTypes struct enum class cbuffer uniform

" Optional Types
syn keyword slangOptionalType Optional

" Texture Types
syn keyword slangTextureTypes Texture1D RWTexture1D RasterizerOrderedTexture1D Texture1DMS RWTexture1DMS RasterizerOrderedTexture1DMS Texture1DArray RWTexture1DArray RasterizerOrderedTexture1DArray Texture1DMSArray RWTexture1DMSArray RasterizerOrderedTexture1DMSArray Texture2D RWTexture2D RasterizerOrderedTexture2D Texture2DMS RWTexture2DMS RasterizerOrderedTexture2DMS Texture2DArray RWTexture2DArray RasterizerOrderedTexture2DArray Texture2DMSArray RWTexture2DMSArray RasterizerOrderedTexture2DMSArray Texture3D RWTexture3D RasterizerOrderedTexture3D Texture3DMS RWTexture3DMS RasterizerOrderedTexture3DMS Texture3DArray RWTexture3DArray RasterizerOrderedTexture3DArray Texture3DMSArray RWTexture3DMSArray RasterizerOrderedTexture3DMSArray TextureCube RWTextureCube RasterizerOrderedTextureCube TextureCubeMS RWTextureCubeMS RasterizerOrderedTextureCubeMS TextureCubeArray RWTextureCubeArray RasterizerOrderedTextureCubeArray TextureCubeMSArray RWTextureCubeMSArray RasterizerOrderedTextureCubeMSArray

" Samples Types
syn keyword slangSamplerTypes SamplerState SamplerComparisonState

" Formatted Buffer Types
syn keyword slangFormattedBufferTypes Buffer RWBuffer RasterizerOrderedBuffer BufferArray RWBufferArray RasterizerOrderedBufferArray

" Flat Buffer Types
syn keyword slangFlatBufferTypes StructuredBuffer RWStructuredBuffer RasterizerOrderedStructuredBuffer ByteAddressBuffer RWByteAddressBuffer RasterizerOrderedByteAddressBuffer

" Constant Buffer Types
syn keyword slangConstantBufferTypes ConstantBuffer

" Statements
syn keyword slangConditional if else switch case default
syn keyword slangRepeat for do while
syn keyword slangStatement break return continue discard reinterpret

" Operators
syn keyword slangOperators operator is as

" Qualifiers
syn keyword slangQualifiers in out inout numthreads

" Attributes
syn keyword slangAttributes unroll shader mutating sealed open ForceInline

" Scoped Blocks
syn keyword slangScopedBlocks __ignored_block __transparent_block __file_decl

" Target Switch
syn keyword slangTargetSwitch __target_switch

" Capabilities
syn keyword slangCapabilities spirv hlsl glsl

" Properties
syn keyword slangProperties get set property extension

" This Keyword
syn keyword slangThisKeyword This

" Initializers
syn keyword slangInitializers __init

" Subscript Operator
syn keyword slangSubscriptOperators __subscript

" Interfaces
syn keyword slangInterfaces interface

" Typedef
syn keyword slangTypedef typedef

" Associated Types
syn keyword slangAssociatedTypes associatedtype

" Comments
syn keyword slangTodo contained TODO FIXME XXX NOTE
syn region slangCommentL start="//" skip="\\$" end="$" keepend contains=slangTodo,@Spell
syn region slangComment matchgroup=slangCommentStart start="/\*" end="\*/" extend contains=slangTodo,@Spell

" Strings
syn region slangString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend

" Vars and params
syn keyword slangVarsAndParams static const let var none

" Bindings
syn keyword slangBindings SV_VertexID SV_Position SV_DispatchThreadID

" Namespaces & Modules
syn keyword slangNamespacesAndModules namespace using module __include implementing import

" Access Control
syn keyword slangAccessControl public internal private

" Default highlighting
hi def link slangScalarIntegerTypes Type
hi def link slangScalarFloatTypes Type
hi def link slangScalarBooleanTypes Type
hi def link slangScalarVoidType Type
hi def link slangVectorPredefinedTypes Type
hi def link slangMatrixPredefinedTypes Type
hi def link slangCompoundTypes Type
hi def link slangTextureTypes Type
hi def link slangSamplerTypes Type
hi def link slangFormattedBufferTypes Type
hi def link slangFlatBufferTypes Type
hi def link slangConstantBufferTypes Type
hi def link slangOptionalType Type
hi def link slangThisKeyword Type
hi def link slangInterfaces Type
hi def link slangTypedef Type

hi def link slangScalarBooleanConstants Constant
hi def link slangCapabilities Constant

hi def link slangStatement Statement
hi def link slangOperators Statement
hi def link slangConditional Conditional
hi def link slangRepeat Repeat

hi def link slangTodo Todo
hi def link slangComment Comment
hi def link slangCommentL Comment
hi def link slangCommentStart Comment

hi def link slangPreCondit PreCondit
hi def link slangDefine Define
hi def link slangPreProc PreProc
hi def link slangTokenConcat PreProc

hi def link slangDecimalInt Number
hi def link slangOctalInt Number
hi def link slangHexInt Number
hi def link slangFloat Float

hi def link slangStructure Structure

hi def link slangIdentifier Identifier
hi def link slangIdentifierPrime Identifier
hi def link slangSwizzle Identifier

hi def link slangQualifiers StorageClass
hi def link slangAttributes StorageClass
hi def link slangVarsAndParams StorageClass
hi def link slangBindings StorageClass
hi def link slangNamespacesAndModules StorageClass
hi def link slangProperties StorageClass
hi def link slangInitializers StorageClass
hi def link slangSubscriptOperators StorageClass
hi def link slangAccessControl StorageClass
hi def link slangTargetSwitch StorageClass
hi def link slangAssociatedTypes StorageClass

hi def link slangString String

if !exists("b:current_syntax")
  let b:current_syntax = "slang"
endif
