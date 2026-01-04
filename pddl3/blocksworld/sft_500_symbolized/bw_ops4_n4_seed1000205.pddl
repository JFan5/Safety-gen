(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_03 obj_04 obj_02 )
(:init
(pred_1)
(pred_5 obj_01)
(pred_5 obj_03)
(pred_3 obj_04 obj_01)
(pred_3 obj_02 obj_04)
(pred_4 obj_03)
(pred_4 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_03)
(pred_3 obj_03 obj_02)
(pred_3 obj_04 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_03 obj_02) (pred_3 obj_01 obj_03))
)
)