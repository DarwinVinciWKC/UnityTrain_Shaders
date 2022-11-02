using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SteamerLight : MonoBehaviour
{
    public float dis = -1;
    public float r = 0.1f;
    public float speed = 1;
    Material material;
    void Start()
    {
        material = GetComponent<Renderer>().material;
    }

    void Update()
    {
        dis += Time.deltaTime * speed;
        material.SetFloat("dis", dis);
        material.SetFloat("r", r);
        if (dis >= 1)
            dis = -1;
    }
}
