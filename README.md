# lua_vs_python_DL


---

## 구현 환경

- OS : ubuntu 14.04
- Docker

## 모델 크기

-- stage 1 : mean suppresion -> filter bank -> squashing -> max pooling
model:add(nn.SpatialConvolutionMM(1, 32, 5, 5))
model:add(nn.Tanh())
model:add(nn.SpatialMaxPooling(3, 3, 3, 3, 1, 1))
-- stage 2 : mean suppresion -> filter bank -> squashing -> max pooling
model:add(nn.SpatialConvolutionMM(32, 64, 5, 5))
model:add(nn.Tanh())
model:add(nn.SpatialMaxPooling(2, 2, 2, 2))
-- stage 3 : standard 2-layer MLP:
model:add(nn.Reshape(64*3*3))
model:add(nn.Linear(64*3*3, 200))
model:add(nn.Tanh())
model:add(nn.Linear(200, #classes))


## 후기

된다. 되긴 된다.

근데 Python도 사실상 SDK를 사용하는 뻘같이 구현해서 비슷한 속도를 볼 순 있긴한데

이게 Lua의 특성 탓인지 뭔지는 모르겠지만 트랜드에 따라서 Lua에서 Python으로 넘어간걸 확인 할 수 있었다

~~GPU 비용 tlqkf~~

## 참고 자료

https://github.com/torch/demos/tree/master/train-a-digit-classifier