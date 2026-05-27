<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate 
"declare @$lockedDate nvarchar(512)
  select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày giới hạn hoặc ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
  if exists(select 1 from dmstt where ngay_ks >= @ngay_ct) begin
    select @$lockedDate as message
  return
  end ">
]>

<dir table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chứng từ ghi sổ" e="Journal Voucher"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Int16" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yr5F8O4W4eoYLZ6ZXQIfk5XmA46uM5kEb739ZwB2ja1DGespAWdUcEEfUndRn8nNA==</encrypted>]]></clientScript>
    </field>
    <field name="td_yn" type="Boolean" defaultValue="true" clientDefault="Default">
      <header v="Đánh số tự động" e="Auto Numbering"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yr5F8O4W4eoYLZ6ZXQIfk6eMr9K9tUCNXSc1YtlYf2XqcueAAkKEFmJL1w58QDzX9GFMA6YO5B6Hm0Nw09r2kI=</encrypted>]]></clientScript>
    </field>
    <field name="so_ctgs0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Tiếp đầu ngữ" e="Prefix"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yr5F8O4W4eoYLZ6ZXQIfk4Y4Jjqk5Icl7i9wuJZsvxZHHDgMsMwOZ9ErEQEk+fmgA==</encrypted>]]></clientScript>
    </field>
    <field name="so_ctgs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số c.từ ghi sổ" e="Batch Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" align="left" disabled="true">
      <header v="Ngày c.từ ghi sổ" e="Batch Date"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ds_ct">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and xgl = 1 and dbo.ff_ExactInlist(ma_ct, '') = 0 and status = '1'" check="wedition &lt;&gt; '9' and xgl = 1 and dbo.ff_ExactInlist(ma_ct, '') = 0"/>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="0, 1, 2" clientDefault="1" align="right">
      <header v="Phát sinh" e="Arising"></header>
      <footer v="0 - Tất cả, 1 - Nợ, 2 - Có " e="0 - All, 1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_bp">
      <header v="Phòng ban" e="Department"></header>
      <items style="Lookup" controller="Department" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Job"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="loc" dataFormatString="1, 2, 3" clientDefault="2" align="right">
      <header v="Lọc" e="Filter"></header>
      <footer v="1 - Tất cả chứng từ, 2 - Chứng từ chưa đánh số, 3 - Chứng từ đã đánh số " e="1 - All Trans., 2 - Trans. Having No Batch No., 3 - Trans. Having Batch No."></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="##0">
      <header v="Stt ưu tiên" e="Priority"></header>
      <items style="Numeric"></items>
    </field>
    <field name="suffix" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 10, 60, 100, 100, 130, 0"/>
      <item value="110001--1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [nam]"/>
      <item value="11: [td_yn].Label, [td_yn]"/>
      <item value="11000: [so_ctgs0].Label, [so_ctgs0]"/>
      <item value="11000: [so_ctgs].Label, [so_ctgs]"/>
      <item value="11000: [ngay_ctgs].Label, [ngay_ctgs]"/>
      <item value="11000000: [dien_giai].Label, [dien_giai]"/>
      <item value="1100000: [ds_ct].Label, [ds_ct]"/>
      <item value="1100000: [tk].Label, [tk]"/>
      <item value="110100: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="1100000: [tk_du].Label, [tk_du]"/>
      <item value="1100000: [ma_bp].Label, [ma_bp]"/>
      <item value="1100000: [ma_vv].Label, [ma_vv]"/>
      <item value="11010000: [loc].Label, [loc], [loc].Description"/>
      <item value="11000100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [stt].Label, [stt], [suffix]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgcwsJAz1O5NpJ6lVnVoPTC42rDMmUZhLSI+0Vl5Q+XaazSXQUIuzHyQlx7Lna5S24InInERRAhD0HV7yRH3f50=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dDX1TUS6SjT6HFTfl+bMpELbSaQBR98F+O4dgSiJrKifj5I4boSTcDo83h2dBUhPkHlFKg3WSiwc9BvouqXJkM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>jvFmj907oEkAAKbpxt1I+GnCPQuyT8v9pN6/3OCHnvo5YNHAZQHajHHaxUAEpetZSgH/i3Oln16opgvT7Ks1N4t6EQXqVJcQy9Zkef/y7lMNLZOkdpcWF3y6pTTIYntNtFrNvokOIYvR4V1oGQzXh9TYCzIwYfpVjavSnr5FHlJfKY9bILVeCZ3hjvSGFe/HxVIyOuSoOqC/j6Pra+t1Pk+zdi9AUd4zAmDcf/CURIYkz7htGwPWWMAT6GSle691y26xSWY4+h42ZI+QjDChI5p/CnTQLs8LWUFj+SiESK7Qbpw0o3gFDmjc3pnTKSH7XfdHJfgXlkZcjcs0/bleK3ZPBd0o8WoEPgrEZaHx5gRkTQVVKgbW+hklqM1axQ1ymcKkfaOBKhOsnOUdfgl7fzHsmeFlgborsz0usUgeQaI/Vrxm6gwulxdMWx5ZK92j1bd2lI8tawOgMuo5xCwaXg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/6xKzMJY0RWmLkfYM9yIdAWDZYaRpQCJI1l9WQaMvW0NF3JaDQotZEx7HIk8EeEvD4ZcMi4kbD2aE/oVxrF29gBA=</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>pL1tTH1z9E69C8t8weeFGrBUkN6Mi8uMyregkg6r7bJY/zyHR4/ryvTanbLAVBif+UsZC5iJzzWNm8bl2o7D85dEK9Z17xHhASXdpycQZ8/mG1/IoLmnX8K4zFLBjpRSrWKSDaLBWSO7/leaKJR7Zg+J8BORF4jU0NwZ8i7a97Y=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F3TZXezlr/v97d8iD99QeWKGrjH0YJRlhchyEjyKr2VBXIejvU/Vfikx6XoIvq98MXyF9ysibgMeFAddUV48q+Q=</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>kLe6y5BaELIqxKq4UYTko+Id4+NuxQrU9xxUsObgh81bm4R2WV5krbvShoPoBXrgKTfHAtg1AM+wXq2/KFNGMLQ0YI4lZyTJPQnWyt8ISYnbVZjVLQt1cwveGAXvIbm1RgrS+RNPG3bMnF70BMRvvx2+ujnUOWoHm9AbbAj6sBTWwIn5O9KfYJf9FlCVrGJhupcsjinIL29i//RnIC0Yx9duLdBlNZn+W+PS5G8ASfyxDx5l0jShusNdWQSZ53MzJS5rra13ShakleZWGM9U+WApw4IXeny1jmUfeJg3PWs=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/6xKzMJY0RWmLkfYM9yIdAWDZYaRpQCJI1l9WQaMvW0NFNOsKYaVG1et4zvVpvJe5z6+LUJ9Cry0IRBwD+Mz2CPHNV8yEi08STXGBM+NfetzQ8Z8BXLPV+YMHd93HzYbS9g==</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4L/uh8asb+vhfYhqhuKgSkq9X0IopePPGrsKvTDjlknSeRQwGFSVCrbpAmwseBk92VaUdVt2TvGXyW8qtmREDPg=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>kZIZ5rEdn50XvIxvFJTi45RNwmkK9uFHeJs97xRfUfRxeSLGgRQ45BqyLwvMrJfsvEe05xLhwGsMvHk/2/8cXRbhquXhQq4xAAKn2GwlcQLS/YZinnp5gjwlKg3dwjcnI1lVCk4NyQhF8GQZfFt3EXy4RNTTgjvPqSbH2p/DPTn8UYEGX8Goq6ba67Cytg1m</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>LPuLPxDAppv0EdovdMIC8MClKos6CeowyZhqwGY8Lrg+ecggnqCXLsAWCpO/BS9laZmpW54DGx0jd1aD65Enrx6iOueHX/uB1oj9kVWmrZ/W1PiW13UlN8J47j8pFnYxHhxee3wiVEzNmkrgAyAINxFlNuxtKNh2YkdTHdNFbPmxkJ6nlnpHeiC+ioaTpfgMe4xwkokeeKgl/jG3076fSBZMqVUWEQNW0bTgJiHnxq+CZtfXdyV4beQuA1cg124Ujh35iGrypfBSh6zmFgBqwaFBja1v2bR/pJK4RjXQcno+Fnh0s4u3IqGweWUJPlTbQmd/FETmTse/63r4PZd//rEERP3ingphAAZEo3xgEVGz956kJjBpDmclpecCtWKcdckMyvMC8j4LGmI4JvuCdM58NU3WGfjMkdrI8Zv5ze8604DE7Nwqma5+dzJ2UDlbUc0pPL7A0AZJ5sDZzwWTc1rm32EQn3y8fF2KTlfT57dy+Mi5ESR4LrfKmI1z8rV9/w90PoZZgCQYYMz9Vfu7llxy2XQPfMvqc9p5JNzhh/J1a6ZlsAI7ztKfog1kdNGZ0XC1HIuYN5iUAjQ4p03w84MaLruEM3JygoOLTtVjqVgkNRGYC2DuB1l9yypWtl7kKQXj+68wi5IHTDRt6jZpfXLiNDfeUGkLon1hk4QS8AucC9Hwm3VlhR6o56GV2mo4CwgPPw6nvzZkuLlESXEcw8qo5Cn8DuXmaJJZrxzbhhMwlvKKGQteWpann4pHONURwM6wwnzmre3F4D0VHJsfwQA4nWrR3CWdcJXIPx2a6tI=</encrypted>]]>
    </text>
  </script>

</dir>
