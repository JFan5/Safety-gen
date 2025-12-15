(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_03 obj_01 obj_02 )
(:init
(pred_1)
(pred_3 obj_03)
(pred_5 obj_01 obj_02)
(pred_3 obj_02)
(pred_2 obj_03)
(pred_2 obj_01)
)
(:goal
(and
(pred_5 obj_03 obj_01)
(pred_3 obj_01)
(pred_5 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_01) (pred_5 obj_03 obj_01))
)
)