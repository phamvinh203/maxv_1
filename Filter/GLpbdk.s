<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmpbky" code="stt_rec, ngay_tu" order="stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hiệu lực đến ngày" e="Effective Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Units"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>BPgm2rIqaHf+88PHOdlB5oNGxugHrMOn9tULnwxOchwGV+1p0PGV4DpYAEHH67n5/XpssqwkmLQUGw6Ww1f7ADd3V2o+7DJDpJ7ag3spAvvyXdiPBFWtm6feOosJloqLKF3ukB3qeFLhebe9FakGdKCROAhwmWsTYWL/lkGllLih+OIGtG3RhgTgdkClk8vsQD7UhDVFUT2zlaJQpVdRRRpetRMhyuC3DmwoHoDx2Bo=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>+AbGs0nY+5AB50A344FQUzTag176zU1mJpSGNbEyOjpuDwQbW9GOqDt9FCY9OwPhAkg0xqTlU+XBBp6PsN0YGLSPisOZE4sftTtrK8syWgxZg8ZLVAFFsXvjfp6EMVQaSedn5fO9LCaUPgD+E/uK5oklmfcH2YL9P2d7HbFzZNHJ4VmE77k1PoFXSXAiyExpl0w7aG6We0VzQIMVbWBzcCxtgRkSteb7h8SgOzqmuAIi5SU2YnAlWT2jYt43NYhckWthrWaaPHEi2NSd6kmSNLGw5NidetyHACWDu/N/zFuUocdWCajlaH+3z06U6Wf7xrlqKz8Uob8hhWVgBtjDVQGSC274e3djNP2g+0MpSmqFqwezBieghFxF+Dt2a+KZrLmiJpxhB+ZEH30lCdbCNSscJVUQR3LLMWooc3GdSqUa0y1G5cG3QTheiaiFGrFNZLt7ajM42ITMsISa6Ia9U31T2w68Ln921xYt1UF9V8uDS0VpXWZjp66tTMkdZNaA62tc8ST0MFJaTdS45e13h+AGjajbu4FK+fwZnzgHzBK8mWCok9DZWs45p2dtXzIhW1KkKbcaG5X/QsgNywqrM8y2Z9cwNX9WfSHgKYFgkV8C2rrxJIFEDGzWbqlsUv2u</encrypted>]]>
    </text>
  </script>
</dir>
