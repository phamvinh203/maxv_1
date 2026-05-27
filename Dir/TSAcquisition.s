<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtgcc" code="ma_tg_ts" order="loai_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="lý do tăng giảm công cụ dụng cụ" e="Tool &#38; Supply Acquisition Reason"></title>
  <fields>
    <field name="loai_tg_ts" dataFormatString="1, 2" clientDefault="Default" align="right" allowNulls="false" allowSorting="true">
      <header v="Loại tăng giảm" e="Type"></header>
      <footer v="1 - Tăng công cụ, 2 - Giảm công cụ" e="1 - Increase, 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tăng giảm" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tg_ts" allowNulls="false">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
    <field name="ten_tg_ts2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [loai_tg_ts].Label, [loai_tg_ts],[loai_tg_ts].Description"/>
      <item value="110: [ma_tg_ts].Label, [ma_tg_ts]"/>
      <item value="1100: [ten_tg_ts].Label, [ten_tg_ts]"/>
      <item value="1100: [ten_tg_ts2].Label, [ten_tg_ts2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kinu3sLWIPcdLU2cpK4LIzEmStg0O4QPVAh4GW8mdo8lKiKbzP9+9hFXvFk+BwO2eddpMPn14yf4HvotD2UTs6IiAGyJR69C/PdoafSecahn</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VrkIPjmXlWfCXfbfOYMNsrT+hzfWQQP9vgqBcCymrzIH/+Ze8NnctOfmguZWQtoENK4Uj+ZvcyDH0Zhy5/UIqe/Ry/T4oi9AvjFLmddXrYV</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>iX6VeZOQDkcdMGTczQr6lzwuH8AKXY7jCw5xZ7jIzD5XV5Rgxa05EfOpyCCZ49syLn9s+XY5jcTtYHMYdmGlYKBle/YCqzcXYPniUd658SlxuAUoyR+uRCXAMzLOvCSLpGjWC55BbFKJAqS4vdUQyNM037J9Sezx+2AI7ztjFl1euKpHhwlB/Zgzg3FOZ0hrnAPKLhLhOJdlFL2vVh9AOAifrAqTclcZpmS744xVK92eLvX8dnTJlqUyW0I+1KgvbdNqivsamHw5B8Pv1VHtzhfR2RQZyzU17tZX3PtCnn9T8tLkDa/j1Pja44u112n/y1DjRoN2s/Z3t5EhnM9DGLbYszOJXyhd92fAb6+AvC/3VF2Pf76zKYReui83dgDC3Sp75+g1DpwmNcLdiZ9ukTbDb+VTcvOeYsXKO5Yng0Y8MhnDessyeXQfPlRKdCKXcMU0c17+HUbPTjHWK6rdQmieOKQmgI50LUa/M2DRCYaePQHs9bxqZaxf+DM3OikA868OwteEa6QW3hOlF/qCpaeFt9Slkbph4AMoEs9jviUT69opUkwveXvE2j6WvIilck/Gbm9HHeRzMVdI/PrMWUMGAUVSpwRMO5QV+KQIoks=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>XWj9Pvf4xQX4Y7GnNykMmwNSCdHQSPd8ssdDIlUmaXVJwmyF1o4p85kHusYNpeTnqeDewylq49gemEv13oSp+k1iVrOqIo5Csq/8T+jX92T63S4fqnAbjCcrGkwcpF/a154gxIJ9I0iaSud+/MyDVr/YvP0N+lTPglDjns2BwySPvXFr3R/mh3xqlChejw2wotiNKIu7CS1jHyx9btMmDz8xksv8exeY8ejn+4VHizycv1gW1Hf26qhN3eX+Wy/APqJoFYX8yywxRa2Az4YKbw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>8VQA5FT3gMK4CBC7V6R+PpBAOc5/o3+qfRW1+3SppQIhYG/D04pZHKaR1DZqxAxoGPNkreZhoDWdpMb+cxW5mtLi5IN8BStxoYncL5VZuRHRUt/tsA5XXO/lnadhn1MK/4P0n4k1oYqlRhHgE+DhtNlE7sBJ8zXwBvNIG1UBSvwb1xBlDIjJFPCoEI5zIyC8TRPLQz2mWjbLYgc9ySV6nRoqXeo2EmPog9q+XVgo8h4DOQeNiV5QCqu3nMZzHjRs/F36xY0wIQofQ9fpCL4AHvNry3KToXTRg5x3DRFpum6uwB2pmDNlmXGXvQQRqoZqvRrgNgQKC6oR7NoNvnC3FQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>+8dk8CdjOsAgcSbrPDCnTpg4mdwXFTqKPUqS2FobpMJwfUwt9+34eG+jEh83zFF2cB4cTBuCz1/xtxFSFJmR0MWVq1C8hS+WtUUZ0yRXUIBoSIED6uR+gnLTR8JIrsdQ</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3oiSlnepFVO2vgLqQ1NO83DS03ehECXtTbP4hcLx/mfTF6H4g14no+ukKiB74I2fKX4qImg+7NbC05KOCJyE2L798IWZwYDWLMALX5sli3sMdcRTQCBgHGtWBVYAuzPPqTG05gFCqt3aSlxDtIf01TB1ihZkTQd0YuMWSFCggJRer01LN9nLXlFSy9sEexzOFgmM4yDmVxMB0c7JbE+HbLUr6rN7T3D7I5XwKFtYtoVuTJ/etbca+81HWPjboyVJnu2jMrkhXRiIE/nnm1wTsDyZb/0vUZ1TH1eXBtJ50+66WPl5xml/5jRb7XCGHgzMQOrHothXJ6cUrcAEeRdjLG+Q=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
