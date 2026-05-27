<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenInvoiceBeforeEdit SYSTEM "..\Include\Command\WhenInvoiceBeforeEdit.txt">
  <!ENTITY CommandWhenInvoiceBeforeDelete SYSTEM "..\Include\Command\WhenInvoiceBeforeDelete.txt">
  <!ENTITY DefaultReportForm "3">
]>

<dir table="ctgt30" code="stt_rec" id="T03" order="ma_dvcs, ngay_ct, ngay_ct0, ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn GTGT đầu vào" e="VAT Invoice Input"></title>
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
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <footer v="Số hđ, ký hiệu" e="Number, Series"></footer>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Series"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" clientDefault="Default" defaultValue="&DefaultReportForm;" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" key="status = '1'" check="1 = 1" information="mau_bc$dmmaubc3.ten_bc%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" allowNulls="false">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <footer v="Khách hàng" e="Customer"></footer>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_v%l" key="cc_yn =1 and status = '1'" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
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
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="1">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="1">
      <header v="Đơn giá" e="Unit Price"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="1">
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
    <field name="thue_suat" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" disabled="true" categoryIndex="1">
      <header v="Thuế suất" e="Tax Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_no" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" categoryIndex="1">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_no%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" dataFormatString="@upperCaseFormat" categoryIndex="1">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_du%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" categoryIndex="9">
      <header v="Kho nhập" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = '{$%c[ma_dvcs]}' and status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''"  categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" dataFormatString="@upperCaseFormat"  categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" onDemand="true" dataFormatString="@upperCaseFormat" inactivate="true" categoryIndex="9">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="120, 100, 120, 100, 10, 100, 0"/>
      <item value="111000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11111: [ngay_ct].Label, [ngay_ct], [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="1111-1: [ngay_ct0].Label, [ngay_ct0], [so_ct0].Description, [so_ct0], [so_seri0]"/>

      <item value="111000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="111000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>

      <item value="11100: [ma_kh].Description, [ma_kh], [ten_kh]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000: [ma_so_thue].Label, [ma_so_thue]"/>

      <item value="11000: [ten_vt].Label, [ten_vt]"/>
      <item value="11-111: [so_luong].Label, [so_luong], [gia].Label, [gia], [ten_kh_v%l]"/>
      <item value="11: [t_tien].Label, [t_tien]"/>
      <item value="11111: [ma_thue].Label, [ma_thue], [ten_thue%l], [thue_suat].Label, [thue_suat]"/>

      <item value="11: [t_thue].Label, [t_thue]"/>
      <item value="11100: [tk_thue_no].Label, [tk_thue_no], [ten_tk_thue_no%l]"/>
      <item value="11100: [tk_du].Label, [tk_du], [ten_tk_thue_du%l]"/>

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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJWclYXHsKv/ILr7y6jNwhoRpqPi5FKLm9GbvpuY4iLsw=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>QCIccp844t0ynIy2oeGaFPJtgHGsm8AgsCN3Pwd12YOLWnIWMppdEUYlUfCC43JoQhIYKhCKQZHQcp5h3PhdAp/gcCqC3G1socDME9jS3BuLN0kfEzmqtKDHU8dYwW/H3FwR9G3LfJTF27PtjuZUIu2YExCItar5XFGdVf9soJu1tOsuFj92iXo6+NpU9IDqxDuxFMb7gVa/iGvMm1XsGrlcgVFdkcQ3lUJgJPMkKW8U4Azaseg2XuiOhBMbIN1RapwqXl9rgygTxQR97DiFZc7zhreGW2yG52qwCM+u15KLbTU+wgI98nNtsvuXJmwcMmz+ZBqJtWaY+hF1Y5/q8u3sx0xz9PS1R+SsaFlF27k=</encrypted>]]>&DefaultReportForm;<![CDATA[<encrypted>Uhi1JKKQmUsxebRjU6VUhPQAquJ2tKm2eUdK0bDfGfRDAhXdZWKRLRANwS9g8slSUDOxkjI9kj/gz7W5IUEAE2L/eL6TDkACMsxEZggnPpmxUglYSEasWZGKfhFqBpmN4V70dCR4j6EXgbsSEh0dw3yKE4jbkYG9zu9t0rKmuKVrE8rt3SyPgtLg+mRmVLFS9KhcVAhQKClcBD3L2+8kUCRVxukOsvpDnm/9qRcneTQMwcf7IPLtIErivJzTbtsLigmBVqFw2bh/g5HfWMfnljSZ+ayOaUbcNgD9eYiwjmXDnAbtnkMxcpiM57eN1B6EY0qNhdY+79qmDdKU5vYubyi3jTkz0zMKF1/QI0SdST6xXx30HGezdBlsS7Dsj1ryF+Q/5jfNZCHRlZ/8a8/ky8omICtzR+PKEevkLfj6Ot+uy+182Fmo1Wax4mLCwnTX</encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pnsnNJKciBAjHFMZqrOmqI9ubPRR1aGFv4KM/MqkUBXv3q6XHiXtuOjHjxrXPLhck</encrypted>]]>&CommandWhenInvoiceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbLeMz7pApiGsvtxMe00SwfquRW3gkXbTEkeMc80SiZ4A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>06egKlFyHJOX91OKy4L+PX8TlACTpCC6x13c1dOQ+sRk/h3wNkt8waKUepTZ0K8eX+voMF7AeFaWrW2yBXQZhjiSlT9IbOjMMn7nToQyUdyxGunUv8TKFIfIU4kuaA7eG1dI+yx54t4KNk4dt6U1TpSOQgGreen4HnE696YqM+8GQ6BJTm25nzj4LLqMrC7q/k9tM8YdGCzeG2/nV7fZNl5atqNoR6fHg2PrZy4uE3LRbyquuYorfb9A4bp28WAZJd3yuvl0X97eIV4k7XEb3m1MAoCUOX28Xm7eEjVtzl+8f9TRF/gYS9NqV5YiciT9</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/61QOH0jF0X+W2oxS3ZCvmZZsRgDnYzxRYiWqtxHdoT1Xuq+KjKLA/ws2nPffE9SckgBJzCJNc9bctC0lpE7A7WM=</encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3koTbtmu2o1v6969i/JExFwlRgSBVcrGsY5FHFsOYFogpuVfbghhJK7HVHTQeEElx4Ixq9fc6ycn2ELcqYIMBg+ejgccspMiD7jfzaTj7X975</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgNhENlnyqT9YuECNp6Iu5f+U5pfR0CVdVymPEJVs6h9bHTBDsZ+t8cRh+9XmrToTg==</encrypted>]]>
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
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlVlEKWfstHZDeE30j0MGPA+7tGbbhSt7/SmW0Z2f9Hxt</encrypted>]]>
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
      <![CDATA[<encrypted>Q5UAJTatffPAgkI8gC++74tYZtX2G6huF/Hwsq3T19mwSmkmY2sX031YDTtUcdq5QmVfy2244IwwaEBsvrzzh3EQZ4N/Lc9hZjUy2abI0mWZIWIlJjZv+y4NYvw3FZ8UVjQiurDMyh5l2jtn1nys17ECQ0sqMR8OEctjcPtHV9pSViA77Q0LjiF29wnTWtxuK+5fespz3UuKQhZRABj/8TquRUjn5wJftkVpWVCjMWwFKwxx9puQRt5dIXxwkGtQ3D+iZe0u2nJyOQuL4Ny3a6/KVAHgfGeHSC6p6K1M7KZkuJm+J2KnFoXSQJM0NdyRmEoO5CF0ZOxzZF8wqXNBPtYRLuRn8ojyt+2isiXCHirsh7npXRPwaK+tJKRxi6R3p9QoFhwfxqSNuTz1G1C5btMJkh0adRvZh5dDNU2tGJUwKGwbAce4rsF6ABnYj4Pe2ySp+0IfKuUen7x7SL34BvPrE9LWf6XnB+BwI3WFusg5FJT8M18Vztr+4E31tovtz/MJj7R/HLEmCvOzmuinBqLuEMX70zOTkSwODxmZYWvq/0mNDGEOsZ4bHu2VcothUdOC/4wDBCwG8XDs+N53zbgIJ9rMPYvwhTJmDrjVE1BuuThnr1os3W6qRfQJSf2bjVPnrXZenXmFhDcxU7AIkqAHPlOsQ44R8YXrUXrYVEmljIJ4kLz+aFNe4hb6X2R3dFY9O2VmnCKBPzVmXOhoDQQav2tfnmyPuUUR4hWlagsuuCw8wXrrvQh4A6LF4QgiFLSI1aqtnTyprxKYfFUXDqYSd7Fl1/Gd5yE07GboL0n6G+YWfJ6fT9PujlWHHSKr+TZmI0z+wK+Rpf619r3Le4eB82lVCtbL7OQJuf1sQELgvNS+klNG2aQnTxSuvUx84NEsoBdJshtW0B7X9LiUaDjwMxGpDeBs9Qv7UKRWyri5syoy7xfpGW0vdTcsXkkeEszpCa4aZsNwoVVEPhmAx9jwjiFllkHfvRZWeLMHpsVEjtOC2UimkWN5LNHFEr0I0/lVc0bCuovvYJ0AJ6mNfcFi1Yb6qHcvroVLkDJswGkree00nWDnGijKSyufTVOy2KatHWSRzxzAY2LGZ3WumBikflV6/KeYISzXYfr7hxHOC00LrvTJ5Mc+ix5+HNSt49ESzl0CydLE7jxFRHqBI0THt0dx8AF2258rKNr6th+ZEkzOciSep3aWdm7wUinOOQxIZygg1ScpGopH8w0Rb2Naem6BnzEus178MNB+8jo=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>vg5RKkgiqW+/8J5HvjdXcYQ5+7INbBE8dIwdHY7wOb8HvCMBxHdgSQ5dE2H7ThQ9fb4INZFCuUfZh5JuH1dHNYYvhnbxS2NVKvBDa8+YBIy3HaAfmyxgLG1VZ+mIOG1yf2qn/V6Fl5gHsarpNb6XKScy3VdP+07XzAl5Qqmfqadftnm+WcytfS89kQdxrdC0alHLUnrldqdmpYDVOCzfhg==</encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<encrypted>kCcK0tAFaGPT6CeytgQNn6VWESiYdsk36r6mvXx7u/2EUM50cylgWSlwUwk6kkoWuOC5HxFy8jjbM9UV2BFFwZNvWyX0AssXkM1WPt6r1repachGf2MhVGFWMbAzJKVR1QCMJVKNiC6shzZNgO8WinnYZWLpc+1uaL7/g6hs4L09GTHJicMYatqeCKRU09QlBYOnvsqFZXqT2JJMh1kv/jCd7+cwWGGG2/VPSPcQXdw=</encrypted>]]>
      </text>
    </action>
  </response>

</dir>
