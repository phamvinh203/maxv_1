<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ItemImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="dmvt" code="ma_vt" order="ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
      <item value="1110001: [type].Label, [type], [type].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>CyBxUEdtIS4FTvx4/GYNu6xq5fcgaqHE2rxhqEtuyy55tPMP+/1rTI+A1UYByTaLXhke3HaxKJZ9Xx2TIjdsuvxJrMu3VJK3yUGciXJEkUeuOfqtwUjBpBIUpQss+yjWKLPz6OF6yOxvAnpVinwpnA==</encrypted>]]>&Identity;<![CDATA[<encrypted>M1IwLdBT+OCaxgcRUO1XkR3/ELItfsGt0/qOi7xgTRkx4B1wDm7N6zLbddrUIEBxRgsP+5tu1hjp32xkuQQhRyw3q+VhQluN0f1s3xH102FD7g4uxXauxRVe5wTDcUyNtXMTL3vEm9qub3RdZhbH8noaavf82SMyRDmLn04HWxFcP5HIaL+w5EpqQboDsEA9wLD8vCSzMJGHNecVacCqNAxw4l+QaJIhqSTR+yC1S7s9xyCinWpLhim4K1Bc/uoYMoOEPrQvYMhqR6YLHCyql9UjRK0KUZ+/VPz5NN0pwZdvMmHfBpAOtSh3w2KFuGTIIzyhKUeMntj8PWLk3buP+cICr40IXT+cJ+iaRzDXxTqYvO7GNJGk6x7kQK/rJs/p</encrypted>]]>&Identity;<![CDATA[<encrypted>8lWJ1d4IozP+OJqy+mvq4jEOkgQr3YbbQQkkcsjnUabFHnrRNT2Be/1mBMgmMBwt</encrypted>]]>&Identity;<![CDATA[<encrypted>EK6upKlyef5Tsq+OQ9o6A1VJYU597NpltI12gSWddyJruk/ItB9frzgtnb+4dvorfr9e09lzjgV6KgcCfMH5VZyGSEvmE/rKAcduK5EQK7cXzVltzX0zt4s+tsfQaNrvdmYOrpSymtv6eS81z0ZLvsWfXREu6GpZtXMJCeLS51o7aws23V0W5nSlXDR818+6Aau45rHtxfqCRT1kYd8fAFgYoUe0lWqOFGB2orX4sWhmBvH52zx4ZgvVhP7t8Sy1SVZI0UyF4Gx6gsMF5sXWpXy6xQK31M4m0uHZuBVmOwSq06YO20OITLMC8qG5aHEELM1rskcLoZSXjppIAcLLVFKZwIT9DYv/W7K/aiEWeSRYK0pHFeiU0IjCNiL5FRhvd860c4F87Hmr0UzZykJQBVkOdqmferQICfLuqGJl8eSQxB+cDEbwbk/F330+a1RP7YCGPtxv0FNvr1MTW8oIbL0mObyFuSrIbCJ0W9ZhAoPyW5RGDKGsIQzXIwlFyoQKNJRjgFkLFf5P+8jhtRWpmA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>QGxbsPHCMPAv3vvc+Bap1wGJwdh91J1ABrgwCGJGdkVwxJhCJDiakCjg4EgXwav7dE+zP9M4f4yX3OMK9SdJ6H38aWTQzN0syzD4nApZJ9/hw+sxbhs0GARV01Wjo4o4HS7Po2+hjfGcB4OMMekRFvNwiQfTjAjiGGo9sM36ducRn4KaVeC0Hm4oSjc59Hk+iWxrhbj5nDo19Zq0AHd9sXKBgmwcJ1IwqhEtZy+uXrYPB/xlOyuHKGcgt5731QrhfwboLMcM66Vby6iQbEGJpA==</encrypted>]]>&Identity;<![CDATA[<encrypted>SNaNdZc581l/IqnaLOo8LtE7mFYwPwnq0cpsbJXCmcZK7wC7v6Wvl9K6HifS5nfX3tGbCP8nd6k2Jo5Dc3Z72qbBiAZwLZOcuxUex3UFoTIl/S6UjyI61N84w39SS6jhf447KGexWaR1qarQka7NmmuIHi4w9C2VkEtU4np2wgQqypxCSSLk49/VpHYuFKMVgAhUseY7UEDxNKQ+OZqU8tdwGu3WzQ04ym2p4L7DBovflngn56tYp7myEU/Ttvst</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>
