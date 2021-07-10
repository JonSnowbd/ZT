#version 330 core

out vec4 FragColor;

in vec4 VertexColor;
in vec2 VertexTexPos;

uniform sampler2D sprite;

void main()
{
    FragColor = texture(sprite, VertexTexPos) * VertexColor;
}