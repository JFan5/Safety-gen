(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_01 obj_03 obj_02 )
(:init
(pred_2)
(pred_3 obj_01)
(pred_3 obj_03)
(pred_3 obj_02)
(pred_1 obj_01)
(pred_1 obj_03)
(pred_1 obj_02)
)
(:goal
(and
(pred_5 obj_01 obj_03)
(pred_5 obj_03 obj_02)
(pred_3 obj_02))
)

(:constraints
  (sometime-before (pred_5 obj_03 obj_02) (pred_5 obj_01 obj_03))
)
)