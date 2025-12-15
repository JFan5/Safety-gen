(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_01 obj_02 obj_03 )
(:init
(pred_3)
(pred_5 obj_01)
(pred_1 obj_02 obj_01)
(pred_5 obj_03)
(pred_4 obj_02)
(pred_4 obj_03)
)
(:goal
(and
(pred_1 obj_01 obj_02)
(pred_1 obj_02 obj_03)
(pred_5 obj_03))
)

(:constraints
  (sometime-before (pred_1 obj_02 obj_03) (pred_1 obj_01 obj_02))
)
)