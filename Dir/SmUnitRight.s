<?xml version="1.0" encoding="utf-8"?>

<dir table="sysunitrights2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phân quyền truy cập theo đơn vị" e="Unit Access Right"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <handle source="dmdvcs.ma_dvcs" foreward="true"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd%l" key="id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1 and id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1 and id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa45a24RAXtRJXK1DagJEZXGE3WUp9s26EVEfqLzarvFLkVKOSZ9hVkRHDIq+EpFPf5A==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="name2" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="ten_nsd2%l" key="id in (select distinct id from userinfo2 where id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" check="id in (select distinct id from userinfo2 where id not in (select id from @@appDatabaseName..vsysunitrights where ma_dvcs = '{$%c[ma_dvcs]}'))" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa401jrAbekH21fwhm7dO7jmwwinzB30xyTVe3IClakLmIGA8HtsTfTGURO7SDgfZGFg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nsd2%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" readOnly="true" allowContain="true">
      <items style="Numeric"></items>
    </field>
    <field name="r_new" type="Boolean" categoryIndex="1">
      <header v="Mới" e="New"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Chức năng&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Function&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_edit" type="Boolean" categoryIndex="1">
      <header v="Sửa" e="Edit"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Cho phép&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Allow&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="r_del" type="Boolean" categoryIndex="1">
      <header v="Xóa" e="Delete"></header>
      <items style="Numeric"/>
    </field>
    <field name="r_access" type="Boolean" categoryIndex="1">
      <header v="Truy cập" e="Access"></header>
      <items style="Numeric"/>
    </field>

    <field name="admin_yn" external="true" defaultValue="0" hidden="true" readOnly="true">
    </field>
    <field name="user_yn" external="true" defaultValue="1" hidden="true" readOnly="true" allowContain="true">
    </field>
    <field name="comment" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
    </field>
    <field name="id" external="true" defaultValue="''" type="Decimal" disabled="true" hidden="true" readOnly="true">
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="111011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [user_id], [user_yn]"/>
      <item value="111001: [name].Label, [name], [ten_nsd%l], [id]"/>
      <item value="111001: [name2].Label, [name2], [ten_nsd2%l], [admin_yn]"/>
      <item value="11001: [r_new].Desciption, [r_edit].Desciption, [comment]"/>
      <item value="11: [r_new].Label, [r_new]"/>
      <item value="11: [r_edit].Label, [r_edit]"/>
      <item value="11: [r_del].Label, [r_del]"/>
      <item value="11: [r_access].Label, [r_access]"/>
      <categories>
        <category index="1" columns="120, 25, 70, 25, 100, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>

    <command event="Created">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UA+5MFQy6UD6zb6+t1bGNJ9WotZAYD6hSaRVF0lNqTZ61EEz8iQdV6HYPUJimpMxAJmQCW3WYKSwfn1oqQVT2k=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>657rNZ0cRQUR/Gf5AMpF1/vAjcqyZeqSs/DnCvkg9tUf3/aM2d1dHsb++ZpEkdHl5qqxAnN1i9zxu2G9KFTSI7drcuboY+djsaEHsLZhKAeJnD3AhulMjlwJCuRZVABqDymfMAt5s7X947mzvVt5ywtazb/FLxlc6h9UwEGJ7Ux6u3QUSPdiVySGbIk/ncBpd1Qg/Qnjuz8gKlUCpKWHUBGHNCfg2LCVzIxR15+woQR2/aTPgoHyxYFRd2gjJsteeHlbO8/Dw3vq3GVkpTSJd+/55yYuD1JFlIQhjr3+EyZ/rqm/O1Mys33UdiHcH42guAfPrCyw1DHLDwVFw2KsxOoO5b567PPjEvVnDUrVJT+x9VhYz7zAL2qtYLra+wfKfXjwiF9kFWQcbsIN48VOYA==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>1z/uefEBU9JpYaF48lULs0A6QpF/6YPDBtGTeb5ZRcV27jFt0g0K90JB81GQ5nivEoQWAVj+pTsX4A6T05Z8T5od07IKIgyX1fU8eieQ2VJsWcwsOK31yJET10JLcxsMdRMQNwqlt17Psg0ko7VQFZpXt1ZHiGsXZm4/8K5GbDc8ucoB721ZfkdVwQ/bW7CWOXb65jjXH/6+OqRPC6nZn3At7/CNlGn08QOgf4RMHZSyFQnG8Wp44SfclbezkKBk/ZHHtrRhv0xwp4sLCaqO7+OqkuNqiACMeoAdMqa4ZR1QDZxj0d/Sesnu6Aamz2rP6LEVLNlI58uAOkrOE4ltQrzpMBy2AkibcT1HhhlHv8xiZ0c/WiIrJSgOvTosU75Gg6kyHScAPUMYwFt8NA1724E7YYUh2sc4fuB8oHYpEVpgmXzff7cdu1Lv81p9GGS2F3za382umh+k2QdqZQ83ygDsAh1jF0/31Plg3+IzMYo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bSQK9mGLALtaYriGvWBiOfjQuZqqWdqz7tpJIzuhxy3IDZ1hEoNZU2oqAnvDjtdqE3m9e1vxvVRQoor0sw1aM0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>eIHrECXo402lNtpg+qGpTH8E2AI9CUcTx2UUxz2sqqQT0E6YkzbQ2nzSVzI9WRtS1ugTyVbSkyDzvTUuz44tQifOO6GYg5NlH+1DSWglGBSBZaBqHT8zzyBhJC6iXwJVvBvmQvLgMsw0zSHkLqz6Ncb0BYDDEZC6rJhgrn2iDwL45jGLp/ovdLtR5jqCY0YYHPZ3uOb3YxsRw1xPG8MdvTeG2RydCZ6bwpiynGlC3M+3sJTjQ7RSZLWubGkGz6AZY6pxTwJ0Np+c/syS+M3oH2MJCIcf1ruc/AchQsY0PORka/S5MgdY37OsZwc5m6OcT5+GOjituQ9qc4hhZSV87h/xBb2w7G0+yUdRUEoQQWg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>Mjiz0kaF2ErSqh3oEUPgMD9fW/muDox7FI1h6UIeMZ7Psf14bj+15pDXZLOfhKLTt6MlR7ZanXcoWWzAZdDuyYKwd65FpGKU20m8g59QwV5+yF00Ft6vtIhia7Qg3t9PQnhTDLHIS3rZHr2RJnCp79vth2sEOUscv0GUQeoj6YQDUWElsxXThDIBsLIa2Qk9BhcEvCAn1fEzNHKpQX75+jW1Xb27Ce2gbMNjnOdjPJ3k24Lqkzp0+3fKU4ijOozvlYN4dm/9oFRSFWGCxB+LSKQpb9DK7/kvWrFZCWgs8B8zPWDSMKwSZYu2yNHA8QftvmOnrBPcwLmw/2jontohfZY8WK2nNrqOq5jIHFbnfe2LnnoyCWNNhZmw2JnDWTmfRlhUFb960s/7MYQiKuOUAg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>fst3Bi1kOK/g0oFzBg4/8D2SwhAy7Qrl3UKxroWbeQPYKcXFKg/Y+71mbXd9tBoyre98iwI9hD7ekaG9efUMDu2WdaajFfOSgBMSzgMcqwlhxq+SkuV/gzPXSsJbSWeD5aDtTy11djV/v9ttExaeQGrQwgwWS6zVyz4jJaeYR5gh7bCwz0KXV8pyZq5PDi6ECb6Ekxt5nLCjoVwvli4Wgp9qI2gG7VSU15Xxr1/ssWmUBi65QfukDeuABBSbu8Ts+KuFwIg6riw8Yd6e7f8Ono2hg2m9adO5Hfxo+ZfoPw1hniE6W3AAuE4EeI7pF+q3SIo4rGVLLiwTeL+TCN0cTu/rNYnp2Mo6BOHcOzVtA/YvzsePY65ZlIM4ictNgT07wYo2qM08PLim0rmlxpRNalG9dWVSH1asvhk9/o6TXge+LtlSXkg0yPg9CZV+CRGDIYfGFqYnwTk7NhUcBca2fg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>Mjiz0kaF2ErSqh3oEUPgMD9fW/muDox7FI1h6UIeMZ7Psf14bj+15pDXZLOfhKLTt6MlR7ZanXcoWWzAZdDuyYKwd65FpGKU20m8g59QwV5+yF00Ft6vtIhia7Qg3t9PQnhTDLHIS3rZHr2RJnCp79vth2sEOUscv0GUQeoj6YQDUWElsxXThDIBsLIa2Qk9BhcEvCAn1fEzNHKpQX75+jW1Xb27Ce2gbMNjnOdjPJ3k24Lqkzp0+3fKU4ijOozvlYN4dm/9oFRSFWGCxB+LSKQpb9DK7/kvWrFZCWgs8B8zPWDSMKwSZYu2yNHA8QftvmOnrBPcwLmw/2jontohfZY8WK2nNrqOq5jIHFbnfe2LnnoyCWNNhZmw2JnDWTmfRlhUFb960s/7MYQiKuOUAg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>JN7nEwQAsqMCf+hvh9EVZKLtq63v6sVE4kJCo3U3wnqqg9osUR7XyYdqd2ECK/aqNe+FhAKqa2/vwL7mZ7EVEFwkS9vWq+zutNjGH6PPY9kEfVyP3Qto0H2O2kZPs9FTZ+ZnXt7ffhBlGspkvD6O8/aRPIjWMB9mp6/rYshpLUO1OQE7fyHTt9HpiB0spajcK8s3rpyyOH7kWMWXoqPY+Dmvp1EP+BPy6B8Grf7vda+sVn1i3nK0x7KUs9A/KYZvXfPR/EN6z5RThen2khDyvS3mOeuP9sNcoxYB/eb5fG6mbFSWe7VzX+JHakMx94ke6hcHzdzN556Ubn2pCp5TFQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>lyvXNZyjNsX9bB39Reswh6/eG7lpimEgYYe8m2oHquVOdosj14OTEo9os6Lh7NR71VyWIIdaWvdaP1LqHlxv0jlg9CsjTH3HDIn+hb1sJJ5oTK5uJ6ujnGDQQ5H4azcJnrtdESo5mIsByuFYxYTCJO23DfBA48/cioMWkLZwPLeYkSEySxoc2fdd6cqL0WwdNlF8Wmtp0bpQiQwPVhNnTzSnlxaFQXZt502TmaTUCKfSV/pqxkB2SzuUkF33D3Lc6jPeXlh2NOUM29Nq1gsGdm6Qexn6SFSG2ZLM9lRG20Z8f76v6whuma+Cgy33RcL60zS7NcvBT6tZTtF+j4+5qegOX/GjRQRgL3qv2ttBmyL8OKhqOO0rJWOQEjqPhMSNSYW4ykaS2Wwst97CFt8LvQ+dshaiNgSFHKECA1k8kiUMeUdsrjW2ugaf6AW3z68s</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>KHdy/yM0jL6zJAEqHywid0yazm7M7rq3LWSk1GbCMAQsWHL+n13/UtGc9OAOeMmPWcc7r9wwgOjjel0ln2jEiMDZJUztsj6l9m2djnfjQ9oc8JHo46Q6jeiOZ4WtA2qCC+Pr2GJFJCLl8UDVeRMIpcjSmlr7ngCj6uOzkmE51+mx06wMu4jwaR1I9pQMbFsaGTDhysIEc8rV5qcGAyO/3PYxufgscsiIPV94tjYr/tV4O04vYv9bN9QdA5uG/FmuqAMFTZv4dFDoiNoaAH7VI8ERbi09ASDUX1S0G0ATAc5oae/JJZmGylKqe5bptzzaFos/dRxsU/qwJqJmjEbNr30DYFH0H7CF332FxJy7LhBtDG98eSP08DRd2PIOz4SVoR+/JYPCNkNTmoC434+hcfISwKZHJ2B6FdlpCQ5f8vDROI70q4aX8G9GRUdYfergPRkmQjXQwdZSXTTlncX2cTGjWMuoGX9gIP2cVp/0IweOOpBgcHkcRJ6ocHXVD2NRnU9HTGXGIuvH4+Pl6AVQbA==</encrypted>]]>
      <![CDATA[<encrypted>KH9WwMkMRv7Gzv6XjrO2Icv6LcorRlm9eLN5/du/etqvyj+Gc/htrBZ5Nv2EwTUG9ZqNq5/hQf+t6bpXZ4FKols6midd3pRcm0A/pipO/o1JRtqE5MkM3IQdxeNVLX2FdsFjrRth1+yNpW6WcZXzgvPOShpwoh/xuXB7X6elm64njQXH6FEWbsT4mLJ1hR0YitI9OkFOhRzkpPjd0ii3vf+9eSrNEntyk0x7LqMPNTXVtsdLqmc5dfcT2eRihlueqUz1pSbZCAu/LU349Sq4OVNTzoyz97RZmFLXV55CCBtjNZ23YDe3L0d4foGTN5zYWq9PNJ3M/Cq8hAMlRDNzEywQNVsFiXGVi6UWfqBuKp2T+PeNjO9bE3Fx6G5yNx24Yf/O1lSLEG8RupEwwMZ1LPNPkNCy5ekJnwgCYY526bywZQqRv1QZ/sWMwI08MOqWaqLXJ5gRvYMrAC5b0lWD4SSm4d/u+/deO7d50FEB25LQ+M+HraOmuLvaQN8D9xr9GPpQaYkvE3/VzKUufO1KqjMzXSokErq3+GngYDmbl4muiQ+en0c9lnMiU4bdmZ6XgL2orrNrRBjDaKo4C7zUAXsd08JPOZXCIKNSYQSLGzaXw9fAYedsQp2M6Ak2TA7B8xz5zo+A+tbzYZVFgolfJO1dmFP17pNyg2JdI5QqZxLZo6OYoe6YRNwm/85La25XBjzxiTKdj+6fqLyp7NEs5SBgeO2Ge7HVKGPgIfrkOUQsyY6Ms/6Ac8gWh9s/19j6xiIv1fIXU/X3iT+b+J3yjTGpztdF59D9Wb267TGA0Gj3K6l9na8v8EY4xRidC9+/q/IqwsWtNnTHvRgHbAzucnmW5T7YkduB7ML4N/rHxCA92FoAqDGyPoReOIHuax1crK8BV4fGVlgnuD9tiPq+YD7ulzgrm1zfz9HHHbsKb1D3M0EhVXQHn1bK+d2SIUmeZ0lqoasg3BRYRR9bMl2cmw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>1yFfFbbp3GuFflwXTQOZ7uP4oXNRKg1JDIwqvLY6/RfpjsNy8wLLiekgulGdRbW/Wq78rBEetyPR1A2cOguG/nwSGbuvDCAlorLK4T3KHlhayKVfsxsv3SSe96JpuOMglGaX2uyBNkldGNxo41tJ3MFnmVOeCUMpRk1SQBhP5FVYl8/LfXXUjtVOAJRZ+4S9KkhI3ouW6MXcTgzEJklVCwOBQnL0C5REtoia19ZPcKM=</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>0SRce0k30fLqecfyOb0tWnEVzak5ltRQ6Bu5wJ7TAruaip793wwdk5Mvu/jd4DgLkYd9/ORo0YiMQQDOvBdXIIZ8b6RCR2xgId3k1kE7D3PWAxebgr+TvrLl2DuTkP7dtKVlMmXcaC7c+Kj/T+flwzJ94z0TO4gvCQ06AeTRKxrvjYlUiIkPoGbjagC4z2YPQObi46AYTVDfutP70smfOuXwZAvtSTltUs3RL8XR4zo=</encrypted>]]>
    </text>
  </css>
</dir>
