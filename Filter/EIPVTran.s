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
]>
<dir table="ct60" code="stt_rec" order="stt_rec"  xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hạch toán Hóa đơn mua hàng trong nước" e="Domestic Purchase Invoice"></title>
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
      <items style="Grid" controller="EIPVDetail" row="1">
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
        <![CDATA[<encrypted>NuZy4Nz3XqmAV61E8r5571qmAFqsfqNKpqcygjdtbpqgkDn0Hu+aMyYBV8sPmUIwq1nSLd8s5CasEPUF84Jn9X5niR42DyeOAoWTCSNvgZpQFJ8DlfuQ3UEzQtjgpivN8oL6KtrAl8I379Q5RhV+/f3yR999WuAgz+YT3+XIUJhBVSz74hLcHtQxIDXQCo0V/lUzIP68TDfDt+gHg25QOUkHPEq7+gqyYVh9vIWIgpZSC46pxorIhVwfxhZQLdvu76NW080grg9VWMSMDcQd+lvlpjlUmty3vJmyf6Www+JKM/gBZ4/z6BTPbQz5askklZSOG57ATdFUGK1x4C8q7LWB2k4YAmAb1ujDa6lnINtyNdaoZofGy/bL+i2RqVwqw6OyS15rkqsQeHvK/EFTETU4QkGuN97iC3drLjFF4J/SCkganYELRfkUEWtWkCILeRKzJLkVcbbQNHKEs1rheoJrj4UmVLHUM/iU/bGVuc6Ct9HX1cj5B53CTrDL6a1XIvsd9Mb3sE00xiZBWQojGHGEq9hrTHUaHTFempSP4m4GlxuUz+TBNeghx3hzHdF0B7tjS4eiAAPKJLwXtPPZbTe/RNQz0dkfsCyILZGu9BTzwGi50+qyUSkjEz/qCl5NDDyIhYifXsgVSEZzI6EPyQ/EGQWNbVYnIkTb83fzl8wMCj2VH9ECNK80f8gaP2tAWEdG915PcpPHb21lvZDAZghzVi/FKcs5gplQ+xWzxjZ3xC114od2cYucwH/out4qECGLQtiKVrRX9DZjhBTN5oxmSdS6jjGubCaPDYJ7ZIL9cRuOv1+cUpZpuurgohwEVpcai2YrF6OhosEq0ee3E8t7hL08ArfhxXeYmbA1vAkXN79Ka8Iue52qiaIxGfNsQ5BKbwLy2Z5kJ4WT84idWm3Pes3QjZsa7KBKiwh7+PHpsjR5FZesv94BEH9aZrPuGk4bUfG0VsgsQhzrm427iUNAUPUYCZzz2QorrIdrh7dniB2ayvUrN2wkI+wsdEu/uR/YqvXJKak4TiFDDER0TWU8Lq6hs/TZAyjB4+Sr7WdUpNr7uKd+kwo3CDQ5MoAkseU4T0BeqyurUaOaDm23FnnjcWwvUUTRYMRLpOABW9sLYBoWoWPIdbxOBlm1Q0QBlhSUeUa70Qlbs+oCTnoQZdY2BtDodrI6mBKmfTQCGxbn3y8YPV1Hiaa71A8lm63eebvBX4WO9U8YQE85+JNSUUiNdSeQZEyMx6Ftwsvv07U=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHCQPKR03Qwtpa02gf4gx6+jZF7xSjeFJLD4tzrUmGFvznvLwTSY7HAFmFPDOhvepTjPhZLuVhNPVQg6+8soXppozK10/VVNJZlmdkhG1SnM=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQhHBCPzXeOtidO7uBS0rKdQ44//VtS+Bj3V+Xr71LpGD4GXteOmAAT4wrK5s4gWJmjAk8FYyuIIKeDSydumUeO6r/v2YvI3XvUhJ+08hMHcKk=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTR3rixlZTPWeqtQCQo0lWQh7ttlhUMlhS8ZbCWqnzENQ5+qQmIggCxCdzJPZgTb2F5HpoC4IbAiqNM+oCMeQKe7usyhpqmMdDXvneqxxnJQW3ImeYzm/rWbidMuh+quZ1Q=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>mRI5eCo0w9n6EVwpJRJN+JXNPBCkA0j43fIg0/baxVZAg2Gen/1KS3pqgbAxeCMTR4UuMz/rcPXH7n+ZzShlnInYD+jfxLtn0MM4pVtSbjLC9iZ+nFbmoccPte9eit8LO+IDGAYw9HuM4yRHgAQga7bktJOvExR2Oy/L1FN59a+gXQx20tf+B8mEhJNfIsUP</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


