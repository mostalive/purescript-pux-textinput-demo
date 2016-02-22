module State where

import Control.Monad.Eff.Console (CONSOLE(), log)
import Prelude
import Pux
import Pux.CustomOnChange (ChangeEvent)
import Debug.Trace (spy)

data Route = Home | NotFound

data Action = Changed ChangeEvent | PageView Route

type State =
  { route :: Route
  , text :: String }

initialState :: State
initialState =
  { route: NotFound
  , text: "not changed just yet" }

update :: forall eff. Update (console :: CONSOLE | eff) State Action
update action state input = do
  let unused = spy action
  case action of
    PageView route ->
      { state: state { route = route }
      , effects: [] }
    (Changed ev) ->
      { state: state { text = ev.target.value }
      , effects: [ do log "the text changed" ] }
