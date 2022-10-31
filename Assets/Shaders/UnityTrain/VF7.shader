// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UnityTrain/VF7" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct v2f {
                float4 pos : POSITION;
                fixed4 color : COLOR;
            };

            v2f vert(appdata_base v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                //if (v.vertex.x > 0)
                //    o.color = fixed4(0, 0, 1, 1);
                //else
                //    o.color = fixed4(0, 1, 1, 1);
                //if (v.vertex.x == 0.5 && v.vertex.y == 0.5 && v.vertex.z == 0.5) {
                //    o.color = fixed4(0, 0, 1, 1);
                //} else {
                //    o.color = fixed4(0, 1, 1, 1);
                //}

                //float4 wpos = mul(unity_ObjectToWorld, v.vertex);
                //if (wpos.x > 0)
                //    o.color = float4(0, 1, 1, 1);
                //else
                //    o.color = float4(1, 1, 0, 1);
                
                if (v.vertex.x == 0.5) {
                    o.color = fixed4(_SinTime.w / 2 + 0.5, _CosTime.w / 2 + 0.5, _SinTime.y / 2 + 0.5, 1);
                } else  if (v.vertex.x == -0.5) {
                    o.color = fixed4(_CosTime.w / 2 + 0.5, _CosTime.w / 2 + 0.5, _SinTime.y / 2 + 0.5, 1);
                } else  if (v.vertex.y == 0.5) {
                    o.color = fixed4(_SinTime.z / 2 + 0.5, _SinTime.y / 2 + 0.5, _SinTime.x / 2 + 0.5, 1);
                } else  if (v.vertex.y == -0.5) {
                    o.color = fixed4(_CosTime.w / 2 + 0.5, _CosTime.w / 2 + 0.5, _SinTime.y / 2 + 0.5, 1);
                } else  if (v.vertex.z == 0.5) {
                    o.color = fixed4(_SinTime.z / 2 + 0.5, _SinTime.y / 2 + 0.5, _SinTime.x / 2 + 0.5, 1);
                } else  if (v.vertex.z == -0.5) {
                    o.color = fixed4(_CosTime.x / 2 + 0.5, _CosTime.y / 2 + 0.5, _SinTime.y / 2 + 0.5, 1);
                }

                return o;
            }

            fixed4 frag(v2f IN) : COLOR {
                return IN.color;
            }
            ENDCG
        }
    }
}