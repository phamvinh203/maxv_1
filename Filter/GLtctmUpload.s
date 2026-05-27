<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY TransferID "GLtctm">
]>

<dir type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tải lên" e="Upload"></title>

  <fields>
    <field name="upload" external="true" defaultValue="''" disabled="true" inactivate="true" allowNulls="false">
      <header v="Tên tệp" e="File Name"></header>
      <footer v="&lt;iframe id=&quot;uploadIFrame&quot; name=&quot;uploadIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;#&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;uploadIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Chọn...&lt;/div&gt;&lt;input type=&quot;file&quot; name=&quot;fileupload&quot; id=&quot;fileupload&quot; tabIndex=&quot;999&quot; class=&quot;divInput&quot; onchange=&quot;setFileName();&quot; /&gt;&lt;/div&gt;&lt;/form&gt;" e="&lt;iframe id=&quot;uploadIFrame&quot; name=&quot;uploadIFrame&quot; style=&quot;display: none; position: absolute; width: 0px; height: 0px&quot; src=&quot;#&quot;&gt;&lt;/iframe&gt;&lt;form id=&quot;uploadForm&quot; method=&quot;post&quot; target=&quot;uploadIFrame&quot; enctype=&quot;multipart/form-data&quot;&gt;&lt;div class=&quot;divUpload&quot;&gt;&lt;div align=&quot;center&quot; class=&quot;divButton&quot; &gt;Select...&lt;/div&gt;&lt;input type=&quot;file&quot; name=&quot;fileupload&quot; id=&quot;fileupload&quot; tabIndex=&quot;999&quot; class=&quot;divInput&quot; onchange=&quot;setFileName();&quot; /&gt;&lt;/div&gt;&lt;/form&gt;"></footer>
    </field>
    <field name="filename" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UUet3ogxz/8bDHsigjbmjGlDO7fvsQgtATbprUz5GJRtXsXVUFmiIOeOUvya9lNrt2UWJIjxvZIwe0040aMAqw=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Ua0FmiC/p6gAUYsXPsy6IhFwoTql4UibtoivEfI78kYm2VjJQUQl4c71MTHM9zeD3uR0btf8MNF7YSdc+ilN6c=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f8nglfnsdn18PAWhCUqz6dh71pCAE30TsS7ULrjt88U/qgu9NzbYIBbuXcUyEE+AMYwGz3U/mYzXiJ9qKCvA+M=</encrypted>]]>
      </text>

    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>dvDDvpTVTGJi7dB8I0oMoVvDdZrICHJ1bWSZ0NKHmis9IDv0vB4tfVaFipwPlLg60OMGyqt06QI+NJYimG5PrkeuT3j3qQkD/QAqlqJb9ZoFW7sreUEXbDjUAUyCFXoc+jlcjhXkBqwqt/23EmRPX6Fku6yvjbrFx6ES0ZMGl7ABXhcdVtK9V9coAFnb8Ts1bp0JlVuL383qqZQHYkI6IXvcKgGbfozexdDSmYiLIRbXb6aM4JGF3zWmrfTPJGkP/3oWRbIn+4eBpAJZFNLyItO3frZmBK1z+thrjj5UGspSjC1HsWC5kFufwyXRbF0egiIP10EJ3W+7Q+EielKMnjbhJcBX/A14wVURsqAFSXB9i7PgDz0axe2oX8PVaUQ7JBOw0gh2lcSQW0WDjKH5I0WMnMkZAPULlj1qEXBfkm0=</encrypted>]]>&TransferID;<![CDATA[<encrypted>KXnooZcz5LS/00+o6+Q233R6U+Mr8jNq3POpgaGLtPvkLsCF6NhfFzynEazsbtkKpEhSrkrqKa1JF36YXJRE+wGdS+iYFZu/zV5LQEedKc0cqGqk1gXsHh9TK3TAe4hzCiG7il3Sgbl5E1btGSHMBgh/IbLkzChmMkgrkJqQ4vTlaBiHcd/n0U+WvqoSKUdN+TzvVaSZNjCYkFfV9MGeY3mFXIOLhSweu3vIYjT2jfIYzcaq5cV7w6pRspLmMQIO7q5yFxta04hcMGss03obCzt4V/aSKhxJGdOe5cEVRnRJ3//cuhjp/1aySMGpctTS+f1t1kvgpfeRaOBoLAwaVQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>5MwNWd0w451vXYduyMLlZLyPmlA8KXz3a3YfU63wac0xb4nAXh3g4hRBm07aIXUKAL679GhUy0GGs/Ycm2saVmE9Sm34hIUcy9JxQyqMbYUoLpjCGszP9aNreWJWbiRtdtapaqSgwi9n9U5wCZ4c3IRam8HDPskQJ2NRDrra4Xy4/NFxrCyg1UGJfsVW+BxBQSNq2ET/pAS/UrdlPcQ6SC8fiKoLyta/EexNDUl9cRHdmzZbv2P9DXE7nr93JUDXaRa+lyUH7hbJT9wavyDOpQpVR67AKHsIiHw0WWX5csy27YoUbvdvpSQV2c6JhTtLJh5/u6Vs2vEsqJsFg/lpgD36SlC04gC+D1ScmFhvHs7S2riRB2MLia40TjLgfOkzInCXtp5fd78DoaMax3Dpu0/mfajaod12UTZi3rAGhTPRS2/L97SYGllRM1eaNlF/ciPcWAopd3DpvUdpCGmt3DSdNv7loUhA3cDx1pY32Q5ydssMri7It4r6yDP+067IxBaRbX0LZEdeQkBAtsXmgTUZSCys+DjTYTXbaxjtGjR6lFgoVy71SmjMka2ofXsVIoOAH8RwvLI0B7wFIA3Mw9HiQWv1tXGXA1504dUXpXVWjYofSHPuLYQAJzqXPEnn39RrRR27ps1uiHn758vWHDrOecQVeyv8yHfAoiEw0m6oxJRy2cLWprwWa6NOe2CHonsHctaFHnd4Pb2ha0jOPMXWY/nEHgHvCpr6fOdrg4lpMZuC3ZTYqNP4Yvkr4abCPzqZEZ19UpA4kbN9jdg3l4+yQdvUMlTNATk+YzkBG9hU3VF2zX+f3RFPcwDGcaYLE5XIU1Hu8/Q2ImMbkHwHl2a8AoakYDhGIcO2G7mO2sugXmjKPCtviRqbV/nYJCpG5zC+aLM+m3BxoKzAHYoxZQKtzpBJDAaKlQxXZeRAByA=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>CuyR57QhAwADh+YpWTmYicAM1J1CP8RzTpiV+0B2LncUBFddSLv6f1Exvrx+kFKybn/ZrGx+bhVPqjFvKNY/x3D6k9zFFT9hqcSXh6OKruELM9yCbAFHzloU4pb7Oz5uFCI39VewuOqkxv3EKKZ86YR0UeOtD+/7zwUEDLGVVRtNRXfpQ2mgTX//a5OwB2DVal/ZkfdEvjD4VN5dshFgwsNWKyH6kM+GL6jfBBwOThItlsrcoSHqUHcnYcM6kCf9XNfDnzJmFwSJS7CcBWL2KtdSw7AKax7wgVQwq0P8b5gxVK+ra4SwZfEC8nbehXgfP2YkbQjsVSgPUGYIpyY/CN5vcJYzg2vg9gnoYv/k+or+1zJmMSiLtaRoLp/pMa72LBssSuZ+vjHrdYqWY4HvufI7yzO9cq6lr+hbfFvM3k1E8I752Bp7poNIXnEoStN+MVyjeWPcP3nFT3MAYoLxBw==</encrypted>]]>'&TransferID;'<![CDATA[<encrypted>QPU+SRpL33vYaB0CPhWLROdvEGui7lO1UHzBsKLH3PaVteFKTboJDaP5RxVJADrPDWvWV74vyGNjO1MppqV2lmS8BsC29Y7ll/u1dB1dS7Tcf6iWjd+p+6ObRV6awJkniXE4XXEwTx8OvY8oof1J6g==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>