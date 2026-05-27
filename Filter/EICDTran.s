<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
    <!ENTITY LockedDate "
if @r is not null begin
  select @locked as message
  return
end
">
  <!ENTITY Error "
if @r is not null begin
  select '' as message, @field as field, @r as record
  return
end
">
<!ENTITY s1 "Số hóa đơn &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; tại dòng &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
  <!ENTITY s2 "The invoice number &lt;span class=&quot;Highlight&quot;&gt;&#37;s1&lt;/span&gt; at row &lt;span class=&quot;Highlight&quot;&gt;&#37;s2&lt;/span&gt;">
]>
<dir table="ct60" code="stt_rec" order="stt_rec" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu chi" e="Cash Payment"></title>
 <fields>
    <field name="stt_rec" readOnly ="true" hidden="true">
      <header v="stt rec" e="stt rec"></header>
    </field>
    <field name="ma_dvcs" readOnly ="true" hidden="true">
      <header v="ma_dvcs" e="ma_dvcs"></header>
    </field>
	
    <field name="ct60gl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="300" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EICDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
	
  </fields>

  <views>
    <view id="Dir" height="400" anchor="1" >
	 <item value="110, 300, 100, 100, 100, 100, 100, 37, 100, 100, 15, 62, 55, 100, 0, 0"/>
	 
	 <item value="11--------: [ma_dvcs],[stt_rec]"/>
	 <item value="1: [ct60gl]"/>
	 <categories>
        <category index="1" columns="1388" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>	

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MILz7PtlSlgzHpqfpLQ9EtdC+6oFCHdSwXB+fY7U1LofI=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>x4bWmBstlP8nGXsFdVmHXkPm2EMWQaM5CPY8LU8kqNE/MyrGJ2N+FGM0LQvFFo77+xGH6d/EAF6SArmSD/CGTucOHWei4LSZZmgx7SNPjVdYKG5O+Krj7YntibcF3YspcNeYsCnbyYiM2//SdRXPSMCS/Ddt6f0EXtLmSUaSJ33EjgcBEKHkmnKghjIZ7H7j8tydTVSl2M7FFPLX9+53DQ88ieVyBlGAG6inx+ci05sOpcIXuOYR0Zi/JgMJYCqjHLQE2TOnHlGpiTN27HPUh7aMzo+bO4H/KDc3nalDpO0Bxj/KVbBwhLOwPsPix3Zqm71SS8d3LbrbpsgZngUtAXoyGicv3Kjknqfdrq/QvjHcXzQ/6+b9sVzuip1tgF0LYy8TVO9/UUxJvtYDKaATmjFPogOoW+6+KSetq5inuARwNJSTesJW0fRqtuBuOm/H5JYA85BkddXzbbAO7Fb0iPHHWvwMMkXQ1Zvm8rzQ2GXqwI3eFJgw/bvdjJG+8GGYxBegDOx6bNGF8PPHqXsv5Iyau5q35DzUIIAwKNk7o4i6kSB60NTQphTGABdWz3PmIqKoAaTem94TrlhOzmn9i06t9OQ7sgXfmqfofVK3rcp17R+CAjajKOXE0tBAo5jbJbzh/0nxgCKzcB7Vy4RvlzdnWVCraFTisPcABzCch6WLlcA+9wR7wxwIovpoeFr14Ng1kxHrT4pNPTV9STJY5ebUeseFdpOFYGH7Yvc68uXQ42RQ9GzL0OF7RkJtaHZ5f8NmzzuMSIfmSBIvmJFuR1X9Q7H7m9oYO/9NORhPQOBAReAviBarliPU0wb+BHlIkVydU6IpMBkZ8BW4hiY4WvyLCxK3SF1e7BiUGuGRsuf4J8xYJ2r/MZL+aiy7NnIMNyu+hU3o+jkhRLzO2AtjFwYbrNKhu/r/pkEQKK0JUewW5LoIpdWq5I4fi5Wd3K6t7ZaHuDQNzDmV0Z/A169epMaFC9vh9lz69EpVo8hF1npVxCQFDJPX1G6wF3lNNll+IRaBKW6XH2ubM5m7P8fvCF+KuyZSTi6CgMQCaYx0qRCLcLwda2g3zGi4ZWUKGQ+1QowgCD9+WZTVEouorIYdJSo5zO4fBz0H2f7K9/vFNmSUveMZsyCxzuYd5JRZsb4fGzgvLdLZDokRBtfhm0gvZFDtdW6XElC0PYRd8y8SW0UtR+h/FYPCaINeidKhqtKr2RKFdPyEmZT3PJ4B8b2dxQD9V+IV94Lz2/TVb2KwIVKPRn8+osHNud+RndJLO4iUM1o42eYs5xz9qcU2K0Ezl+1gxle418HS8PtC4+1Wquv/78378KN6GQVzKYQRL7qTgjO5CwNwT6j0ZdAHiTNw+pEbsXKjXI2z10bzs2MR1jY=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHCQPKR03Qwtpa02gf4gx65Oaj4H+91XpMDxL21/GWlT07KibxLRtSCFd+XrYfx2Vw7zS4lEpXxilvPRWXCLZr+/KyO8vdcX9jB4+7rM+st0=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHBCPzXeOtidO7uBS0rKdQ44//VtS+Bj3V+Xr71LpGD4GXteOmAAT4wrK5s4gWJmjAk8FYyuIIKeDSydumUeO6r/v2YvI3XvUhJ+08hMHcKk=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh7ttlhUMlhS8ZbCWqnzENQ5+qQmIggCxCdzJPZgTb2F5HpoC4IbAiqNM+oCMeQKe7usyhpqmMdDXvneqxxnJQW3ImeYzm/rWbidMuh+quZ1Q=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMb7HCwjQEZDoccba0Fe14BegXSK0gZU/vkC3Tsct+KbEWDRR5K2wjkIZG/DW/uOeo76qIat8diCMU8a0E8OnXMNtIvVTrsY4+UjoIguvqL/LAyIvTDaawHL/ox/8A/7xbaHTYgFLNjle6PY1xcxSkwxd8JNfjHh81EQX/c62dr2G</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


