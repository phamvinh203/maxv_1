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
<dir table="ct50" code="stt_rec" order="stt_rec"  xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
 <fields>
    <field name="stt_rec" readOnly ="true" hidden="true">
      <header v="stt rec" e="stt rec"></header>
    </field>
    <field name="ma_dvcs" readOnly ="true" hidden="true">
      <header v="ma_dvcs" e="ma_dvcs"></header>
    </field>
	
    <field name="ct50gl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="300" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EISVDetail" row="1">
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
	 <item value="1: [ct50gl]"/>
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
        <![CDATA[<encrypted>AH/D1Np9Cy7xez6wsw8h9uTLhIvSki6PXjm84vkvywLjHzffSpxJyCeq/V76KPw5d1il8C4dXS7yT8+ZpoommEb/IFOZCLitK7TDXWOJnVIj+PGabF3TjhmWZAC7BV04CcWjlr5oKtv1Unf2KWoI0RJC/kHFeBV3dbDXacyHgQAXPSy6dhk0ZoTFBsp0eJCSAdtTmFFfjwGzfl+hq9u0M4355cj276aN4dm2qDBUryD8aiqGy36is5f/EVcgoUTDIIyah//T58/qbmgbkVcY7AJl8Kv5aItjK7vnWWXnFtyrujACgOjeTj+6fMUgQWXgogEWxLrLuk2ACQyIaH3fwmUXGDfl0rUPEeO3Sg9USjKN+g0XuQweEhrwbpyrys97DbxgWYzuRaGdujlGbRiuw6nfgAxa3cb7p7bJPve6L4m1C3iS7pp82x1nXHqE3qG7ob17fBVg91fwMHvYB6FZLrztvpwaqihHII/NzUEgOJODRauqBA5mVRMrHBuvjy1W7oYkyPQ9ZAtp7MQ85O+gbs/tV3KQho1wHvOV1FvFGdF4eFEJXR129Mgczs7cXrZf6wzkIlWhN4GfaXTKEzpVyzXtS5+CCCqtiXBwOuxpp4hDpdoEtomSQ+j64sa627cmFp/4KuSGK2dYrTRHp/hgWfqMhXQUolAuSFrwRl/1ulv2L03H5PotSX9iwCSOiQmidMSQb1gER+LT2lS79jbeKbEIWBIuDY5tpYQYxL9PiaOsN7FxpZlGeWLzQdJEfOd0TAAORrcSSWSt0I8KppRQNs3ddr9ssGpQs/MJXTjvkqEkHlgigFSRzHedIEBR14kN+fhqwV2+p9IStXQt/aCax/7qVJ5BccawTaH5oSdrOGFoLrG8Th28wlDHxzlehTzMQU7rKcTGBKvHatFEOqsMsdoTzwg4UPOshJDraOfEzgP01wjVC2MbEb962oC1MyEmwiC0xh39+uS6UqniXikS1FxGuGyn8YXVRirgEZ6iyti0P0v6VAcAq7ZFO1q3t9WvpAfu/dbihVpk5nXoBv+Fd54D6WVmEFXeWTX75ExFoq9JFZ7dRj4jptHeZiYG2kKTwmamL9WXMEZu0TLLzZPqbXq9do0Sk71SAAMDolIOFfxV8ls4E6n6IJNt0EDhFLamlSKJIYsRUxyED2QOYNxROqog3lMAMQD6c4pRqC2zG9tpQsfG3Ry3XVRh4bhteQgLN5vZqRk63Z0xqBOuB/Tp648ltu/hfgMda1dOiqBOZ1vee5Xij0S3Mg9pwU2KzqKY6TDcptLAA6HgcegOWugNS39//VUjpCoBIHAjWNMBSx5KN0RjAgkw8nY5C7r233LyZ9+vMCog3TLl/RsJQ+SncbyxudHkKEV9uZfIl939g6+HxQ5FXgiAoJtUfJB7EjVBBt5ueRB/7Sx+v4cRHgD4tx7fNBkJZ/AametnMzIoqFcgmRgEasWW+kvu+1f5LDGSdl6G0cKu8Huqc0n32nYaJg0HezaCc75xm5+/LpwlA6v2SEaHjzvgh2a5mJqr1HnrKDDQNq8BWgza7yfddECmSzNgaQtmdYPH5uRGFQaJU3RukyeFbHZZ40BV3P2BVBVVwMpkZlS+9XiahBIAI7O4vQ==</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nzSY4pieAnZquTBzRrGgY0jrCVKDrtlpU6betvz/OV/YtKF2s35A8bKtHvLj5JKEZZVnQWbXSgu0hpapQVb4ExMMzjSwRwej1EYpm6AxIDAhQ=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nziegGQvvdPwmPZ8tiRoanrC2ulR1RITZewuMzKk7ZpMLH/62tqNDlieaoGELLod34qkI+BJ3fWGM9xuvTqh7TF1Y6Aua6rMZoMbY6R0p+MOc=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nz+FiYehLkzYTnHs0xn78VJsi6eRHXs7WJHUlWsorLJI4WX+vZ59DZr5Hdk/jq1k3+89u9dDuWzYx01Jii4f33SEWUncpwczcNj/0dhp+L/bg=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMeQLDbqlfwYbDQYieplgVlJADAfNJ+fj/cD3F4/YDgXqmpco+4am+LVSdIksfJ55OxC1Nb1kVuL3dtLcgupTfJLDDz1hBtOUae85KedF5NwMyyaNZJM3BCiF2F04YyTl9/5QX0T49Y8L6Hy+IP4SqzrMCy7V0CJdicNXcXrd7Rkz</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


