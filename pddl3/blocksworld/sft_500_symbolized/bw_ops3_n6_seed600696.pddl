(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_02 obj_06 obj_05 obj_01 obj_03 )
(:init
(pred_4)
(pred_3 obj_04 obj_03)
(pred_3 obj_02 obj_01)
(pred_2 obj_06)
(pred_2 obj_05)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_06)
(pred_5 obj_02)
(pred_5 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_2 obj_02)
(pred_2 obj_06)
(pred_3 obj_05 obj_02)
(pred_3 obj_01 obj_03)
(pred_3 obj_03 obj_06))
)

(:constraints
  (sometime-before (pred_2 obj_02) (pred_3 obj_04 obj_01))
)
)