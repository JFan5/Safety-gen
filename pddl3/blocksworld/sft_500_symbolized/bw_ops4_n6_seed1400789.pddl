(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_06 obj_05 obj_04 obj_02 obj_01 obj_03 )
(:init
(pred_2)
(pred_3 obj_06 obj_04)
(pred_3 obj_05 obj_01)
(pred_4 obj_04)
(pred_3 obj_02 obj_03)
(pred_4 obj_01)
(pred_3 obj_03 obj_06)
(pred_5 obj_05)
(pred_5 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_02)
(pred_3 obj_02 obj_05)
(pred_3 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_3 obj_02 obj_05) (pred_3 obj_04 obj_02))
)
)