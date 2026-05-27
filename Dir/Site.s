<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmkho" code="ma_kho" order="ma_kho" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="kho hàng" e="Site"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã kho" e="Site Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kho" allowNulls="false">
      <header v="Tên kho" e="Description"></header>
    </field>
    <field name="ten_kho2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dai_ly_yn" type="Boolean">
      <header v="Đại lý" e="Agent"></header>
    </field>
    <field name="ma_nh" clientDefault="Default">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2" >
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 75, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs],[ten_dvcs%l]"/>
      <item value="1100: [ma_kho].Label, [ma_kho]"/>
      <item value="11000: [ten_kho].Label, [ten_kho]"/>
      <item value="11000: [ten_kho2].Label, [ten_kho2]"/>
      <item value="11: [dai_ly_yn].Label, [dai_ly_yn]"/>
      <item value="11001: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11010: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>sARPFulKz5ZjpFp78HmjESFpGcjdy0CzVXVmPywfI39N5pr3IVR04V6ARxpcfYMgwm1YRhtSjXwtY/cw2BmEOWV/ocaqF49L60fT24kRQgrnGi5GtRn2lV+AS7nAPOpvpnM+qpYEsSqBwLiFG2zci1Ssw4P7rmlSOw9CGKXkABu+9Rli1lrsqyGKB+U4unoxh9lwg4Uew2OEUdt73P5u/NyuakPmA9pRb8BPDwbS9xlehEPubwwg6DyxGqLqpdqzywkScKjUWI3PQvFBQ8Vll/hH/HlXHBqHkhj50zYeDZMspanF8t7oIZN1xvHrgGWxEx5hnMzwSW+XghCRbAfh9VAIxeDjZZEpO7p6d+CHw7A=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f94CiWOjJRjFkvndHSZ7W5vwWWK6YpmBef7XV3DYaW5ULGvzgLRv3qNk2QWxSnW8/KLIZpXY78WP6A4Y9a3OYs=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Q2inmpkZiJwBF/tuoEAwlll8KfbdTifJBeDGDaXvM+ratznOxrW3R7Tzlrd9hp+0WJuzjRTqkiGDoNRO8/AmK8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>xJvLtaRt4LL3NE7tuR9lSkgW0pltCcXw7y74qkbpNjYYq3Av31YE7fMl9W/Ka/d31KBazPBKVdaHOl9Y5ME29c5lf+hggz6XXzLH0ZW1bLLESM4Bq5uBCHgDWFQXyKzono2Sk53h3FMRtZq1MgpVbgCZopxZzqGzybFjZ82zHojifvyf/8FCCfh0G/AnRR35Qpz7zYqBiXdP3csnJFe2A6CMAFBh+poH2URWeAKHmPFzfoxkUEO+JZAE3Ac61lcIWZ6gXSRdUkXrGg/li5v+wuDxy1s/+HX5RHloReaDJ7OqnZlFJqkHQjEssFIyKZUjuRTxpED6GeRZNXGW9xuENxEtBrEU6pCcTTg95sB3FM4x+moZ9cSLDuH+s4DnaNVX5cvuOQeewhd/uSqNWfeuQx9Vtsn9Hy1K4gc34DDG037gYv/ApQghhlOk+HjAYza9NrOqDgAmPZ+9bY79KL3pkLnnlxpXGmH6zStq3jXDhMowc8kPXbhOgHD13Yu0U9iqX0y1KtNalr61/aqCMQxmhdSllgc+OENwC7MbSYY7u5H5wAAReg9rkngG5ys1flkW3Fwd6fhyU/QWnuv9TQUjWC93JLlvlxs+jANh15Nr86c/FA+WayFvOycluj0Rv190G1iIivyATxEflezfztUMKQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>EYFJjnZUd3vnE5FAEydSJF8wY1budEOxpdfuQmk2Ryk5E1QltFS7jhcxWQIGZNTNokY1ROEeWoZkiG/AsOEtelTCnKTv10dVKfiRR4EN1DgRef7/vOdenJh6HBjnZBmfw+Q7yPMuWIch8pXMR4JSZdMX7wDc2D6ZgmBIhrbyT3AwEU95eWFqhkiz6/9lmkiNgTRcytf8bCV/7JKpoJ0/arJ+vhsAyztI1euYK6U3ozFWOF0i4afV57Psb30MtQkRlEABMCcEJj1sfdl7rvMwgaihATHF2Bip+nqTSWsiLrAXaf7hritAM19WQhgZeHGEXu+HB2wIZMuLaCG6lexq/OPUqqdNPLKv/BXsP1pYEUs=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>bNnCJSrbccLsBz5ib8qnsFvhDVPrehLR63p9X43etbOQKbtXiFSTgsukzNDEyvUDG3/dWl/zI9/9A5gHTr8S4RHQaRUGHiHHigo4mqTOA+PzKy7hy1QvZMrGFqMOPfvsKWbWEj9ijJbK6JGJc0LdiegkseX/ybKOstUUIoV9IZ57zprNNKBY2cgP3ZCLDB0IrhL8zJrgw2iy7ardhII+kNQ6rqIlT0NiLN8BSop6vskjBajIZO69c8yQMUdOTS9WJX7pjRXY3XSpKXd2Tx5wFMKY8/kOD7cr0EUVnNIoRaNvF9nr8AKlTwGO5PV4uVj06JMqv9ytYbJ0UUaOSufXpvVXQW/yxGBpbdntrCMuj2/8O3XvhfU91P/8xP1EF7n7S88V4EV8Q2fBdmX9tar0bKO35ReOoafi6pEUWwJsuveDcf7LWpm3Fq6E1PSiLG0I</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>+mmClCTAq6fQonqW8062mpmVaepaRucVtzMoHs/xsQlFa0mJBFc+9GfaprvpYPLiukO1319sw6i71PcvCPE0vy4ilPirxxHCqDqhjtl4X5Dqyag3t03gGsULBi3hlGOMIvA9WPV6YCeHklJAwEN0qZup3xm9I/18PMorXIGVa1ny8Ip2Op/a7CGjAQTT11zMOCkS6jrlU1EsiQQbLYZTPQ==</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILecgIDCa1fXXsXQK4Qeiz430c8uso2dKTfaMarkXQaka</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>W/3eOutcdOTq4entMdKrx82yF4gVupYbbL46FEgu9bxMjyZHlCagKa5TNSqDHFczcxJIkQ2i38la6wzdjbS2r/K9FwylNnEQ4WytOXYVJ+aKBwrqhl2Sw/1RJRNAN3NNWAJctWmi5TuBfs9klbgooUI1bO79WknyZaz4uNrgdY8VRvIz3GBXkHFvBD4RUFYQk7lGNfth4nCLXPBfav8RV26cG5TRa8IVJDktFmlmnoR6NSVizjUzMqIBrVOrAqOHyZK1K+Y5HwLiI6pxJmd75Bvtgcl0UOKcYDLwufuhzcjDAdmE7BvfGT7SLYXbomLOP3lcpyxB8m8/k4NrQsWyTR/MY5gbGCr1gFgDhbuhPj+xVaglCKt2GP4eR2JZtLMRoBxw4kTcgaXGfbZY9GOisHsw3CVMT3tVg9tcLTL4UOyX6TUR3mI41uN2j9quVfvH/TiuLqDpr+wC+odog59UZO9pMZiu7g0Xz6WeLunygKeAoTXuF/TP4UUzrRCfmFkm</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
