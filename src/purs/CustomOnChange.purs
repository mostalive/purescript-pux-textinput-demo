module Pux.CustomOnChange where

import Data.List (List(Nil), singleton)
import DOM (DOM())
import Prelude (($), map)
import Pux.DOM (Attrs, Handler(Handler))
import Pux.React (makeAttr, makeAttrWithObj, makeHandler, stopPropagationFF, preventDefaultFF)
import Pux.React.Types (Event)
import Signal.Channel (CHANNEL())


type Target = { value :: String }

type ChangeEvent =
  {
    target :: Target
  }
onChange :: forall action eff. Handler ChangeEvent (ChangeEvent -> action) (dom :: DOM, channel :: CHANNEL | eff) -> Attrs
onChange (Handler actions fx) = makeHandler "onChange" fx $ \ev -> map (\a -> a ev) actions
