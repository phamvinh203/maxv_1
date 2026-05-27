<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctpbgg" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctpbgg" prime="ctpbgg" inquiry="i22" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" hidden="true">
      <header v="Pb tiền hàng nt" e="FC Allocation Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" hidden="true">
      <header v="Pb tiền hàng" e="Allocation Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="pb_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" hidden="true">
      <header v="Pb tiền thuế nt" e="FC Tax Allocation Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="pb_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" readOnly="true" hidden="true">
      <header v="Pb tiền thuế" e="Tax Allocation Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vt" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0" >
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" aliasName="a" readOnly="true" >
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true" >
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" aliasName="a" readOnly="true">
      <header v="Tk vật tư" e="Item Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="80" aliasName="a" readOnly="true">
      <header v="Tk giá vốn" e="COGS Account"></header>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_no" width="80" aliasName="a">
      <header v="Tk giảm giá" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_hd" external="true" defaultValue="@vcID" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct_hd" external="true" defaultValue="@vcNumber" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="so_seri_hd" external="true" defaultValue="@vcSerial" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct_hd" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="@vcDate" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="pb_nt"/>
      <field name="pb_thue_nt"/>
      <field name="pb"/>
      <field name="pb_thue"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="tien2"/>
      <field name="tien_nt2"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tk_gv"/>
      <field name="ten_tk_gv%l"/>
      <field name="tk_no"/>
      <field name="ten_tk_no%l"/>

      <field name="stt_rec_hd"/>
      <field name="so_ct_hd"/>
      <field name="so_seri_hd"/>
      <field name="ngay_ct_hd"/>

      &XMLUserDefinedFields;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ktjRZSsAz5fFJclm0HQtJK8eIk4H8H2N0JdEffTs+H7FAMj/H1a1x/IqOoOZUUCYNep7HWWJWu02d3MxoplfjYoubEAe1Y5eJ+Ta/qDTxcFv</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>rHRSwslZMic5Lbl3gFjEhXx138wjkNd5gA4syWQxloZe+HmT0WsxrKxKVQD3QY92tjfPJDARR+FOAAe82FEbZs58zko84bFCKI+FUwVtmFSAlzs2+XJoAzVO62nvtUu1/I+t3KMkLZl5P8sqbSRmumfocFSBGyJ3g+DpdF3pkznQ4Et14lX4c+d08+qQrfsJ0WJD1qe1oz1YDLdIMD6M1YnoX10bIOhivwqb2lTScfcxeUMLk3vp4Iif8Y8xR/vT+u3FtvBfJEUGSWjujCr/AUGiKcokowN4ch/58MCqJq7780TG+wcE/cJemVFWhRI5WpvX/ae9dYlcTkgHR62HTkstCDROd7tyFSuhT1j41fjAJ68UWFuCb8VcSFpDXAbc30Mpp+F9xAo69zklHJ0oHeq0WErNr5EgoHrbVbHYIMQ8W6QQLs1VecdZPe2wWCkHaNBVp19CI+YFW80dWU2PWhWEW6RoGKTLPDAyEWAUdhkpOSPEWuaboF+lqbg1SVNmzYL5BqClR0c8cCsT82xFIkxpLEtWQ7vWM8YrQ8nBtOSrSHppGL+tAHXB2x1/q5jstT4e791tGJ/BL6HMjRborLkFgTc/m1mFa+rZPo6WWtXYN52GBkZCaJEalFLj83dxnRfkz4+uYu65FXnB6tntseIvNi59osiCwYreQUwXAKLWEPzuFMG87BjM0eQaOg7B0ez8RKEQwCWxTxdCxbue8qtLdMMojnRuPm2U/lnxDWdn16ofRiG8WGnhuwAN1EaSzswu6ZEKC0OSq7TJIPYDFIbQ/6ic6YWejc2gSQwiOsV4S6yABqFxLjU1YAOCRPuOAWpz5WbHu60IKH+nRTHXEbmwuyuy2HJkwx9vPiHl/hDsxY0M9cgDVse8m0KmQv0Oi1oh9Hasv+n71sKi8Fq/2Bm4TOLFaCkxe2+BqIaRYbDsH9J6vjuhp6q55UMnOgHsX0TfbSL6qgIMn8XV5YOh1Q==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>Uq1qWmrPglkRlmMIlQO9XHepFGvMjxwoJ6qkybcI7HbcIovDZdbQqnrgmnewwnElXvt7aotEd3ibEQIcI2M0nbQe+89uIqd1rCTjw9f5dT57qCfRsOhBcs+SjDI6+caGQc5vBMqknDDHoJo76umBlurk9A48aMoE356qNMJlQS1GRXRYOZ8VrDMvKaRNPN3OKRHmocXN6QjqrORN+J57N0gDWiOIVwZ8kMJQEIOLk+IVG+wH9GKnyu+vGq+y8WozZPU9OZBzc04RH05EFMVXkXItn9JvKgaVQNg7UOH00gjfH5jf0WWT7yem10ljE38xNj8dIR8EEcFKCX4SuPlcDXyz+YN+E7geE/K0MHDM1R4=</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>x/xks6wQiETvyd5meiGgnn4C+pXFSFJFBnTeMMCUbnQz1oPx8/YAcDcLtxhx9tSytQm5nPzgHktgLFwikwn17Qx0guPIhtw1aYiTdG7UPmOGg9xxHmWxbqQ2V1N7gPFadgS1ASvG8eu9WVkEszgHIt+v3vmxDHypKWpFQpjasNvqKxjoVnHLJIvY696zq1jFlmB/d93ehNqUBlBnTga23qiefsX+K0FxJ0Ov8AyYJewzlODg6f1RdiuX6tRfkDr0V3KcPXQYDGsBKrt8d3v4rhMrohAisxjOmQqYMDsT9xpyKgGCfQCJVjhr7ESk0hXEg6FVi1Mn8xxfYw0A6auDsIstx/YuVUnnwFf/qCh1AYTqw2OK9tr2/i/iIp5/MC0g398Z2mNJRU6nvbBta6O7cpo5BPB9b8iTmc8vMgkm+sw7hYdKS6uK6Yu3wHyvSIk4n29hmyn3g81wLpFXvd/IB8BBX5AwK0dK0mnnAmEsvjASgAJDabQJQCpPODA3eZu+PX3GSp3PxZ0jx+dXAaL9O+nN0WWfZlhzlNFBYSMOgUYIzsS/U/zxX7I6Nwgg28a8K32vwUSFJoMtxGVp1v1QMxYgre5TQSkEaWR9cMEW1H1VOveTNGwXrdH7FG5+gyPliB/ETb+wr/ffx9B4qyyI97oB++3ov2rf54DufCPyzg8OgcCfcO5waq8Kbt7qDwbqTto4aJfPEFd7vYVhAu8PYg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Search">
      <title v="Chọn hóa đơn" e="Select Invoice"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
