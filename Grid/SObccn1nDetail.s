<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.MaxvOnline$Function$System$Split(@@queryString, @c)

declare @ma_kh varchar(128), @tk varchar(128), @ngay_tu smalldatetime, @ngay_den smalldatetime, @mau_bc varchar(32), @ma_dvcs varchar(8000)

select @ma_kh = replace(data, @d, '''') from #t where id = 1
select @ngay_tu = data from #t where id = 2
select @ngay_den= data from #t where id = 3
select @tk = replace(data, @d, '''') from #t where id = 4
select @ma_dvcs = replace(data, @d, '''') from #t where id = 5
select @mau_bc = data from #t where id = 6
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Xem chi tiết khách hàng" e="Detail by Customer"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tk đối ứng" e="Reference Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>

    <field name="ma_nt" width="100" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dư án" e="Project"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      
      <field name="so_ct"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9IUrUGv5j2JSirzFnO25AhcUP1iE4NGIoHB9k8f0z7S1X2TBaXgPBdFyJ1ZiYMXwYOvxNKsoabi+Ino8PN8xuz+8OJ7sAG0vhF4n0+4f0Sk/KVyDs88mp+AyV6o+b4C1IbmEDx7GI1uuTC32AT5S0CtG0fA2MV2mUCQTjHCoKI6wmkXZ8TELSl5oC2fDcDY4JO/uD34p1cw9MzLLG+fG9JynwWr8f9KVL+UkhYh1dMPFeXKq4eXS3z2CahbLQ0avlii0LgFR7nTjz2GWLpXtNyhZHENx26rFuuiCt3ufsufR</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>QgWBKedxBcnp33dgbOzDaJv9Zw5UzFUOLvK6tvNW0qpPn9bz+PpxSbRZnrDXcJHB9aYxHJ9kD88x3k+Tkg27ATLVKhJjvd7/sx+/661Wmzm3k0IW1DZe9dFi0u0clGgeyrNEabkh57Lh5JA332ry8CPXgAyUrH6qqFNIiOzG66wMc2aMlP9y2TsP/pdP3+qRZyBy/DHEfhUEiqnoDbFBTpfptloeRwsf9DIzDHeYmEJSbxAWJK3pTE2rXzcHD+j61dQmr6Alx1YVd1IQZM8JRj1UMZ5ibFFqgsBpFniUxjkH0/0FSJise01CKY99jpemHrCUu6LOBFTBq+7nn3bnZRpRBRPC14u0LYAOugEOrkAf0Ymx2o38yCw+oDg4JrVjGSch7j/OYXd1zDYEpwhL81wlNQM/Qizb17NWmyt7LsYHQNa+XNiqXHVAun9xTNsY</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>wQuZHyfk4GGpY4KUeI7Cp8fPrml3FVWdA8HmSlI537+vOuwDlPa2zrIuTLr6FET8WHzKJ1sTpYAGeDLJlNbxSy2Njm6nSUAwKbx3gqSHuGdmb6+6cvScnmAePZsn2YIBif3wKh5RV+Y6o+c/Sgifyrogz+nrHRa0O/P5cjiF29K2L2tVwW9NssjxAmzmg9yOOmvF7uZ9OJEBhWirjz4pv+KFrBlkBWwybdrDmjNc2snlRrG/3Zbt/TK+4emCP1ZfcuaWbDMve05loK9w0qvkIHmTctR7g9VOpiUtivP2eiFMueYLsIa3/AbmjIgc9C/bF9yen2gIXNcVhNEmtOo5mKVYVUdn4t4seEGiAdzp7Vk=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
