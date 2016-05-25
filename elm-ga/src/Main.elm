module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Events exposing (onClick)
import Random
import Maybe
import GA


type alias Model =
    Int


type Msg
    = Inc
    | Roll
    | Random Int


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Inc ->
            let
                newModel =
                    model + 1
            in
                ( newModel, GA.sendEvent ( "Buttons", "Click", Just "Inc", Just newModel ) )

        Roll ->
            let
                cmd =
                    Cmd.batch
                        [ Random.generate Random (Random.int 1 6)
                        , GA.sendEvent ( "Buttons", "Click", Just "Roll", Nothing )
                        ]
            in
                ( model, cmd )

        Random newModel ->
            ( newModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Inc ] [ text "Click me!" ]
        , button [ onClick Roll ] [ text "Roll!" ]
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
