<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
]>

<dir table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Đăng ký số chứng từ ghi sổ" e="Journal Voucher Register"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày ctgs từ" e="JV Date from"/>
      <footer v="Ngày ctgs từ/đến" e="JV Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày ctgs đến" e="JV Date to"/>
    </field>
    <field name="ma_dvcs" >
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)"/>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sao chép số liệu" e="Copy"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wDUWscwn2JkmQIJOUXumOxAJS2TgoAUIqMMhPIxmyovB0iFVuv1qQRc1Kg1WoVqYEZ9CJ/QYdkVeFgxUlLQ5WY=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct3" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ctgs từ" e="JV Date from"/>
      <footer v="Chép ngày ctgs từ/đến" e="Date from/to"/>
    </field>
    <field name="ngay_ct4" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày ctgs đến" e="JV Date to"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 30, 70, 100, 200, 20"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
      <item value="1101: [ngay_ct3].Description, [ngay_ct3], [ngay_ct4]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krQY/LyPTcdThc3gF+jDOpmGyDYuPEZT8hi6N9gN6Fd0B40AwMXEStWqqlrKmb413stUzlaSRkPBO2W8b/LcCxcDLLjPUTYCZ0zegY9hS6MJ</encrypted>]]>
      </text>
    </command>
    
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>2UQkqEIF6mn7ORhrjdKWQgoNJ9YlgDzc8HkLEn9QnPcMjL65SlOSelNcWZwDSKRXEKh3zhEaFLC49SpguNWX0Q==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>d6IxOkq6by/6sCNe4u7x3Z3e01gOpXwBry0/wbGL2EW9ur4n7u0udXHqO+1H1iHYeIMC8bpiKT1Z2C1wpn0ib7Ds9rbiwu+SYdVFqUHQAFM77oKcEOuaUcSUTR1HEe6oL87qKni6euAGYd532RVDoWKEcXUMyq9oI4INW6DFwk9GlazlUHIk3DGSwemnpk6CZ4ZO4dSdjV2RRopB8RakVxh8riID6KFN7BGZMvdGlAHTasO+UywMy+teO9coyLtqkUf81JUjSsQa9j2x5I54SBSbL1mfnhkLEy0Jk/KFxHu/oY/4kv6TE82lM1G9eIK8N8fCuBvDF5If/rBYvk1gYiNrBg01/Hmr40mFrj9qQgwgIZ7QO6Yx3hZrA6K0dDt0ZcfDQteg3GwMQ+UYtzpro01gvcp1fmWyv6cRT85S+rpuTaMFAT9cPYW5F8/MWpO/LvPoVGVGt5dG6S9YlzJy26GB8ELC/voE3Lfjss9qZbJKkSNdy1oOMeGhKUIRO8kTf98JZa1UxtQo3X8LJyk2HjoIARrO/VzP/toMcbaeOxicG7YFauVzJj2iB29AOW4WHKDF8hQPXRDL5vcKqOVR0uqkwRH9VKnN0rjtKEvrDN04G/XLcWpIw5gkijq4GM1xsxZqrGcZ9q8e5Wq+b635+mowDHB9Sh3jhaEUQZRaVb1msTkwbTsFoSFUui3Ot12cZNUyvs7nedeHAKboP7psYU9eB+23bBgPVJTMSK5gL5unzjs7TKp0W4EqJoCgJ9qX/wH6qGY+uBxZeH50HX3gnzFEX7SMwPOjbYDQ/iuPXWrSQOHAuTLeYXbfSvUJbc0GVzj7C7XhBPS8XKYxxU+oopfs7V+6a/2f4o4RSMIRxblEmRTv0T2bnjj6tNQOmH7w</encrypted>]]>
    </text>
  </script>

</dir>
