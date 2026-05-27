<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtgts" code="ma_tg_ts" order="loai_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="lý do tăng giảm tài sản" e="Fixed Asset Acquisition Reason"></title>
  <fields>
    <field name="loai_tg_ts" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" inactivate="true" allowNulls="false" >
      <header v="Loại tăng giảm" e="Type"></header>
      <footer v="1 - Tăng tài sản, 2 - Giảm tài sản" e="1 - Increase, 2 - Decrease"></footer>
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
    <view id="Dir" anchor="3">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [loai_tg_ts].Label, [loai_tg_ts], [loai_tg_ts].Description"/>
      <item value="110: [ma_tg_ts].Label, [ma_tg_ts]"/>
      <item value="1100: [ten_tg_ts].Label, [ten_tg_ts]"/>
      <item value="1100: [ten_tg_ts2].Label, [ten_tg_ts2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khlMCzp3IQe+vunFiTdbm0O9yvzp04QNp0Dhb0tyT5+cQyi7OYT8fmpf1KX5omtt5BPnhSK4QbYAnvhxf3Yi4Ig=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ki621xptM6LSbalUzfjkVaSyHPT8nw4FgXJfdsWSMTmiVxYDF6Py8D5H+a8Acy5GIUiXrjuN1HQasHwiMKXxnP8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>TllLxOywGidwPuoQnMBE5LkkRJa05btGM32VtQfqiPUIS1Hri3gjvZdFt/ETWNyEI6//2C5syRa4hhGx9KvYWgMfwGbGyAT4mrw2iU2pwtCyUWr1Vwpb4UQkNpH9OQU5PxoWUWSHaBiVng+ufm4kCiUTwfnkewnEHbSgmgyJB643R/ZvluDu8MOsw8LNJSyJ7q2DkIZbR5+RFseCYsjdiLBIxgX3ZKCd4RuoOWMqI9YqATSoh5qnxWtdzop8c89iXHr0FPpkVSMOs9N9skss3bzT9wp++bCDAlYOEqdseQtFMB13OPAPGrMakUoYVOCfCGWBcY8g7oHbZGz9j3fDqDUCJCEMdtfGS3QHHPXMhvigx8WxHBsjO+sTY6K+hQtVG0+gvvoApvHYSP1h4Ej0ch19qlvVV+Io61j1M/RgcZCiMeXNk6Fuqldr1UjFSTacrEvtwM9c4UueWYYIdOgqapQy/snZ4bY+4pqX+sEfA3+epr5TlyE5Yak/Z3i6P5nAWng4IpMj9ck56mtY/c9v2mvC5DgL6zCHLHgMSzyDXDW3gEH7nwfEbTsVgLYhI058nOersdSXbmrgyIeHTpAi/g==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>XWj9Pvf4xQX4Y7GnNykMmwNSCdHQSPd8ssdDIlUmaXVJwmyF1o4p85kHusYNpeTnIOFzvjp0Vp8d5FsS4XjOEGwQbKPwNcCJbZbg71SQmGdCwIUHz+aX6mrkYourUt9LqzWUy5ZVHNjPGhO3okBTr1pA3pUecgFUi1BrotDfWEL0FvJewmEYJSZp6yuE0ZhLdhEUrtUzZM1kSfHf8C5a7w3+073xJ66ZaPnDipWRr2e4pfS/5hS17NBdQy+WXdtydD0QtIiT8HNrwRikjUg65A==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>8VQA5FT3gMK4CBC7V6R+PpBAOc5/o3+qfRW1+3SppQIhYG/D04pZHKaR1DZqxAxoGPNkreZhoDWdpMb+cxW5mtLi5IN8BStxoYncL5VZuRHRUt/tsA5XXO/lnadhn1MK/4P0n4k1oYqlRhHgE+DhtNlE7sBJ8zXwBvNIG1UBSvwb1xBlDIjJFPCoEI5zIyC8TRPLQz2mWjbLYgc9ySV6nRoqXeo2EmPog9q+XVgo8h4DOQeNiV5QCqu3nMZzHjRs/F36xY0wIQofQ9fpCL4AHvNry3KToXTRg5x3DRFpum6uwB2pmDNlmXGXvQQRqoZqvRrgNgQKC6oR7NoNvnC3FQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILRi4tCtfLv+ZXHs7biYtm+Fw5xBST+DAOB1MPYVdqXCX</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>OnBeNct8cOjdYl9PldL6zid7boATl30NUJ2FgTWTAYS5HIEq8EZgbuCdBnJav3GJdqE9K435lTDDmyoNU2sCPxWVBDghdfGLIjgTQXFyNxUHq9tuMqSlCwMa5VM2OWsB1j0Ygalsm3Z5GTX9ydav05gtuKHI4cdF+kghURK1I4yGAnKyVyQhniFE8Mz+PYiN1qH7jsmKxSHxYIrMErLq/ZdZbkd4kUtHvkYDlddm8y1dENBj4DgLo5poYPLblNxdFXS93u7XqQE4INp0uF8Blh5hQum2Vsz+n2QacUmQ7EuzRV/k6+9+z09Pkxzcd8jMd2L0eeiJ3pY1WRwqwxuW6GRuwGTFmamb1oi3tfyDFxg=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
