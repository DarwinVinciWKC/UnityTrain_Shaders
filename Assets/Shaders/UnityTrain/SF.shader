Shader "UnityTrain/SF" {//Surface Shader
    Properties {
        //除了要在此处做属性声明之外，还需要在CGPROGRAM中做对应的声明，但类型表示方式方式不一样
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" { }
        _Glossiness ("Smoothness", Range(0, 1)) = 0.5//高光的光泽
        _Metallic ("Metallic", Range(0, 1)) = 0.0//金属质感

    }
    SubShader {
        //无Pass通道，Surface Shader会编译为顶点和片元着色器
        Tags { "RenderType" = "Opaque" }//渲染类型，不透明
        LOD 200

        CGPROGRAM//程序块，代表CG代码编写
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        //pragma 指一个编译指令
        //surface：此shader按照surface shader的方式来编写
        //surf：函数名称
        //Standard：光照模型，也是一个函数，在函数库中，实际函数名称为LightningStandard，我们只使用Lighting后的部分
        //fullforwardshader：支持所有类型的光源的阴影，directional light, spot light and point light

        /******************************************************************************************************************/
        //在Unity安装目录下：...\Editor\Data\CGIncludes\UnityPBSLighting.cginc
        //https://github.com/DarwinVinciWKC/builtin_shaders-2021.3.4f1/blob/main/CGIncludes/UnityPBSLighting.cginc
        //只使用Lighting后的部分
        //inline half4 LightingStandard(SurfaceOutputStandard s, float3 viewDir, UnityGI gi) {
        //    s.Normal = normalize(s.Normal);

        //    half oneMinusReflectivity;
        //    half3 specColor;
        //    s.Albedo = DiffuseAndSpecularFromMetallic(s.Albedo, s.Metallic, /*out*/ specColor, /*out*/ oneMinusReflectivity);

        //    // shader relies on pre-multiply alpha-blend (_SrcBlend = One, _DstBlend = OneMinusSrcAlpha)
        //    // this is necessary to handle transparency in physically correct way - only diffuse component gets affected by alpha
        //    half outputAlpha;
        //    s.Albedo = PreMultiplyAlpha(s.Albedo, s.Alpha, oneMinusReflectivity, /*out*/ outputAlpha);

        //    half4 c = UNITY_BRDF_PBS(s.Albedo, specColor, oneMinusReflectivity, s.Smoothness, s.Normal, viewDir, gi.light, gi.indirect);
        //    c.a = outputAlpha;
        //    return c;
        //}
        /******************************************************************************************************************/
        //...\Editor\Data\CGIncludes\Lighting.cginc，关于光照的函数

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;//sampler2D二维纹理，与上方定义的_MainTex对应

        struct Input {
            float2 uv_MainTex;//UV纹理坐标，必须以uv开头，或uv2，后面的名称必须也要和使用的纹理名称相一致

        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
        // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        //没有以返回值的方式输出
        //in描述的是输入，out描述的是输出，没有写则默认为in，inout即是输入，又是输出
        //Input：数据类型，SurfaceOutputStandard：数据类型
        void surf(Input IN, inout SurfaceOutputStandard o) {
            // Albedo comes from a texture tinted by color
            //声明一个颜色值，tex2D：一个函数，对纹理坐标进行采样，得到一个颜色
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;//将颜色值取rgb值交给结构体的Albedo
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;//将颜色取值alpha值交给结构体的Alpha

        }
        ENDCG
    }
    FallBack "Diffuse"
}