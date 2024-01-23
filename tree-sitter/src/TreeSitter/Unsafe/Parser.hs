module TreeSitter.Unsafe.Parser (parserNew, parseString, setLanguage) where

import TreeSitter.Internal.Parser
import TreeSitter.Raw.Parser

import TreeSitter.Internal.Tree
import TreeSitter.Raw.Tree

import TreeSitter.Internal.Language

import Foreign
import Foreign.C.String
--import Foreign.ForeignPtr

parserNew :: IO Parser
parserNew = do
    parserPtr <- ts_parser_new
    parserForeignPtr <- newForeignPtr p_ts_parser_delete parserPtr
    return $ Parser parserForeignPtr

-- Write more efficient version!
parseString :: Parser -> Maybe Tree -> String -> IO (Maybe Tree)
parseString (Parser parserForeignPtr) maybePreviousTree source =
    withForeignPtr parserForeignPtr $ \parserPtr -> do
        (str, len) <- newCStringLen source
        treePtr <- case maybePreviousTree of
            Nothing -> ts_parser_parse_string parserPtr nullPtr str len
            Just (Tree previousTreeForeignPtr) -> withForeignPtr previousTreeForeignPtr $ \previousTreePtr ->  
                ts_parser_parse_string parserPtr previousTreePtr str len
        treeForeignPtr <- newForeignPtr p_ts_tree_delete treePtr
        return $ if treePtr == nullPtr then Nothing else Just (Tree treeForeignPtr)

setLanguage :: Parser -> Language -> IO Bool
setLanguage (Parser parserForeignPtr) (Language languagePtr) =
    withForeignPtr parserForeignPtr $ \parserPtr ->
        ts_parser_set_language parserPtr languagePtr
