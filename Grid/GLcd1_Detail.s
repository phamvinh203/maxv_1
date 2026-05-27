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
update #t set data = replace(data, @d, '''')
declare @no_dk numeric(16,4), @no_dk_nt numeric(16,4), @co_dk numeric(16,4), @co_dk_nt numeric(16,4), @ps_no numeric(16,4), @ps_no_nt numeric(16,4), @ps_co numeric(16,4), @ps_co_nt numeric(16,4), @no_ck numeric(16,4), @no_ck_nt numeric(16,4), @co_ck numeric(16,4), @co_ck_nt numeric(16,4)
declare @ngay1 smalldatetime, @ngay2 smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @mau_bc varchar(128)

select @tk = data from #t where id = 1
select @mau_bc = data from #t where id = 2
select @ngay1 = data from #t where id = 3
select @ngay2 = data from #t where id = 4
select @ma_dvcs = data from #t where id = 5
select @no_dk = data from #t where id = 6
select @no_dk_nt = data from #t where id = 7
select @co_dk = data from #t where id = 8
select @co_dk_nt = data from #t where id = 9
select @ps_no = data from #t where id = 10
select @ps_no_nt = data from #t where id = 11
select @ps_co = data from #t where id = 12
select @ps_co_nt = data from #t where id = 13
select @no_ck = data from #t where id = 14
select @no_ck_nt = data from #t where id = 15
select @co_ck = data from #t where id = 16
select @co_ck_nt = data from #t where id = 17
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết tài khoản" e="Account Detail"></title>
  <subTitle v="Tài khoản: %c - %s. Từ ngày %d1 đến ngày %d2..." e="Account: %c - %s. Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="80">
      <header v="Mã đvcs" e="Unit Code"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field> 
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>
      
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      
      <field name="ma_vv"/>      
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>Yv+dl5c8zZrP4QEq2/2ne9oyMF0Ptjc709/ajcsBCQx5Amwax7GII102g2ny7z+CGYMWP/zgHm0CaV0znI8azDHzO3jdegB7X7XiQ1PMfKukzbz5zeqkweQZObyfK1aStOcxpfA1PU07FV9DhDEMLAgqWmJ/3EYeLbdPtvnPFDcu7yERsrvVdngqe1xHF87QVWD188aWvWK1sIvpnM/xuBD8N5UQz0AapewNzlJ2KuxyqaZ73fY/WDqaJMDT2qebqz8EtInerVmTzsMZNq3uB7/tjwl8xhe7OuIgmeZ1sU9OmonzKecuXk7Tcfro7WW2GSHpaXRxQ/eJ2SGPl8dh4w==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>neA40WPNjs12Xn9FlsxlbrKwIHlQ7+JHWupgRjKb85/RbtbnOGiykwbms4BCxei7fU/T8BI7rPIghlfooajnCNerzDZ96tKV8gu6uh9UEbt0lHimFEkHeKq9DK1TN0mc5JSQNtPFjgsGYRgTj3rjvN1fkLKETDaeN2/V/81abI5vaU6MboZxS3ycqhZbcJhKelVXVtYs4IJe89DJuvewqsCp8Hc6rhisIGG+6FSe//VTCldw7u1KAaUPukKQPBzma9wWAk0JOWeY8yuXqFwpHxMwUwKQw2t+IzOIda08fvsG37V6nwOy8sjgzoINyG/eaIBMTyVgowwwbffkKSWvRKp2xEC6MdNjpTIMNDwRjb9UjLQK/f7MhMs/9ycj778I9wGzc90WdupSTQYEeez7XU1EFSaSTWXDQEHL24ziBUiOPjXjeDfK2FpS9AVzflTq</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      <![CDATA[<encrypted>RbA7EyWK78kxyH/GfPjiJydSgWu1xfOLE2gNQiPTRwBn2cuPVevCV5V7H8Ahasd9ZMKf1w1xEx27FmGyHOdfqkE95vBsukhpxZGV89dRvsrcTtjcoq4M5rv9OLgfWfzV3JVlfvbznuGUt9zaRY/UmibP4AzF/yHSO4Uf7Hi7IHcg2MBlHGhqHEYeIJrdyQSHpDS7AOLS/a5IoVceV4LjcKNjoLwW4XfZJ1VZtBHwwEzpzEwtu81TflUAmLWsh1ylG9ozekcA7sGARf1HCbJTl1I+NOpxmWLR+WR7TmCYGA8k5Q/rHLf2nSGEC8Cx37g81Yui7M/AIJtTOfFitkFN+7gZFurxN74lqKotIK7e55eQiWDI6zTREaY5IDXfaiZsIGiwUPTE3bRuuKodPZVs8BNZ0UK2hzUVh+0tWYt6hZCozcntFo8FMXG+ucBrSr8KuuOgx8Skifn1glJU8o4s2/NBug83IiU1V6e2BDTb+54lNChrLKxlechNob43KVFjbNH9alvTB6E2ZSWDd78Hzsxq+YTu0npPi4BqYc9hRPAFCoA9P0894MZbixoRaz/1XAXyREEnueUb6aOb6EIBxgKMXIZ7RS5l49C+wYmd2pIDoHPNJ519VHUAm55B4n2OOxvVSy/K4OQotifvgNJEOpY7n8rqCy/+J5p6Xbxn5ATZ00aGQo5Ug2f0Hb3wohKSfmtVSW0Tz+So3FBrBNlTGH2e/Tf1Pv/DTRTP6L7d/iJuYhA2O1xf3hPGGSamQR4skF85gsccEVcEtuNTnr+dyVHBIervWFI7+/b2QYn8YM+FXB+nZkIeI05ZsLHvaGj8Emb9Id4NPrFXdOYzEmafsg==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
