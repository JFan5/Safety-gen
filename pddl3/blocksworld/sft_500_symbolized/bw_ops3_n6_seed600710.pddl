(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_03 obj_05 obj_02 obj_01 obj_06 obj_04 )
(:init
(pred_1)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_03)
(pred_2 obj_02 obj_04)
(pred_2 obj_01 obj_05)
(pred_5 obj_06)
(pred_2 obj_04 obj_01)
(pred_3 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_01)
(pred_5 obj_05)
(pred_2 obj_02 obj_05)
(pred_5 obj_01)
(pred_2 obj_06 obj_03)
(pred_2 obj_04 obj_02))
)

(:constraints
  (sometime-before (pred_5 obj_05) (pred_2 obj_03 obj_01))
)
)