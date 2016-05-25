port module GA exposing (..)

import Maybe


type alias EventCategory =
    String


type alias EventAction =
    String


type alias EventLabel =
    Maybe String


type alias EventValue =
    Maybe Int


type alias EventParams =
    ( EventCategory, EventAction, EventLabel, EventValue )


port sendEvent : EventParams -> Cmd msg
