// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UnityTrain/VF10" {
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
                float angle = length(v.vertex) * _SinTime.w;
                float cosValue = cos(angle);
                float sinValue = sin(angle);
                //float4x4 rotationMatrix = {
                //    float4(cosValue, 0, sinValue, 0),
                //    float4(0, 1, 0, 0),
                //    float4(-sinValue, 0, cosValue, 0),
                //    float4(0, 0, 0, 1)
                //};
                //float4x4 mvp = UNITY_MATRIX_MVP;

                ////rotationMatrix = mul(mvp, rotationMatrix);
                //v.vertex = mul(rotationMatrix, v.vertex);

                //”≈ªØ
                float x = cosValue * v.vertex.x + sinValue * v.vertex.z;
                float z = -sinValue * v.vertex.x + cosValue * v.vertex.z;
                v.vertex.x = x;
                v.vertex.z = z;
                v2f o;
                //o.pos = mul(rotationMatrix, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = fixed4(1, 1, 0, 1);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target {
                return i.color;
            }
            ENDCG
        }
    }
}