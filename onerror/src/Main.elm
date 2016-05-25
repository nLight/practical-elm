module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    ( model + 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick NoOp ] [ text "Click me!" ]
        , strong [] [ text (toString model) ]
        ]


model : Model
model =
    0


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )


main : Program Never
main =
    App.program { init = init, subscriptions = subscriptions, update = update, view = view }
