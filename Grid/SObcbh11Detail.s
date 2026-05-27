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
declare @xDetail nvarchar(128), @groupBy varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @rType varchar(1), @rPeriod varchar(128), @Count int
  , @reportBy varchar(128), @type varchar(1), @unit varchar(8000), @form varchar(32), @dataType varchar(1), @voucherList varchar(128), @tKey varchar(128), @revenueAcc varchar(33)

select @xDetail = replace(data, @d, '''') from #t where id = 1
select @tKey = replace(data, @d, '''') from #t where id = 2
select @dFrom = data from #t where id = 3
select @rType = data from #t where id = 4
select @rPeriod = data from #t where id = 5
select @reportBy = data from #t where id = 6
select @groupBy = data from #t where id = 7
select @type = data from #t where id = 8
select @unit = replace(data, @d, '''') from #t where id = 9
select @form = data from #t where id = 10
select @dataType = data from #t where id = 11
select @voucherList = replace(data, @d, '''') from #t where id = 12
select @revenueAcc = replace(data, @d, '''') from #t where id = 13
set @Count = convert(int, @rPeriod)
select @dTo = dateadd(day, -1, case
			when @rType = 1 then dateadd(month, 1 * @Count, @dFrom)
			when @rType = 2 then dateadd(month, 3 * @Count, @dFrom)
			when @rType = 3 then dateadd(month, 6 * @Count, @dFrom)
			when @rType = 4 then dateadd(month, 12 * @Count, @dFrom) end)
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết bán hàng" e="Detail Sales"></title>
  <subTitle v="%s: %c. %t, %d2, từ ngày: %d1..." e="%s: %c. %t, %d2, Date from: %d1..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="c">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ma_kho" width="100" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
	<field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_nvbh" width="100" aliasName="a">
      <header v="Nv bán hàng" e="Sales Employee"></header>
    </field>
    <field name="ma_nt" width="100">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
	<field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_bp" width="100">
      <header v="phòng ban" e="Department"></header>
    </field>
    <field name="nh_vt1" width="100">
      <header v="Nhóm vt 1" e="Item Group 1"></header>
    </field>
    <field name="nh_vt2" width="100">
      <header v="Nhóm vt 2" e="Item Group 2"></header>
    </field>
    <field name="nh_vt3" width="100">
      <header v="Nhóm vt 3" e="Item Group 3"></header>
    </field>

    <field name="nh_kh1" width="100">
      <header v="Nhóm kh 1" e="Customer Group 1"></header>
    </field>
    <field name="nh_kh2" width="100">
      <header v="Nhóm kh 2" e="Customer Group 2"></header>
    </field>
    <field name="nh_kh3" width="100">
      <header v="Nhóm kh 3" e="Customer Group 3"></header>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vt"/>
      <field name="ma_kho"/>
	  <field name="tk_du"/>
      <field name="ma_nx"/>
      <field name="ma_nvbh"/>
      <field name="ma_nt"/>
      <field name="tien2"/>
      <field name="tien_nt2"/>
      <field name="ck"/>
      <field name="ck_nt"/>
	  <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="nh_vt1"/>
      <field name="nh_vt2"/>
      <field name="nh_vt3"/>
      <field name="nh_kh1"/>
      <field name="nh_kh2"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>P26K/I8lvrzgyALfukIexseZ4en5idkO2t/UNczDfu4WkYbyTLghNu1GxKDIIjKn8U4Wjg9BtOSAx6cpZ7g+/EA/t5ND7ik2MtDFDb3XwGXSVbKQsVcYkSIW6u6u9brK81nReZCocBE/vUnOT5b3lhH0F9QJmENeRv57wzTg/9O5SiNmjqzxZmE2786OnWutSYWKP42iFNhVGbm6pLzI+BgIQ1Y3UicUMkR6n/FkX/Ad7t8vF67MMEnaqeMcVvDms+VokP40Ojc5VVycbqBQExnI+nCyt/LO79yDX6t+XnDYY730oXBR23tUA2RR6WoqLwT+h3+cpscRx27S3KtSSuauxDq3hgQMKP9vuY4d3utpuDNlNXMcc5wYryf721Hbh4GVirDiOYv/iGOtiN/MVWpm/dbPaW9Ulqb2XWe64zSOBeETysFVnTVGP5MjnQm8Ydf46fbd2CUSpVzMFtwbbJ0Z5qo74Hn19juEz23JzCg5fa8np/3G6MNI9sJkfTeoVNYL2/MXqtk12GC9cLqZdCvCJEkYFxR/oCREMbM55V+y+hpnRTSZqdVnh8Mezw5NZbrToPFH0OPvdDaLFk0MNotXnjXMkQxtZ6VciFOMpyMk1DGAi1e4c2O9XQXXyrpM2QOUbi6XH/5+xbYrD99fSA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>Glmr5yidovxUCU1CcGqM6uVTpCEFEFfu1H5EXJeKl1BZBDaWezBZUFG0Mk9ixtKmgWrriCIr375BiNp1hgri9cN/5mcbUei4n5p7iAeYDbHoog6mZzSXDgYS/ZGA9FG1CKNxZz80OkzYrhWwYn//BScyf1liZXeBbDRwki1M9rTNF8l6r6pi/4HVrlvQh+HrH5snYGjq/JKAIGg/kYZ/vK6GzunbRmeKKqAwV/PQDcJLqqh6sh3s8qZGfhlAphBxHLEgOg8KessLpPfpv2heS73ohdEavSeWM1r0d9i8SMkS21P+o+C0VHVK4FyI0+eYhztZKpIj0LptpWHlf077+f2AZFEG5SUdyj8MAOA4zdMgW+mX4YGO2jWipY4QfD22/n8xQIcN16wv63EfV/QF5TmTTaTbfkdGyfnVWstklS6cRiWvi4Vojg+NSQMU/EEgRW5SSM0UXo5Um+VPJNJr3OIuEJ/6u/qegD7megCapeh6cytSGCfNh0iYp22kL5UgzjILVRcki712a7Jf1sWvRWVKAfxuz50Qz0oNYuxUh9JP/aJTcplxNhQxPh9+oREp7VxPb1FIsHWXiGTs1SgsOFL0zolv+WsjlbUOPdK8WwcMta0JRXIGxmtS+pgyb1anMVFaZi2coi+QsiST6hBXVXVXqzXDbGoHo/kKXtQdIG8NiyA4Ea2Ff5jJ703ByiPY5LHSt+7hdZtxg3mJhy3BTHyzcohU0ygJZD/O2Rdkj7RBlkfXJMJ+cNZzyFJyD22M</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>AYUIw49NXfEi6Wt0DifX4AN5IZ57dSVvpMupEiTYN1artOJivXz7zVCRwhyPPdpz5eSTFE2OJssWEziVJnmD7IfCsBL1C0zKp8CoTThyfJtFbwy0VWIKTNTW/lL2vXRsmXC/iYRvZoIQbWOhydJT9xooUpWVjWWmeFHbUylVAw/sWlw+DgbSK0Sif1YqO2cM+gsQa9krXV/GMQO3XJrqGmY3kMqdK9DLGO1w11uamwERB+FeEZQf5p65lwOWZQ4jhx9IHaeD678vx0Pm9LvmZCZHg71axta4Ns55th9YlQAciKu6YOLBDC2YJ8ccob3YEY8xtAYnh+IUJSOqeF6Nj5UcxFtgtO5JUHgO3X0xoMPCei3a7f1YjiUOFZG72jaohxJaPUYVQfm4YC21YI8ETZa/sTuNAlvsUZitwY0D7QoQISJqNozgIrAfY6Zx/+2MZUhKndgvIXmx6YFQt8je2Fn/0BRCCWloMWumLgQcyd/lQHgQLk5+6mc0WE+Pi3myybyzd9E61i2ObcNbjyJWHoLKubEcN6Hi5FO9qG49MFRNPnrCeyiPZaPKzVqF+miE2/n5Ziwnt8JAgG/UKMg9rihs981KzDCIEOfPuIT7YwbO3szU+hdjXL+/peJy4FOqmRvuIsBQ4aGAA1YOk+Wd2gkgQWP8QjxxBX2ahVHt4gtyosC/PKvhuSxcyC0ojjC2F8tVu0eGmVRzsPRvFEsfpZW0IYL4gT6MtvFEs6Uby28=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
