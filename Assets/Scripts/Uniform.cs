using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Uniform : MonoBehaviour
{
    private void OnDrawGizmosSelected()
    {
        GetComponent<Renderer>().material.SetVector("_SecondColor", new Vector4(0, 1, 0, 1));
    }
}
