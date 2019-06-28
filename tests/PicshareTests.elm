module PicshareTests exposing (decoderTest)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Json.Decode exposing (decodeString)
import Picshare
import Test exposing (Test, test)


decoderTest : Test
decoderTest =
    test "photo decoder"
        (\_ ->
            """{"id": 1
           , "url": "test.com"
           , "caption": "test"
           , "liked": false
           , "comments": []
           }"""
                |> decodeString Picshare.photoDecoder
                |> Expect.equal
                    (Ok
                        { id = 1
                        , url = "test.com"
                        , caption = "test"
                        , liked = False
                        , comments = []
                        , newComment = ""
                        }
                    )
        )
