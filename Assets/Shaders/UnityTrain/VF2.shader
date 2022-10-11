Shader "UnityTrain/VF2" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "CGLearn/CGINCLearn.cginc"

            //为什么把out pos 放在前面颜色就无法输出？参数输出顺序也有关系
            void vert(in float2 objPos : POSITION, out float4 col : COLOR, out float4 pos : POSITION) {
                pos = float4(objPos, 0, 1);
                //出现颜色渐变，光栅化阶段会对颜色进行插值
                //if (pos.x < 0 && pos.y < 0) {
                //    col = float4(1, 0, 0, 1);
                //} else if (pos.x < 0) {
                //    col = float4(1, 1,1, 1);
                //} else if (pos.y > 0) {
                //    col = float4(0, 1, 0, 1);
                //} else {
                //    col = float4(0, 0, 1, 1);
                //}
                if (pos.x < 0 && pos.y < 0) {
                    col = float4(1, 0, 0, 1);
                } else if (pos.x < 0 && pos.y > 0) {
                    col = float4(1, 1, 1, 1);
                } else if (pos.x > 0 && pos.y < 0) {
                    col = float4(0, 1, 0, 1);
                } else {
                    col = float4(0, 0, 1, 1);
                }
                //col = pos;
            }

            void frag(inout float4 col : COLOR) {
                //CG不支持switch
                //for (float i = 0; i < 0.5f; i += 0.01) {
                //    col = float4(i, 0, 0, 1);
                //}
                //CG中不支持指针，仅值拷贝传参
                //ChangeColor(col);
                float arr[]={0.5,0.5};
                col.x=ChangeColor2(arr);
            }

            ENDCG
        }
    }
    //CG内建函数：
    //数学函数、几何函数、纹理函数、导数函数
}
