module Test exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { name : String, age : Int }


init : Model
init =
    { name = "", age = 1 }



-- update


type Msg
    = IncrementAge
    | SayHello
    | UpdateName String


update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementAge ->
            { model | age = model.age + 1 }

        SayHello ->
            { model | name = "Hello, " ++ model.name }

        UpdateName newName ->
            { model | name = newName }



-- view


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ onInput UpdateName, placeholder "Enter name" ]
                []
            , text model.name
            , button [ onClick IncrementAge ]
                [ text "Increment age"
                ]
            , button [ onClick SayHello ]
                [ text "Say hello"
                ]
            ]
        ]
