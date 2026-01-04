(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_02 obj_03 obj_01 )
(:init
(pred_2)
(pred_5 obj_02)
(pred_5 obj_03)
(pred_1 obj_01 obj_03)
(pred_3 obj_02)
(pred_3 obj_01)
)
(:goal
(and
(pred_1 obj_02 obj_03)
(pred_1 obj_03 obj_01)
(pred_5 obj_01))
)

(:constraints
  (sometime-before (pred_1 obj_03 obj_01) (pred_1 obj_02 obj_03))
)
)