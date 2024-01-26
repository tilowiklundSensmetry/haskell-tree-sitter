{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Main (main) where

import           TreeSitter.Unsafe.Parser
import           TreeSitter.Unsafe.Tree
import           TreeSitter.Haskell
import           TreeSitter.Unsafe.Node

import Data.Foldable
import Control.Monad

main :: IO ()
main = do
  parser <- parserNew
  _ <- setLanguage parser haskell

  let source = "module Test (main) where\nimport Lib\nf1 = undefined\nf2 = undefined"
  Just tree <- parseString parser Nothing source

  root <- rootNode tree

  let dumpLayout prefix node = do
                                  str <- string node
                                  putStrLn $ prefix ++ str
                                  child <- firstChild node
                                  for_ child (dumpLayout (prefix ++ "  ")) 
                                  sibling <- nextSibling node
                                  for_ sibling (dumpLayout prefix)

  dumpLayout "" root

  putStrLn "......"

  let dumpLayoutC prefix cursor = do
                                  node <- cursorCurrentNode cursor
                                  str <- string node
                                  putStrLn $ prefix ++ str
                                  hasChild <- cursorGotoFirstChild cursor
                                  when hasChild $ do
                                    dumpLayoutC (prefix ++ "  ") cursor
                                  hasSibling <- cursorGotoNextSibling cursor
                                  if hasSibling
                                  then dumpLayoutC prefix cursor
                                  else cursorGotoParent cursor >> return ()

  rootCursor <- cursorNew =<< rootNode tree
  dumpLayoutC "" rootCursor

-- 
--   children <- mallocArray childCount
--   tsNode   <- malloc
--   poke tsNode nodeTSNode
--   ts_node_copy_child_nodes tsNode children
-- 
--   printChildren children childCount
-- 
-- printChildren :: Ptr Node -> Int -> IO ()
-- printChildren children count = forM_
--   [0 .. count - 1]
--   (\n -> do
--     child <- peekElemOff children n
--     printNode child
--   )
-- 
-- printNode :: Node -> IO ()
-- printNode n@(Node {..}) = do
--   theType <- peekCString nodeType
--   let TSPoint {..} = nodeStartPoint n
--       start        = "(" ++ show pointRow ++ "," ++ show pointColumn ++ ")"
--   let TSPoint {..} = nodeEndPoint
--       end          = "(" ++ show pointRow ++ "," ++ show pointColumn ++ ")"
--   print $ theType ++ start ++ "-" ++ end
  return ()