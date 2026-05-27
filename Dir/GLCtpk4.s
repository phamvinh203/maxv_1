<?xml version="1.0" encoding="utf-8"?>

<dir table="dmpb" code="stt_rec" order="stt_rec" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hệ số" e="Coefficient"></title>
  <partition table="dmpb" prime="dmpb" inquiry="" field="stt_rec" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0" disabled="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false" disabled="true">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false" disabled="true">
      <header v="Tài khoản phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmpb1" external="true" clientDefault="" rows="242" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GLCtpk4Detail" row="1">
        <item value="ForeignKey">
          <text v ="Decimal: stt_rec, stt_rec" e="Decimal: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="loai_pb" dataFormatString="1 ,2" clientDefault="1" align="right" disabled="true">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Từ tk có sang tk nợ, 2 - Từ tk nợ sang tk có" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="7">
      <item value="20, 100, 25, 5, 45, 25, 303, 25, 25, 35, 120, 25"/>
      <item value="10101: [stt].Label, [stt], [stt_rec]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="101000100000: [tk].Label, [tk], [ten_tk_pb%l]"/>

      <item value="1: [dmpb1]"/>

      <item value="101010000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UA+5MFQy6UD6zb6+t1bGNJ9WotZAYD6hSaRVF0lNqTZ61EEz8iQdV6HYPUJimpMxAJmQCW3WYKSwfn1oqQVT2k=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>VL9wRBs6OqXNsjIjnSXi7o7Dq7P2QiGUMLSBEYwLpIg=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>lnQPyEL9xB+rxlWw6daHZObOyhui22uq91an0h1yBKxy9LaMs+wx8CCFo5gI+ZFV17up8AdlvVAVlnakqbjRfLXOZPzovvljOdZuE43e2Sj30YAtou4C3WDUOvOYk1CU22iObQlHoK6RrOR6YVTSeShX9KaMap6wRRs7DVxO9pctsrHtYCiVAPsDTDtsQh0Rc3pVOB5xrry4i7K3LQkzJHVEov9kyMqjHvW0HIqFpK4DhBJmbLbU9bIevrP4LNsYLno5XjFx0+Slsf48VV3+DaoMWt8j77qQehSn4sh/ic9vCKPQERwC474+a9sgSe47wNkJGVRDO3bSTF/X4ezbQhyCefxpFwZ19ha03e7g2L/8B9zLXKwzl0s8d9oQ06yd+miicFyAyKeLJ3i9TwJ5yRrieD55UhaDDM1F1+O28RwgbsK/DJTc6p9TxF/A3/CCw1FMGCCdiIbwjv1F5hHh/7yZcQT9uWBmp9r+OmRTRR+zOnZrOVBPwxJ8xCtUaCFR8HeCOC/IOs83t0j4SsJU5lXdzJnPsZM6P+WcViSiiIhwx2+tqrVaAPiTZEUe0sdIDcVHjvc5yJ701SHreaikDG3vvq30v4ZBVtSHBfU6huzndO5qVnCCzX1uqmf+TT2T</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>5vFgmYTBsrRJaM5BLfLw/CBy3nWtnN3IX2l8QdvcfIyZRr5MQT287MrIATb1Wr1lrmgHM78C4rWszs0dHmJMgvez6PTOXum2xBe1j6sW/Ny6VLAAOv/Jz2Eple4vjcLD8bGPEggen7bMPudjtBIiwex/QoRDRhNC7wow7D/4OxymTkmh80xBua9fbDIj0v8W29uz72JFdmYl6nwkpraGxQ2tMSrO+19XqODcNUyic2GEiXAxf3oRfpPAVe7rRqk3E36IB6PWtaUZ5TGEiuaIako6A+8v4OVM1ZJkoyzy4wQ=</encrypted>]]>
    </text>
  </script>
</dir>


