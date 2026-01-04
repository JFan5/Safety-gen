(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_02 obj_06 obj_03 obj_01 obj_05 )
(:init
(pred_2)
(pred_3 obj_04 obj_02)
(pred_3 obj_02 obj_06)
(pred_3 obj_06 obj_05)
(pred_1 obj_03)
(pred_1 obj_01)
(pred_3 obj_05 obj_03)
(pred_4 obj_04)
(pred_4 obj_01)
)
(:goal
(and
(pred_3 obj_04 obj_03)
(pred_1 obj_02)
(pred_1 obj_06)
(pred_3 obj_03 obj_01)
(pred_3 obj_01 obj_05)
(pred_3 obj_05 obj_02))
)

(:constraints
  (sometime-before (pred_1 obj_02) (pred_3 obj_04 obj_03))
)
)