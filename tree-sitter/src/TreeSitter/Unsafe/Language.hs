module TreeSitter.Unsafe.Language (
  Language
, fieldCount
, symbolCount
, version
, fieldIdForNamePr
, symbolForNamePr
, symbolName
, symbolForName
, symbolType
) where

import Foreign
import Foreign.C
import TreeSitter.Internal.Types
import TreeSitter.Raw.Types
import TreeSitter.Raw.Allocation
import TreeSitter.Raw.Language

liftUnaryLanguageFunction :: (Ptr TSLanguage -> IO a) -> Language -> IO a
liftUnaryLanguageFunction f (Language languagePtr) = f languagePtr

-- Plain

fieldCount :: Language -> IO Word32
fieldCount = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_field_count languagePtr)

symbolCount :: Language -> IO Word32
symbolCount = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_symbol_count languagePtr)

version :: Language -> IO Word32
version = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_version languagePtr)

fieldIdForNamePr :: String -> Word32 -> Language -> IO Field
fieldIdForNamePr str x language = do
    withCString str $ \cstr ->  
        liftUnaryLanguageFunction (\languagePtr -> FieldId <$> ts_language_field_id_for_name languagePtr cstr x) language

symbolForNamePr :: String -> Word32 -> Bool -> Language -> IO Symbol
symbolForNamePr str x y language = do
    withCString str $ \cstr ->  
        liftUnaryLanguageFunction (\languagePtr -> Symbol <$> ts_language_symbol_for_name languagePtr cstr x y) language

symbolName :: Symbol -> Language -> IO String
symbolName (Symbol sym) language = do
    flip liftUnaryLanguageFunction language $ \languagePtr -> do
        cstr <- ts_language_symbol_name languagePtr sym
        str <- peekCString cstr
        ts_free cstr
        return str

symbolForName :: String -> Word32 -> Bool -> Language -> IO Symbol
symbolForName str x y language = do
    withCString str $ \cstr -> 
        liftUnaryLanguageFunction (\languagePtr -> Symbol <$> ts_language_symbol_for_name languagePtr cstr x y) language

symbolType :: Symbol -> Language -> IO SymbolType
symbolType (Symbol sym) = 
    liftUnaryLanguageFunction (\languagePtr -> SymbolType <$> ts_language_symbol_type languagePtr sym)
