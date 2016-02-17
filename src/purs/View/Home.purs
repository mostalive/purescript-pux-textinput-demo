module View.Home where

import Prelude hiding (div)
import Pux
import Pux.DOM.HTML.Elements (div, input, label, p, text)
import Pux.DOM.HTML.Attributes (htmlFor, id_ , onChange, send, type_, value)

import State


home :: State -> VirtualDOM
home state = div $ do
  let fieldId = "editme"
  label ! htmlFor fieldId $ text "Edit me"
  input ! (type_ "text") ! (id_ fieldId) ! (value state.text) ! onChange (send Changed)
  p $ text ("Text is now: " ++ show state.text)
