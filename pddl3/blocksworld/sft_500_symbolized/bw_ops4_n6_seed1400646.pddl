(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_02 obj_03 obj_06 obj_01 obj_04 )
(:init
(pred_3)
(pred_1 obj_05)
(pred_1 obj_02)
(pred_4 obj_03 obj_05)
(pred_4 obj_06 obj_03)
(pred_4 obj_01 obj_02)
(pred_4 obj_04 obj_01)
(pred_2 obj_06)
(pred_2 obj_04)
)
(:goal
(and
(pred_4 obj_05 obj_03)
(pred_4 obj_02 obj_01)
(pred_4 obj_03 obj_02)
(pred_4 obj_06 obj_04)
(pred_4 obj_01 obj_06))
)

(:constraints
  (sometime-before (pred_4 obj_02 obj_01) (pred_4 obj_05 obj_03))
)
)