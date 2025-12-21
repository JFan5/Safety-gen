(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_01 obj_05 obj_03 obj_04 obj_02 obj_06 )
(:init
(pred_1)
(pred_2 obj_01)
(pred_4 obj_05 obj_04)
(pred_4 obj_03 obj_05)
(pred_4 obj_04 obj_06)
(pred_4 obj_02 obj_03)
(pred_2 obj_06)
(pred_3 obj_01)
(pred_3 obj_02)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_05 obj_01)
(pred_4 obj_04 obj_03))
)

(:constraints
  (sometime-before (pred_4 obj_05 obj_01) (pred_4 obj_01 obj_04))
)
)