<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phòng ban" e="Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phòng ban" e="Department"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên phòng ban" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_thoai" >
      <header v="Điện thoại" e="Phone Number"></header>

    </field>
     <field name="ma_td1" >
      <header v="Tk chi phí" e="Phone Number"></header>
       <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/> 
     </field>
     <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên tài khoản" e="Phone Number"></header>

    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
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
      <item value="110: [ma_bp].Label, [ma_bp]"/>
      <item value="1100: [ten_bp].Label, [ten_bp]"/>
      <item value="1100: [ten_bp2].Label, [ten_bp2]"/>
      <item value="1100: [dia_chi].Label, [dia_chi]"/>
      <item value="1100: [dien_thoai].Label, [dien_thoai]"/>
       <item value="1101: [ma_td1].Label, [ma_td1],[ten_tk%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhqCGCgDfAVHseU/ojAqXdKxW7eiYzdT9hty6MMvChTEFLp6FfrpPi+5hG/NnSLfSTJZrOuYUDNbc4ojIhp0oJj0</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f4SzES6U2Mh5SyTA5V5+dzvWrfcxz3kMbkJhJ1VP2IcdVe3OUy3eaAkbE2GbxFr0GqJO4JXcNXIVU3qzcoWa+U=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>w3OZC/PjRH4vzuVfNYz7p6/7qaI5JdUi43d32OAYi+gY37CqlzRay/YG59osKDGEeDyUQHzdcS5vvJ2Xg1s6aGXiNDwCaVCa9fFTuNI7c3m5+y6ONKpmy0xpNptVXKSM8CU10AQsDys4gdH/NdCYGooYCvkqk+mxlUR/Gp81zt+5K8ku23pgt4pzvwWMN9iubwjDAdXHiFEy7IU00dvgN4kXWfAIX5gRKXSg6a+5O8+9bRFWMfLIbylgVOd/4rUIoQkFDwn7S6ZmociPEfKpwnEExXF4p6Ps3iSI+c/ZeVLqkeuozV8tm+7BF9hLja+Mo56rMXTi+JeWsyIwsOkIwjAtzYxzkKCXPzQAZh7RFEhrVw/TNHcD6PgbIAx8KwrZmcHNOdkgnfEExtcEqpX5yHlJIHMLcuzEINffV4tNh1s2tAvW2JsmfjLuhNXX+h7X+IxepBdoiEpRGhEM6F4Iw20cFnGtjqWStyjGYcHqEd5GzfqvbRYs9LtEgS+byQQFNh//OmaNDN9E3+U434E9tV7DOugie+mONyYmvu6LyLU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVayZULWxWuiWaD00/92GBama5UOpE1TTLDBuQgZ2cu4TzqCOKqZOZ0eJakQyyb5u/fDw5D1+uotcUsMCSvizzfdfiA716iyLJKJQ6dQsy5ogHmva8CzEZxGDLRDPsnJCmKMLsw3ckeult+JFqsdKqXwiTWX9Omj8HJn/v4RwTAGbX9RiPDNcwJzzMzXpP9pE16T3Nh1F86neYOW7l7jj9gWsnRygqMNJojwx3115uS29</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>AAGHhg3jOH1VxZo+6kt2gG/beL0OpoK14qWG+mBYEIpyX/YUahNvrAqkH0CwIeHedw4/f1I6vAEjzGIB6W3JDitUtRhsBc/cRQReF9AbMB72FNtOQ8Kz6FT6EG165ohg1xdeOSvSblpbzcgpplaB2UduX51Vay1koG0rXDV7RTG2BS7okEiiGnOAEGdvhf/lqIcJ0A0sMVXyoBwNj6qH7lJDAZx+0aAWsGgyuA8mEYyh7m4A8nf6bDJZYlOqSQz9G22C/ZAiOGLQya58QpTITL6XfFAIzeuyhJtHLoDv9NxDOS/o+9i+ZnOV0DErIalaPRBti9oI1B19elCwxe57O+ufZzD3X0QFH65nqU+jEs5CyZ3NUZSDRtlFPkS97HFqVQDpWofM0nM6yssoVlm3VQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILVdH/6psQN2I4F3kxXu7dzTBLiEPvpSHk/aBEENryMnR</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>RvzD4eCJdtHLirU1qk1VfBFtG0gPgPYhWx8ElO5yD/5/qXkGp+nnKXlUj3RGbgPFCGZhpqfCGIsYsaEMcE+UyEMlJsvilOKapvQs2wPADXvJef5+YpGvKoO208Sg2iyXk9b/RCswL8MvTrtUqZM6N0riMZ6DjqNOACleU+irfBjwFIgv6MurPZaXoASEMIomFtKAot7dNdFW0QBlNxyB/Oa5zbDLZw8t0g1LLNJyc6A=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>0xtOvDrGrcTOFl1HR3QivOqgEpudbPbVqjrIQMhHpaQliCsHGy+W2XY6fTlGk3c4dnht6t714UXiza4suuc5x9O6xG+In6h5kgIrF/ITYzja835xplcjyYCS7cbyxjCmK6Zo3ElNMe5NwyP+kDfZWA24Puz+Yc4SR8sbzmyC5KeCx/7GPVr9de2z4obp43q3Bx9KxutuTGHQZHpjn2grJbnF9g/YSMCEhUU3lPAgrLm3AZsGZ2/iN4/TjDafFPxH8oK9/zPmzb3ArnzkqNl6iBVhUfdhlcChT4FgYwFExFiuK45/gKkFvCA5aHj5K3eQfpyobspi/JEjgzswtyAzr3hv0/ZwLKzV0nyASRsFNjQ=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
