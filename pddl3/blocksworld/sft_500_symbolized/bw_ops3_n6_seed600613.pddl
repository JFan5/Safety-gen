(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_03 obj_02 obj_01 obj_05 obj_06 )
(:init
(pred_1)
(pred_2 obj_04 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_02 obj_04)
(pred_5 obj_01)
(pred_2 obj_05 obj_01)
(pred_5 obj_06)
(pred_4 obj_03)
(pred_4 obj_06)
)
(:goal
(and
(pred_5 obj_04)
(pred_5 obj_03)
(pred_2 obj_02 obj_04)
(pred_5 obj_01)
(pred_5 obj_05)
(pred_2 obj_06 obj_03))
)

(:constraints
  (sometime-before (pred_5 obj_03) (pred_5 obj_04))
)
)