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
fieldCount language = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_field_count languagePtr) language

symbolCount :: Language -> IO Word32
symbolCount language = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_symbol_count languagePtr) language

version :: Language -> IO Word32
version language = 
    liftUnaryLanguageFunction (\languagePtr -> ts_language_version languagePtr) language

fieldIdForNamePr :: Language -> String -> Word32 -> IO FieldId
fieldIdForNamePr language str x = do
    withCString str $ \cstr ->  
        liftUnaryLanguageFunction (\languagePtr -> FieldId <$> ts_language_field_id_for_name languagePtr cstr x) language

symbolForNamePr :: Language -> String -> Word32 -> Bool -> IO Symbol
symbolForNamePr language str x y = do
    withCString str $ \cstr ->  
        liftUnaryLanguageFunction (\languagePtr -> Symbol <$> ts_language_symbol_for_name languagePtr cstr x y) language

symbolName :: Language -> Symbol -> IO String
symbolName language (Symbol sym) = do
    flip liftUnaryLanguageFunction language $ \languagePtr -> do
        cstr <- ts_language_symbol_name languagePtr sym
        str <- peekCString cstr
        ts_free cstr
        return str

symbolForName :: Language -> String -> Word32 -> Bool -> IO Symbol
symbolForName language str x y = do
    withCString str $ \cstr -> 
        liftUnaryLanguageFunction (\languagePtr -> Symbol <$> ts_language_symbol_for_name languagePtr cstr x y) language

symbolType :: Language -> Symbol -> IO SymbolType
symbolType language (Symbol sym) = 
    liftUnaryLanguageFunction (\languagePtr -> SymbolType <$> ts_language_symbol_type languagePtr sym) language
