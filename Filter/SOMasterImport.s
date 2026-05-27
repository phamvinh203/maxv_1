<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SOMasterImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
]>

<dir table="m51$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập đơn hàng" e="0. No Action"/>
        </item>
		<item value="1">
          <text v="1. Duyệt" e="1. Duyet"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 50, 100, 100, 30, 0"/>
      <item value="110000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      <item value="1100: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dBQJ8wla33p3qrA3ah0ba0eD3/3hw+8mP9+Wv6OM5EXfFnlnLWmnKcz0u3xEZbreg==</encrypted>]]>&Identity;<![CDATA[<encrypted>5+Q3LKJ9icJyBb/Nr+tBx3iBSXPUmB1EL3w+7FYArEQW9IsX5AIHZK3Blm+w1z6Y3D9UIEO2JdIwc2HyROtIfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&Identity;<![CDATA[<encrypted>5+Q3LKJ9icJyBb/Nr+tBx3iBSXPUmB1EL3w+7FYArEQW9IsX5AIHZK3Blm+w1z6Y3D9UIEO2JdIwc2HyROtIfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>CyBxUEdtIS4FTvx4/GYNu6xq5fcgaqHE2rxhqEtuyy55tPMP+/1rTI+A1UYByTaLXhke3HaxKJZ9Xx2TIjdsuvxJrMu3VJK3yUGciXJEkUfd4+Mourmn3xYeQWmJO0QRNmguQ1Qc5hLSvdTBkqmbaQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>M1IwLdBT+OCaxgcRUO1XkR3/ELItfsGt0/qOi7xgTRkx4B1wDm7N6zLbddrUIEBxRgsP+5tu1hjp32xkuQQhRyw3q+VhQluN0f1s3xH102FD7g4uxXauxRVe5wTDcUyNtXMTL3vEm9qub3RdZhbH8noaavf82SMyRDmLn04HWxFcP5HIaL+w5EpqQboDsEA9wLD8vCSzMJGHNecVacCqNAxw4l+QaJIhqSTR+yC1S7s9xyCinWpLhim4K1Bc/uoYMoOEPrQvYMhqR6YLHCyql9UjRK0KUZ+/VPz5NN0pwZdvMmHfBpAOtSh3w2KFuGTIIzyhKUeMntj8PWLk3buP+cICr40IXT+cJ+iaRzDXxTqYvO7GNJGk6x7kQK/rJs/p</encrypted>]]>&Identity;<![CDATA[<encrypted>8lWJ1d4IozP+OJqy+mvq4s1i+HWcQ1PbXKz+LXAX7t9RXC2kMIOmkf/ezqhFV8cdnaU3XD5Mr9nd03vzdB1hnWWVee9cIS1O2JrD7kXtpZg=</encrypted>]]>&Identity;<![CDATA[<encrypted>k2nUuJmMdFsiCz5vZsK4yWAwGm7WXcts1yr//FXBIQToXkfDWDua4YNO3GseWYTHZfWAkjq52GEs6CJ6ny4KCeGvEpgRQozFIZ6qYKUlTRyrtsLLzJczb5G/0ap34/hi/1wCv+zzNOKWyOlTMro5TTGO2jUcT122UO9uG7TLIh3tM6DBOSYdAMe5JIoQvu+8JH4f04bqUCRoGzXkgEASzZpz+nCpt0/9eH24fDqCP1rtV855gq81CMQ9kUiWAFPnZM2uWsfLLNtrg2cP6j5QB2mVTKMrcBoC+g/jLGBwPC6LMcr/VSRELpvlH5JNFXb36fnYi26T9DvKHkuiE4aLfwwm0NrnafAuHOvMWa8YNOjfkWUuufF6Po+jV/YxK614QwbUbdFHXnr1de5j2iEdYPbkz95lW8XyrTC1REu59KJMT+WGpL4oodVSugnLq2ekHRKdqaKsySaT/1+ljob4sXHO1rebsXWZriRp9zYoS3Y1w1WrNuz7s3b25pOArYifwsQyN1ElcisF0cAt7WLe3lvtnEMSNPqyWxvdU8miP+s=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      &OutlineEntry;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>2yJQuwzj/Bugvq2JCy2U3zxIova44nRU8SFJLhkeRf8oJx5GvfzOncQb6gQLEmAe8+MvauAiEirXrWhNsoRhyZifRDJgiHF6GqaqszgPTcNDmDsN5kkQ5im7Ux9qAIpI0dU0RNpHRkUWn4oYI6nKFTyYHGgoSzWjnLumW9IS1NZnYs683vGzDog+5PWwsQfQL8rUb4Q8Jvkjf0jz5nZUtD+53JR1GQlF/mBScLjepYt4yU801qqjaePVENRvNmWpy7UF9zO+BP2dEKrH2KHX6g==</encrypted>]]>&Identity;<![CDATA[<encrypted>SNaNdZc581l/IqnaLOo8LtE7mFYwPwnq0cpsbJXCmcZK7wC7v6Wvl9K6HifS5nfX3tGbCP8nd6k2Jo5Dc3Z72qbBiAZwLZOcuxUex3UFoTIl/S6UjyI61N84w39SS6jhf447KGexWaR1qarQka7NmmuIHi4w9C2VkEtU4np2wgQqypxCSSLk49/VpHYuFKMVgAhUseY7UEDxNKQ+OZqU8tdwGu3WzQ04ym2p4L7DBovflngn56tYp7myEU/Ttvst</encrypted>]]>
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