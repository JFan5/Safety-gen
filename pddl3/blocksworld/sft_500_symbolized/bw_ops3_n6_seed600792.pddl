(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_01 obj_03 obj_02 obj_06 obj_05 )
(:init
(pred_4)
(pred_3 obj_04 obj_02)
(pred_3 obj_01 obj_03)
(pred_2 obj_03)
(pred_3 obj_02 obj_05)
(pred_2 obj_06)
(pred_2 obj_05)
(pred_5 obj_04)
(pred_5 obj_01)
(pred_5 obj_06)
)
(:goal
(and
(pred_3 obj_04 obj_06)
(pred_2 obj_01)
(pred_3 obj_03 obj_01)
(pred_3 obj_02 obj_03)
(pred_3 obj_06 obj_05)
(pred_2 obj_05))
)

(:constraints
  (sometime-before (pred_2 obj_01) (pred_3 obj_04 obj_06))
)
)