<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenInvoiceBeforeEdit SYSTEM "..\Include\Command\WhenInvoiceBeforeEdit.txt">
  <!ENTITY CommandWhenInvoiceBeforeDelete SYSTEM "..\Include\Command\WhenInvoiceBeforeDelete.txt">
]>

<dir table="ctgt20" code="stt_rec" id="T02" order="ma_dvcs, ngay_ct, ngay_lct, ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn GTGT đầu ra" e="VAT Invoice Output"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Series"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_kh" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_v%l" key="kh_yn = '1' and status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh_v%l" readOnly="true" external="true" defaultValue="''" allowNulls="false" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh" allowNulls="false" categoryIndex="1">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" categoryIndex="1">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>

    <field name="ten_vt" categoryIndex="1">
      <header v="Tên hàng hóa" e="Item"></header>
    </field>
    <field name="ma_nt" dataFormatString="@upperCaseFormat" allowNulls="false" categoryIndex="1">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" categoryIndex="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tổng tiền ngoại tệ" e="Total FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tổng tiền" e="Total Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_thue" dataFormatString="@upperCaseFormat" allowNulls="false" categoryIndex="1">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" align="right" disabled="true" categoryIndex="1">
      <header v="Thuế suất" e="Tax Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế ngoại tệ" e="FC Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_co" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" categoryIndex="1">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_co%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_du%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''" width="0" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="9">
      <header v="Kho xuất" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh" dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Nhân viên bán" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" onDemand="true" dataFormatString="@upperCaseFormat" inactivate="true" categoryIndex="9">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 100, 120, 100, 110"/>
      <item value="11100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11111: [ngay_ct].Label, [ngay_ct], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="1111: [so_ct].Label, [so_ct], [so_seri].Label, [so_seri]"/>

      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh_v%l]"/>
      <item value="11000: [ten_kh].Label, [ten_kh]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11000: [ten_vt].Label, [ten_vt]"/>

      <item value="11111: [ma_nt].Label, [ma_nt], [ten_nt%l], [ty_gia].Label, [ty_gia]"/>
      <item value="11-11: [t_tien_nt2].Label, [t_tien_nt2], [t_tien2].Label, [t_tien2]"/>
      <item value="11111: [ma_thue].Label, [ma_thue], [ten_thue%l], [thue_suat].Label, [thue_suat]"/>
      <item value="11-11: [t_thue_nt].Label, [t_thue_nt], [t_thue].Label, [t_thue]"/>
      <item value="11100: [tk_thue_co].Label, [tk_thue_co], [ten_tk_thue_co%l]"/>
      <item value="11100: [tk_du].Label, [tk_du], [ten_tk_thue_du%l]"/>

      <item value="1110: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="1110: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1110: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="120, 100, 110, 120, 100, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="9" columns="120, 100, 100, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJ+td1K09umWQUxq4TmyFQsWJG2DBstrJkthumsXBVpDU=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>1r8Kc4/VxcP+8wftqRtIXX/j2vLDLx3/OOurkAQjEYfANxSmmVZdd+k6d+GHCpBsLbHgoACu+8lQ2WpYLFPFKrHQqf9Ob7QKtFrgOgYJpQFXZJ7GK+IrC0CDihrARo0orJjSir/QV7aTnMHhRKbMbQr6LEyxJo388X4bmZ8+AUgQ4ky/gXH51QT6CJNlSNlG7aPvQZhCNDBHLtXOTnvEcY4ZmXFycWi7iJ/T4rHg/u4m5UE2G+0lD0R9QOj3R5W2eOgi4cpBMRqnivXGpKSh+uj60fTNcZb64goyvjof9tLf+oEomJ/FVDQwssZwo25o3y18m4MOGLysyvm0nbk8GrzXT9wijqLt7EU+WeFIuvUkKeij2lZpmmwU+9SbHNk5uJt8JgMbLkk2SpZRtMv2QyrrS8FxgUQQ2rKpU8x8ZRI2yNabIsa2ghsKPgnnEgr3k4drZyWAZyWnYxDFy34pQjzE75z+l8/J3EghVj15FRBAgtyGFqH9eVhgMO0M+0OaWeNFveVspKXUv4JWtoYz7g==</encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pnsnNJKciBAjHFMZqrOmqIxTamFPrRVpB1qwaD8A2jxMFHlXUsMRfXfBk7hVzE95L</encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbohw0+XVH7BOKY/z7Bj4SDmSfhM9NKFFhH2Vp9xL28LA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>nfOrWXWvXS2vYLIU7J9Htgvfu2GMnU3gJkJXlLaw0lUF+sfbkjLbtUZ5UGtgMWwoduXgjR0vVBeL+9SlhQwW//cwpVaT7l7l3htFtqv7Ax8MV29mp7WVL8OmqUeEbKh3sYUMZLiPmoFZBNKuT2SKBkktiUyixh7D6NmSXYIZ8OTtHWflpEMH1umuzpl4H5+Ke8G2hZbGrUDKfWaiYiwnjjZDgQ5fW7F9nlS1vdQ1jiq7HSjZ0FugqjjJkTHHle1rN+71jdiNPOjuuEGxlFiUpYGmWtT/N5/oBYUX+LWibeAo+U6+SUt7yqkZN1zFWOQDY3KUzWEN3olib7+mIeKE+seH1cAoLbjBQylyqd5jSteaGT5KvHXtFqwSUr8Z4nBtlKDAoBwJqQRa9WuwHdE4Ug==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/61QOH0jF0X+W2oxS3ZCvmZZsRgDnYzxRYiWqtxHdoT1Xuq+KjKLA/ws2nPffE9SckgBJzCJNc9bctC0lpE7A7WM=</encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN426Z4GGl63yug3sSTg9YYtcaD/ICgRSVDYA5pWbmFWkNC7r0QsmfIkrtqoREONlRVSps7oUrv/YrkFfRzMpBZf6cryxi0my42KJjUv7TAxlSbZnZrZCwdDc0S2iL5ohaQNfIBaXQfn4uQvm3dbZdYo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Q/O+fVFRLGd75+jbZnwl/v3doFMSsiAlCSJu3/93FZUjxaa81YRxzi/fa0x3qMG3A==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>7FyOzUW4VP7rkRZsdXNoLMVNyOaQz9SL6zI+Cc9UD08JgbHYo/xqlTP6Ferwpwaxy7ghpGulF5uzI7xWbBI51jazxN/XAoFHaHiIA3CpxbwoA288G+OtLq/HK9eBSQJXSMjokg4Lnb34lzFTYhWX/aYe1Fr/U0d/hwma3eTZOqI=</encrypted>]]>
        &CommandCheckLockedDate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>WOPdpFg0oVv5+bk4uj2SM/0DTPzD89QbK2z3Y0HAlJ32DMS5JFoEJ8v2DvUkPdWBZP2VLJXjM0Nyt06yEf74MZPefeq4xOrKFn0w7yl9OSDBkzRZoX+yEPA4NOVYAcuP0N8ZSl1wHGhQQ32kL6MqoCJNbRPH2WATX2qhKRRBTNemngmItn53krPFgVDao5Sh</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenInvoiceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>fTW8C187eHLJK9ZKca5xmY6+zFY40q+45YWxsybdoWuICI8/srKlLTvKqS36QrM90CusEdIlhZekdQXGS+wqrCzmRmCDyRfLnW0xJrR/IcKvy3aS2smHwphCfzeVqV49OUFYxujRxcwNrq5TcZV5Oh+u3Va9QjE1iaBXOz0hx85vb/mAV5BmB9XNUwcNMhUGENEZSuz1O6jAobhNclIFhsImsalUsAxMAKP49AjE4jrTjr1CIkDP0z9iLD9UknfzC3RJKecipJsOVYkk0hjVn/NoIHmtk3VsBKhy3JU4LnJf7F7ZLFMljexcky83Jekcz8ZnHr2qlsPTuD5VufNblyowWmacqMRXCX9F8r9h6Zf24nyBYGNCRmwdzqm7UabDwjrB1ojOaDDhBKGriEm89042hWnjfkzSe7vJVLNGSMiKgdLuMNqRGQlobOuGgB5e/yHMY8ZYaVVSXiLh+SFYzul27z29JhXwzJwgu53sFNLhojwSJbpwEqfEUaiRXpZRSPP2fpUuAPiFenOTNURH4OX5UICytNGeGxDISh/pPg/BCp8d7Md83zdMgSOzO7rcownjkMCGyGRzCuUzmeF8OQHeINjiJuw5+KS/NmNEYk3rcMJ+BPBsh+cQKjYth9kVqbJt5MBk6twUtzLMUX31XeEEiHq5tpRzp93s+5tVhWnBmANtce4bayHtAYMtiEshZAoSuXVnp6e9BkxeNOGHQCibIrlE9ZARnrUmlKCEEU9fXug6yl346YMhp0RCRi0/q2WU2bicNPFh4lzfIqNjol3Y5h7ICEH6UMdDXifQYUEpYNKf1gg0a3sQxCncmTh2YRax5Ccz0OfRlyskStDHF3bakdQW5eKIEhK2BJMQXeJOpgdycQJUxCi4OCVf0D3U9a4pAz6MmGQMl4N36xB2hxkfa+Ff8wVJzv4nXyxSFS13i07b0/QfHvTjKG/XZWrL+gcyBR6dkrSMc4+9qokE/HyeqQdATnRP033BLEZm+WUAJtV1LqRKqpiJFLnCZac2iGj4hXOaJXNEmZVHvJDv2teME3Ah+okvIQR/A/YzbZGNhJ5YSvX/2Z82XxgxzbDzXHAmaExXdKcGzXp3NoXFM9mrsGisYAJexWQvNiWFnHH6gwgYpRBcq/qma2npaJkIIUChu3TDRacBcYWZFz2zSWcjCS0yrvTsbOqAORtpW4KNc4jpdqyD1Wn5eT+jKhylh72YhRTibfIiFqzesYFzEsi695op45lpL9Tixp36ieIbzCuRXuwladPF20cdsEChpv3iqp6MfYlZ+ZLIkYC4N4inQslPofinhxT5kXSlJ1bcn3BlCJblWNGqo7BxNNbKBQ/SjqL6chkjq7iw66co+IceTkIPWOIgLjp1vl9vUPabNuklVGXhe/R6Xz2kVjIXSbP2RqBt7GYrX55ADEw1bA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>Luh9cun5Ufmi+0RS+HL7M94et5xatcM6Y9KdpvczYW0HHsppf6z8CdKuWa9G9mOEax8rUMK4QCLESrcrPXKUoYfT+2XmfQ6FdibcuNtka0kmyhfo/2gUuun3Q1A/Lwtmu6FZktpMUrFOCH+zHGDErwQ5DAXfIgSydyXVcopLvaZrlMUldB9j//Bd2spukQoCwFozV3zdRLtTLZIVbUE0tA==</encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<encrypted>wFbUN9Bs1CeBadw0eoT5s0giFFwOCkYTr3WorWehpmWOwNNLowa4Oqqd7r0C853xvE3aGIF9brZlAe6+qt2sQQX8ahy04u2nKpH1hhw9F0NJ4c2nqnva3smW/Q0dbZdGWV5UmUEr/8bu3+vt23ICCAAMWzbdNJLneg6Wxc30FTJvbGGkJ5Fdpbf/d0rb6o3YsF7/fQNAJNufvtuTxNRW4dLfa/l/4RSaLxRY9o5Vfng=</encrypted>]]>
      </text>
    </action>
  </response>

</dir>
