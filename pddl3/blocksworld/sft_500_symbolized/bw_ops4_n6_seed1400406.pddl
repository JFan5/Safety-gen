(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_06 obj_03 obj_04 obj_02 obj_01 )
(:init
(pred_4)
(pred_3 obj_05)
(pred_3 obj_06)
(pred_5 obj_03 obj_04)
(pred_5 obj_04 obj_06)
(pred_5 obj_02 obj_05)
(pred_5 obj_01 obj_02)
(pred_1 obj_03)
(pred_1 obj_01)
)
(:goal
(and
(pred_5 obj_06 obj_01)
(pred_5 obj_03 obj_02)
(pred_5 obj_02 obj_06))
)

(:constraints
  (sometime-before (pred_5 obj_03 obj_02) (pred_5 obj_06 obj_01))
)
)