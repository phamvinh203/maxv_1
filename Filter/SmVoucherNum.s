<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42C9QTnik7YRFWaB5WCR+mELNGWRmJUV9smfhUGm3i9GtU9UpOtkvTUdYVsmDRowAQ==</encrypted>]]></clientScript>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Theo chứng từ, 2 - Theo quyển chứng từ" e="1 - By Voucher, 2 - By Voucher Book"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="ma_quyen">
      <header v="Quyển chứng từ" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and (ngay_ph is null or ngay_ph &lt;= case when replace('{$%c[tu_ngay]}', ' ', '') = '//' then '' else convert(smalldatetime, '{$%c[tu_ngay]}', 103) end) and ma_nk in (select ma_nk from v20dmctnk b where ma_ct in (select distinct ma_ct from dmct8) and not exists(select 1 from v20dmctnk c where c.ma_nk = b.ma_nk and c.ma_ct not in (select distinct ma_ct from dmct8)))" check="(ngay_ph is null or ngay_ph &lt;= case when replace('{$%c[tu_ngay]}', ' ', '') = '//' then '' else convert(smalldatetime,replace(replace('{$%c[tu_ngay]}', '$%c[tu_ngay]', ''), '{}', ''), 103) end) and ma_nk in (select ma_nk from v20dmctnk b where ma_ct in (select distinct ma_ct from dmct8) and not exists(select 1 from v20dmctnk c where c.ma_nk = b.ma_nk and c.ma_ct not in (select distinct ma_ct from dmct8)))" information="ma_nk$v20dmnk.ten_nk%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+dq2IF/0VaBevkhqfk8d19kIJaTBZUHjMnWuoU+YHBT6GrkDQ9Dpz4WD3sDxwqJgA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="so_ct_des" readOnly="true" external="true" disabled="true" hidden="true">
      <header v="" e=""/>
    </field>

    <field name="ds_ma_ct">
      <header v="Danh sách chứng từ" e="Voucher List"/>
      <items style="Lookup" controller="Voucher" key="status = '1' and ma_ct in (select distinct ma_ct from dmct8)" check="ma_ct in (select distinct ma_ct from dmct8)"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_edit = 1) and status = '1')" check="(@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_edit = 1))"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="11001---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1110000-: [loai].Label, [loai], [loai].Description"/>
      <item value="11001001: [ma_quyen].Label, [ma_quyen], [ten_quyen%l], [so_ct_des]"/>
      <item value="110000--: [ds_ma_ct].Label, [ds_ma_ct]"/>
      <item value="110000--: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>av5J2ylIEsIMrF5FzD279YMtHcehNh1LiJodJo9HpRs+XVexVce8vw1PnLXxQDnUlQGKU3WmCUNIcxDYAm3KgkAY9vl6vE1TO88X8uSOsT/jL6ytFciY8SUOx9iML7ybXEOaBiBAmGAgKiuYzDmS6HzctjUj8r5G5ytYGgOSbah+W8sBN8zhDHTDzIqMLZX5mNqImhhnTo4LXaoZnofcAuwMQ01ONOF+DOhRT9KV1MGWXhjOpC1N+bxMEb+M3lM493TmGFWJOCFwzuxzkiJkqw==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rck1kSougPh5LoZfb9UTHKNWT0dY8NXP+14htsK3dYa/VLgzXzY98vRLSdS+tXUtfNrEMULP+c3zMUq/5Iz0MJwB+zmNCgmlrnrvj8hK6IWXDc0T3mrokkvyURLHsVTMZwgSeBcDMpwqVKv6rsg5ZM1MHvB6PGN39hKr/q1kd9iJGxRmnILbxYKEGfohgRc/dBdH5Wfr/D1k/oxS1fpexBn/N70/S9iXX1S02rbn8vDI5X7W5NWc0LAWUrvTXPXUckCt4bIQx7AYdkKWBLDn65j4n3qfnyeUib60rK4GJE/TYPVeGWk1j8yENXUuORP2dDmbKop5UMXHeR7oL9UI9Z991UzJQWL76Ta2tZrquG7TFkNRGffv487L+PLQDBBwLn6E/xH/Aj1q3ytimJ7xr2sg7If4Y/yXinDzrvLzt7A=</encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>TE7+RjXP+S0xJLzHtz85DYPsuioM5LXyuLfTKBytaMjY3l90YaXkpsnmgkWBr5XFfu63ANqeoLnlXwGKxmDWjTm5QvY5JZMpEBfKsWsPSwXM/JbbSwOg/XqsQks4Htdtmu5g7CRvxdl3VmPZiJFLIKIjQ7ygNJYQ7uEbBDZuJ3GxtQxUUlSzoG0f7/RZTKlkJ5T1q25dh2gyerBIZJwtNdfnADTdc3MRr5QaHqrv4vM=</encrypted>]]>
      </text>
    </command>
  
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>dqUIlYqwwyCFbELPEQJ4rvMEEGyedkVAqF0h8KYFGNJjoNIaF7dmiOFcTtfqF44TGm3lpHrn7GIbxTRkXJkkZqDnHm1P3musQrjvqt7t/2HtgUmI3tfrvHwwcCi8jaJ7E55mZPBD/zX2Qr9X6MI9oRPs4aoVzcqQ4ngvisa5+1Js8QBwWgRIojg4iw2cDb7xYm7KWvvrMyAzbcMhrDvfF5dfF0WE7pzczfdCOPF0O6LqSWPJeCZ6lnVXA54Ir4wKaf/T3eYjBuCAqxDSKDO4tqUBN40v7GKA9sPG0I0eyKrSfnaJ2p7PqK4vZIO+Cgwcm+Ks3CoeGOin8z1VzcOx7wq4txLXnZTWooXRdq+vvtip1YX48et8c8g3Fnbr+7yD+5pgb11v/SflFB5T39qTxnX++e5gFpU9Ej9hkzQJUgwTSocb7QEnX78XedmTPsGoBXEzBpAgTWmpTlnaNaq37UkjgDO48D1Sx37Bzo+04taUPSnfrYQY3CFlEz53QGE/zQZ9/Uzdb0uQ/532RA+kdnCUegPrwlfy0dUo1/jRUcfHw54MyFog7RyP+BMOVCnrfNC90Db8eEGBL14jj8XIdE1hi73uwL4kHVuRJFiYkhef6bejSJU9Ogyz6mbvkPxx2o/tKYnMLB82/c44mcCsDFadbtp1CayRWvFRlRiGxPkvXx08yvT/ZJgtk/lrWP9+10IsC3p8Yw/AE+Li3KClVM/A20Zlxi+2Jc57Og1vyXIg7Nj/8M0Ipi70x/m//2ldq55Wwr3jKFskXcFkLNcSJTwMxvf+o5FFSOjB0HRBaDsl8rARojFuwGk8GGAguEScvIBQXLlggmu1aPAsd9jDArrFKnaxSRCitD6W4Rs8+8yh3f2s0YPwgp1wvK9wNV2sMBwuipIJD3Qv5L6KRN7X5zrssThtmatOBvneouPoi/7JDJphgNytiIC+ML9binJAz1ISD+VFbVIYzClvanqcyG/NWk4z9EsYJpoJVMaIdxYo0ruACkqFoWgopM0H92pVI77GQYLrxpf7iYhLdJc/qD07cUu723Y6APgWml3I7xb0EJd79rVLRIgPiLELsL+v/OohHcnDhqEUpK5m5VM+/QTucvVRpSOTUAqJdCx+wbofYGhoTc/Hy7Q9lyNDaCcYDN0Feim1KWhQd3MBsUEIe+vxqnDIMW1Vmoflh6f6UilRyX7zWeFoiqTAtd/eqQxb0ryi/BQqO/FyAS6w2LsqdGOZZ4SNsNMCtq9sOHuD+2Uf9Ua6UaJmTMJJgiX345nf3vmCUHFM0CuyJZyU9/fWYQ+tpeFsmQmhJ7tPK/G9CBHfVZYfdUdY61KoZCjNqAc7risB14hpRMd9lxppRmSlWvHEnX1QQ00AGZRwxu+JaVdTN9BDtwq1+rjcdkHlgQoRPAqjMizex3Kl8xkMHziKqEyWT57dJrqBAN2JvTNAafa41vUOPQouhv4u1xgzejqtzrzW+UB9iKNUG2BuoUlOdbLxDn6jez131s7s8sWcoN2PkkJtwhCK6oNKt8QuLPLhTD/eoFLQO7dcY2KTWV6vD/UyO7b1ZNfdXdZYBm3tMvgRF/8zLdTC+xV8XBqQYEnIIG8+n4Lt/wF3sug/aSu4qZqnqoZ7cmga8DswBNd0Kuk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherBook">
      <text>
        <![CDATA[<encrypted>VkZ/WPZKj+ABrMWnud2lNRdknHUNOWKdQ+9L8Fep7JoJ+uMi9R7icNAjNEej6omyajkR0pjXU+C4IOtMfCNRB/n1E4IJ8BHFDN7etnuhUOhoGR0E9nz+h6rDjptxUS6in+fNJifj7Ibwsl5+QvX7TgRgo9a+IBzUFaJvNctTXRcagzBzCCUVJPaO8Yw+gGdnUH0xEo5RAqPNhV2BgEzQZvDnctOtqv2JPaEQT1mUUd1Hn/2lbGCvq+jMAv16WWBf</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
