module Hello exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (Decoder, field, int, map, string)



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type Model
    = Failure
    | Loading
    | Success Quote


type alias Quote =
    { hello : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getRandomQuote )



-- UPDATE


type Msg
    = MorePlease
    | GotQuote (Result Http.Error Quote)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( Loading, getRandomQuote )

        GotQuote result ->
            case result of
                Ok quote ->
                    ( Success quote, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Hellos" ]
        , viewQuote model
        ]


viewQuote : Model -> Html Msg
viewQuote model =
    case model of
        Failure ->
            div []
                [ text "I could not load  the hello for some reason. "
                , button [ onClick MorePlease ] [ text "Try Again!" ]
                ]

        Loading ->
            text "Loading..."

        Success quote ->
            div []
                [ button [ onClick MorePlease, style "display" "block" ] [ text "More Please!" ]
                , blockquote [] [ text (Debug.toString quote) ]
                , p []
                    [ text "— "
                    , cite [] [ text (Debug.toString quote) ]
                    ]
                ]



-- HTTP


getRandomQuote : Cmd Msg
getRandomQuote =
    Http.get
        { url = "https://localhost:5010/apiary/api/v1/hello"
        , expect = Http.expectJson GotQuote quoteDecoder
        }


quoteDecoder : Decoder Quote
quoteDecoder =
    Json.Decode.map Quote
        (field "hello" string)
