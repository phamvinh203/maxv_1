<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d66$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PX5" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c66$000000" prime="d66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="dh_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Sales Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="hd_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá chuẩn nt" e="FC Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true" allowContain="false">
      <header v="Giá chuẩn" e="Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl xuất" e="Issued Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true" hidden="true">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_giao" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true" hidden="true">
      <header v="Sl giao" e="Delivery Quantity"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_lx" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0lx" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
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

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="hd_so"/>
      <field name="hd_ln"/>

      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="ck_nt"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="ck"/>

      <field name="sl_xuat"/>
      <field name="sl_hd"/>
      <field name="sl_giao"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_lx"/>
      <field name="stt_rec0lx"/>
      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
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
      <![CDATA[<encrypted>PXsDHithQdmCDqmt4np2YveZ3rNFnVnOYJymTvNPHtoQfVJIBS40WduUyEvMI7kwN2/IRooinQwX/gwk3zBUKOaLS5LepvP+ZkUmRAGGCJWoDbeacmlXC+OX5StuvBjnz7+jbX2U4bNJ/UtuZgInFRgkYeZQ+LoKLselc0dfdxlwK2V6zU+CkvhWdXC1a6+a0kjjhenzNL11Jw9mj9QLJvHzNzVcFO0QsI/SIo+SfDwOQf9TpRDAhL5zZlEgzDn2noqxWrC9dTID29JehVPrZA9xrZEo0bZ5+IZdZGOnzAbV064OnFPXbM7Y16dbhWaULFo3dothRKgu+q+zHBG69BcF+xZydQplPyBREHNy8qs5Z+ND3iODhS9GdNooCia/BX2tHPDiWv13BmuaiH1xKJBGJaOLZR3V20x3zARj2OpEtueF3msftzg7LM6z3Jid67PFfpMS9UWWf6nxSdFtgFOOxkxgwKpZKHyvD9e9PIraJ11FbKxoR3szXfWcrvzpJF5J6RaB1vWDxp8uobYl2PphpfENNHR/LP4ctRcl68RL+Q9+tezXF62hMCuwStK/YRpWxVCBPkN4yv9yjx43cAW5VkAUv5gOAS3DfOoZRPMizx/pEqC2FCWMg8OHl83WojPy4gSUJ4f0hie8Le1TCQ==</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>HfosbCOrSp384y//qmaiGm8757bJ+8DBZFySy2iMNmZE3sJOlGdI9UCNGYJr7zo0tPieF+p7iSCGhu/9eKkpIS7BtvTjH317MqaV+H4qWvZgRLC+RJQJOJQNIIehmc1DYf6v+kLEmo+/g00up9lntfetUddTFzBgPxRqrnAKi/7LXcltNYwWeS9weS7PNPbQ6B9CfAex1U3BVeSjq/CALK/a/Jb/QFQ9w17C3iihRAVYeDfumqvR6GbFiSFIQKldLVMiu6sjFXiZ4hVj7aGROKjTFEG/4aGUUtUuxwlwksZsglRkjghCwiXUxeeRnxuzAsb/64bG3ctsO3WuKVp+Jvuv2TaXvVD/Q8j7GsTiMzFc7cERgblP69b83vuXyE/YJbCEvCu5X98jmAGmfyYVv0bsj9WfYgsQNlP7NF84coKP4lI/xk9oK10l5X0FWjEVsOmBoY+KEb40mRIy1ObI8Rii/w3rRnQFzVVaQMpSoshIajqGMhGotdCDBJvGwnk42c/l4h8awbrcsX7Fg+K95TpobSmLYv1tUyvxQO5QRor5+fKTWq8ueKW2CrlsiKF2DXY0V6ktKCcyP67sHaj5ozW8H+g3Ik2Fu3QTFc7KadgM6fkzL2jDZo1mkL4hvflnCn43/NoTZ+tjxog5SpNilpEfMJ5nkv6rGGgJ9s4K01RMtvl9UocjyZxRmlbCKAABHde4bAerYpxtXQTR5PjaZpUGVjuyLkpfaw1ipVG5SYkI+r7QNli6mheaY+v3hQuX6eMd0l0pO0r/MD5ZZTRJQXLofcIeBFT7p24D/yB7AxZc4oNZqYQDT0VdCARX59oJ8BFlXCImYwOO5MPHDsBikQf5ic5mCgCtAD1AVeO9A2TWTqAPVF3ztbBhZRCPOA8MRxdS9+my8MaxGgdiusIlIZk0mutl5FwE96GbIaWolLraPuGriCCpYKP93NG8+mFGAo+s89lkEBrDfshKCh37vamOnnNiPItOVHY8T6su84FCKDU463PnTNvDa70vBvyxSEK9D1xPRL5qXC6fV2VgLulPuyNUwS+Ip7lMTAQ2Mx0qZrpBoTQ4YelV1nuZ05h152ee3x9uToQ3cgLr1OQJlNU/drpyeibuIqEFxPUPB5C2JGGDG/nbIuZFodUALQZi</encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>RpcYx5+3xMP/fsXnO07lbD6WOJ3+ruXOXKvErss4nP4kM/G4sDD/E9C/0sJ26JwN/o5SQW07tCvRaxhfoWGfBxnwz6owTz39Ud51QyQeqpybF/8RYD6vtrFCDZ2a9ZyC4/NJiZLYNNdIghIJIAKyHNdZdvH6PnCPPmwzPFwJfbchqIGYNHH1LDXkfMZnlE+GekkFx/AbaLdEwDtauLvwylU1726oxcefmbVe7v+GgCo6iswHVNCqHBJdGgjpZvEuKer9soSchvy0N/wwLSbkZdAiOeX8f1scE8HVk1hJWUYK6EYkU4k4zCG0IpqkIKtb26FynJt7LQ36qDZDFDDdalodgGJRGtPD3f0h9LlwoVc=</encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<encrypted>9csMo720n8p+McPAWsbSGFQ8oNBU1il2cFxPhR59+PqsrbS8SIdZjJBV7XdwiCkCoJwRqES9bPHlwCofKq46uT21NqByZ6A/0NPtL340jxODHYpSB2D8FcbMm3PsOPXIlxEGQCK9ELTwHPthBII8MRcxJvtGiezkyopcoqWHFkytUDhdkL2QZwmd68i3YtIBq29vtwQI56vlfHCUaoXYmOxCWusDEHr/BYpWwYNdDnUXLLvun5zwr3XHxKEx1F59CPthjAlCbJFWWgL5aFYTTskeDlIplPtW7a92SK029a3dTXMOJhQ6kXpY0boXwcODF19lvSvZ3j22rmNS/DnBVyUYLi2IAecNHk4MHRojEjBTWLZ73X37orNOp3crD27HziU5ejEb2NKhbahf+MxyXA==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>75uM+N5tHe5f+jPgKClOjYJKmVNnVC3a3Akm1qxIY6EW+QURb5mLk2REIeMLoLMd7qVGBF9boXsfDi56Y3CXFG8jKPjqlMU8U8xaEYBIgrPFJm8uvYkypOjdHg05rs+fqA4MYLw9LAQEpZQPp/88v5XTh3mUs6mKQHEQ0ys+uhJXMDJNpWIBcNP6KDgvjYoof7JnMKIfcEoOvk1hVebI2jZmdWuotUSi9j0U8tABdIslWuC1Shom5UfeTO8xcNj2zXGoS6Kimfy8wwbe4z+XR6JUcDLR6i0rgbWB4+yxBmd8IZw8qHVULrwOdDZ2dcNdNCdVvslwLWmUUuO10v7K/L52aGBWm+Qn3NYNHi7AeIE=</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>zpZC2ocW3UvMxszqelE90zUdmPAfYZyR+VVK6TfsJifefEEQEq2F9lkXIrUBtpW4lViIs1enJxlSefOZ5iqpvXKRjPJtFJNHm0Zx9ETghQj+touHWx31/IPHGL6iHdZTn4CSTa51PePeDqWKaBW5Vy1Ee8CxMTYDc2iTVwVdliSTZBnw9AVged3G2u+6qkCvtCsAes+cBYDEXkovhbHjxl17DMOLhtfeD0+s4rH+C2H7YLv5ey1Yq6Xd56o4ZI6fu/wH8MWR/ucfs941JxjoevcTi0gQI7rGrG78Dc044VqvONsWyfWZW2MR81V9Nqox</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <!--button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="40" urlImage="../images/Menu/Invoice.png">
          <header v="Lấy số liệu từ hóa đơn bán hàng" e="Extract Data from Sales Invoice"/>
        </menuItem>
      </menuItems>
    </button>-->
    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
