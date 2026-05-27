<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY TransferID "GLtctm">
  <!ENTITY FileName "case when @@language = 'V' then 'GLTCTM' else 'GLTCTM_FC' end + case when @chon_tt = '1' then '' else '_A03200' end">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A03200\ReportCircularTypeField.xml">

  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128)
select @ticket = lower(replace(newid(),'-','')), @filename = &FileName; + '.xlsx'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, case when @@language = 'v' then N'Thuyết minh tài chính' else N'Interpretation of Financial' end, '@@appDatabaseName', getdate());">
  
  <!ENTITY Form "GLTCTM">
  <!ENTITY defaultTable "V30GLTCTM">
  <!ENTITY defaultForm "V30GLTCTM">
]>

<dir id="3" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Previous Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="type" clientDefault="10">
      <header v="Hiển thị" e="Display"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Chỉ tiêu đơn" e="Normal"/>
        </item>
        <item value="20">
          <text v="Chỉ tiêu dựng cột" e="Crosstab"/>
        </item>
        <item value="30">
          <text v="Chỉ tiêu tăng giảm" e="Balance"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
      <item value="110000-: [type].Label, [type]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>4ZahQOgb8HyVpCZt6o2hOgI+FzZZ3HOTowpFLX1h2aDFyLdbY9kJmlqoeWRQc73KJnH/0tL2A1rf3e4eSGnODtSmzhcHcexrYdGfKezu1PNHKAu6EtJDrPTT1P0kAl5PnnSdCjkK5DiYIFLocQnueoqT+VPWu4MKVD4c+4YKGTO6tJNdrjzBje4u8RhFrVtpmC8Azm1fe8jFapx0EQRuCaZDLQsgWDuOvwT53qxEM+U=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>+fO5/Aj8V4KBlYTMYspN/reWKxcatWYqcJCYf5RMFDQjq13qZw//A/L2lCr28tIHofg7kFOfWHBCw04BKifq/GE6a7aBj2hi2VFAuSX6149Wm/fel6cS2a1ndCjtUQkN//UqHv/NiMLpBUvZDiuy7ofPC6GgNI/KIQOXFWc/Pnar59yxyYnor2PPVb3PMX14lnIG/5BZdo3G7ZHQ86pnuUc4g8ChRr4oFoRI7+l9LYGTKjLbMNHOsrAkOPHADIvv</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>X1QnpQJhaQe6Wtfw5yF8/mgHS+nofc52OBWyfrRLluQFR4am41Mj3Rhe3KTNI8IPihk6u8XzYKckw5gWWqHIjTf5tT6bJ3d0gwsEf4FUdqAK10qQK3ZuHpFbDlIjduJALAQq3/iw6hlx7yFFikyfpQ==</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>/2SEzd3JvSlRyPavI9dgxa+sO5ldONqadc6QdnGs5efKHikGlT78UM0nnWU8cMRYMFex3NrRaBd7a0uxkKCwF2YSKdK/wjOZbiPvvB7T5kwYKIYyHxatc8pyez3PVqBoN9Aa3hQT0aE+IZcnXnAXcgw3ge6KHCJ+fUaqq8AAz1I=</encrypted>]]>&FileName;<![CDATA[<encrypted>yWkGeakZTwI7AXujPtxFzchRNjn22QHy1I4KImvSbsw0Ef5W9UyyIhyW4xvHtIxi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>OVwCnKBuaK5y2k8wGDny703lj7NSVgFUWKymoXGmz87woe/dGtxt61VrSN2Rl9W3mVyQbWhH7CVQl301C8kzhPT8UgFkneIGLKyXMvIg1367qlvRagCPgwCpEdjewlNmXg6g7K+bswq1yOMJ+T024OrJVT4F5dVYTWvdBaoXlzE4TSo+rVnzvQRy7XnvG5AEaZed/ZuM8uRUR2qWZjzQx2UTVKLApMLg7SY6irImkndapd7IRk4NoMLdxwLRbobKlaWHgBfwgL9DZlUzRmUKhXIZxcq49+qb90wka+TrrklhL9huaikCviBwmeqexwgXINMTRCyeJXZRBcLHttpKzyCu++WoBqMYwRr2EhSq9IFXYUaGLDZfBHryyHdDUHqHNTedpWGhLtEOAumoqGc+cfb7UE+Y2tzxYwQzreS32FfpxTF7JytpajehT2j8o31/Mi9tGAJ1qAWQicY365n9mV5Mkxc8eiiUJSmmPHCz8E+Jcx0JMmSmsG5WVLmx4ffNoIwzYC/GxhF+oumQT6xNJvmiBWgC9o1HPalRNOnBBC74z9Ihk1f11BSMvdmvE2HMx0Id/br7ZZyNKiNPJOG5HrDTesqEcO/IDPjkYWK90vcLiDbU8vpmTBfB531e/uXx9xrHYoovxNAWdmdz910PUS6tavomaa1AlCDn8eFpS5jXKMCCANmXzPPVD58comNPru+6q2ZXeSC7eh0XwJCINZqUXF1EQdgVz7tcBgglbXeQLsil2t4JrG0tVAFqN/WBu9jl8apF3DpZ9kpkJdpTPRQEE5G9d3pR6A4FInJum5NESsZpqW2QZHIi3bcsqRsmFqQqKaPUJct/DCKruv+6vBfMYUa09CPXkLa3zBkP3Btm2oskY3340cr9tzoLA52UfwrKnbTVfs9V3IJPLFe0kK4PDE021eszD1b6WjU1EkqDAWCbin7VCjuzN5NFDmjGdQodd2b1c0ZmD/msX/dzom1UZCTG8/gIq2FH1V8bQhIiT9F2kkPSKXJmsylkqVmoOsAnAmIBpfViOX7ki0h5YPzVCCwErR6vO7GM2awQ3TOlb/4YiiL4x0xYBYNvH5HytqOUzdkkWnrhoqU+BpZLN0t4Gxs/grl56+OQeWkElmuRrWEo+M3qtUiPaP55kJjcwfhdARfir6Ri7CdU/1S8mdjumUvoUwvF4wPttmyX76EUwOM3/zLixckCnRd9Ig5M</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
