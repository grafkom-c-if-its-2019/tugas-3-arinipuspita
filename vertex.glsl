precision mediump float;
#define pi 3.14
attribute vec2 vPosition;
attribute vec3 vColor;
varying vec3 fColor;
uniform vec3 sudut;
uniform mat4 projection;
uniform mat4 view;
uniform float scale;
uniform vec3 memantul;
uniform float tengah;

void main() {
  fColor = vColor;
  mat4 translate = mat4(
    1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, -2.0, 1.0  
  );

  mat4 memantul = mat4(
    1.0, 0.0, 0.0, memantul.x,
    0.0, 1.0, 0.0, memantul.y,
    0.0, 0.0, 1.0, memantul.z,
    0.0, 0.0, 0.0, 1.0        
  );

  vec4 tengah_vektor = vec4(tengah, 0, 0, 1.0);

  mat4 skalasi = mat4(
    scale, 0.0, 0.0, -(tengah_vektor.x)*scale + (tengah_vektor.x),
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
  );
  gl_Position = vec4(vPosition, 0.0, 1.0) * memantul * skalasi;
  gl_Position = projection * view * translate *  gl_Position ;
}