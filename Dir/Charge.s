<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmcp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chi phí" e="Charge"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chi phí" e="Charge Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cp" allowNulls="false">
      <header v="Tên chi phí" e="Description"></header>
    </field>
    <field name="ten_cp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="loai_cp" allowNulls="false">
      <header v="Loại chi phí" e="Charge Type"></header>
      <items style="AutoComplete" controller="ChargeType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$dmloaicp.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai_pb" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Tiêu thức phân bổ" e="Apportion by"></header>
      <footer v="1 - Số lượng, 2 - Thể tích, 3 - Khối lượng, 4 - Giá trị" e="1 - Quantity, 2 - Volume, 3 - Weight, 4 - Purchase Amount"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_ct">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_cp].Label, [ten_cp]"/>
      <item value="1100: [ten_cp2].Label, [ten_cp2]"/>
      <item value="1101: [loai_cp].Label, [loai_cp], [ten_loai%l]"/>
      <item value="1110: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgji63+v4KCZn0wV3a5GRNk807CCIv8ZwgB4UlahqA7iF1WW71wDvyPdyuuMA3b2dpFqwDndylDB2qdl/Ut5aZ8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khl5rXBylpTAbZjbvfOSGDw8iFGWmXnvaDvfujuH7jxIpbODm05LQp8cURVpLib99GK66ttlWi8KyZtb2Qv3ub0=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>BmGCgSCusKUhNDC+fmmFFNN7nm9lJ5IQkfbXgrMOmIOV8SK9t5SOtYkyxkzO1tcxCziPrSMYqXBDxa5usdEtP7mHh4MklmAufYSQBynVEEvebOveMwESca1FKdYcxgzJcY0fIK+zB13uw3wk3w2jiTMTMsanjmcFi5sPraTrTUJK1TJMC8RCVqIGa6Nr+RyRZW6EZkFObYr1nygVnER63A2S1+9gZiiAsfO/OzolhLbSi4QOwDLE8+mOoQgC0xTfRW9a1547xWPCq8ycHVz0VeLZhA0cY2ayF+4jqtcrTPGwxxDSq2c3q3mKWyxduWKPw68gzkHjuKCNx1NtgTaEsH12wTaSnzPVZAqlydVHWOAPh9s7MCLdMCQqXA4jKfUQiJRMLMoO43voiXQppN7Ct2n9W8WGHMB3IqeqrkbKHaqATZkUwP+a0fkTZ//I9YqQ</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>aRp2UMpnHwesoqAVI37aHEjKSiUBpwdzp0NuxrrnuLlhbMH6qDpizN+lRuHZLQS1xNNJBdlltXA245mGOGzOrnM3GHBXB7IuZwT1w1tgbzNHUjYpXFjuVGvIUOo+6YHmp8P4S7j62ZbcMqUQZM/u/wynzfnwNqMqqdzoJU/0NKsilO5VhvbzWbtnPkQ1YU+AFocJedFDahtUq27/hgDO6qk1+z/AL/pZRH7SqVWB5XPFG/Gb8+wQytLMNcvL6pmx1ugrNPUTIfBAPFJhfqqQeA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0QgPmCnsoPXAWMqq1MrPtWWbK6GSK7r7Nq668jHNOfYXThzVgcn09xB4+FR/z2ZedJtqQ4H/6WEhaP7nPH0iciJkqNS43RKp4M9TWA+TqIXxCcHfs/tavWnoDC6XOhRWhsfwOqKAgHrR8HI9pBGAAksY/VRVV2aobWZI+qaqD+wvbaKf9n0CIuZHKNzeLmhY2sjUiYSc7YJHSlZsBmHnpVUT0U1SBYVvOWF1EgRhYpTM0KkVG6zISj/+SkG2phARCXS2vJ06CbU6QhnpKnbkhuaOITJvL3Tt/8M3yOmnBpt5f</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlZR+Hu4NQfuXRr1yUpLTweZSZiQh1/bRwLTom09eTK70</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>qbDHdKwFGO5rbbBeqWAwWtPmOr+byGqAiLmj8nx978prn96Q5imqy0JimGALpeOXIGqij4qYIGKMe/k8y1/DIAPiZwJwxex1DgUcvIZ2kauxd6nPOf8K3lEYb3s94mtdt/iPtJPdY3kv80oPBxqeQoH3qOX4+El+KaWBmMdjdQzZW/6lQh+pHnR7z5eHFJvagD/JSTPQwuUy8zqKQsPc4I4AZmW5Jt9TOwKJMbI3fOg6RLAS4MgonttG3Ci8EpXBBdZ5eilZhQJ+zOtlvZxB70ijUJbzekFAE+OJHTNlk1Nk7VOA21mKcyLlAkr2LHJVeaHUv0e71JYhi2CbhHRzR4jGfQNZsfdvYtsIj7dA43I=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
