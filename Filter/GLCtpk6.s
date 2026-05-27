<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="0">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110: [ty_gia].Label, [ty_gia]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4F5kJFOft1KpZAd1NMlh6u/TjovDtpANkZnqzuB8MOIc</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>zcW+l9CLUyT6V1czPfAUFvH02GjZTaAXl9P7h2jn2P1WEVUjkYpmr6PD2zBy1wlo0QPE4hxFJ7a6+Q6/i0zCdYnwf5+BLxeUk6DG9Ts3IITFWv/3FF509iO7M5ieFquWSlSCQ7Tdr69dnpclp5kz/NWc0+TDsN4XeURuodndmHXK+ReYAgseE48ldaIBZ8DUUFzA+6AoLOPbz/vJ3YOploEdanL3Zk+2Ez3T9apYl9Nh7b7tw3rojeAFmGQ6vqYcB4ZvpU4vJpffTDkORdqedVFk1aZE1rJnQlL2wLQMP4Wx20WMhE/ucgjPD2EwOX70g01EhK6pGIRgqfsd4wWUG2hU9GQSI0vqUT3RflwvQz3CAckkALgFvU/jE5eY5Ne4jAB5G0V5ppfCXBpWHWac1Qc7mXLIk6OFb7rKKbL9p3NFM284ajkaUKo35uRpP66HTr2/dNnhs0EHOg+Gp6h3IEKzrEdnqj9SmzdKqiqmPycFlkG7254y7XEdqILvrnitmdWl6lr503ngNjn8tUG5EFh5S2ijZTdvewNT7IHFS9YPo/T7UB3ESGDkQOqS09qcDQn7QtkQrwpI8wKatSnXuTty0mcwjSNba12x61sEJpNCc5umIUxlUTCWXi1R7unPrV+PJI9MDzqEe+VzLb2LaZboQ99ZAtEGqNJXJ+b10twrmZzODS5w3QY9PB6PjoV0hh4d05T+ifjDLoADKF7f7rKJGzfzu6lFK8OPnYelUXwbXULm+0r2PpApgONVurN46mvxmw/yTO25OgJs/M+VAKPZ7O2W0te/SK0yQNowUagNa7zAsixyxaCLApXDoYZa</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<encrypted>ZpdZwq+fSOZABFWxc1g+dIkySG3RzPiQmEU7o9glYnJzwsg3qAT+36rmIPFOlV72n+eFB1jLJqE/a2o12kK1oy7TClqch6NKK139RCSC/OUoLcktx+ry76pkk7hty/ocAjMMZjK8WnQUEiQM5BwcNhHdU6aSV923PynJjp2/Y4jCvAsSi84PWf5oWFz5i4ibQccNuDq14TYy7m6AA2kyc+TzzRxTMV1F6kg84v5MYGCoKlt8EsaMWggVRM+vNNxZWB6mAe7gIm9e8qkjaQtpensqFmJqcmnBKqpNbqQFADrF+4mzlNz5V0l6I7YfAK8Vxgufq1le/kiFpm0Rm4ZJzRtMuUgEDKXH5NbLZQ7AWQm7kEDnmf3e1BZqLWmZYin49WtoQpP+XNU0ar8hayxFSN2x8PNDAQFtNOKW/HZTbuY=</encrypted>]]>
      </text>
    </action>

  </response>
</dir>
