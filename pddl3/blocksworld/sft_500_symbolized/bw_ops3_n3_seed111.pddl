(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_02 obj_03 obj_01 )
(:init
(pred_2)
(pred_4 obj_02)
(pred_5 obj_03 obj_02)
(pred_5 obj_01 obj_03)
(pred_1 obj_01)
)
(:goal
(and
(pred_5 obj_02 obj_03)
(pred_4 obj_03)
(pred_5 obj_01 obj_02))
)

(:constraints
  (sometime-before (pred_4 obj_03) (pred_5 obj_02 obj_03))
)
)