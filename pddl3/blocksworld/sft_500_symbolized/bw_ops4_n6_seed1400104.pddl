(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_04 obj_02 obj_03 obj_06 obj_01 )
(:init
(pred_4)
(pred_5 obj_05 obj_03)
(pred_5 obj_04 obj_02)
(pred_3 obj_02)
(pred_5 obj_03 obj_01)
(pred_5 obj_06 obj_04)
(pred_5 obj_01 obj_06)
(pred_2 obj_05)
)
(:goal
(and
(pred_5 obj_05 obj_04)
(pred_5 obj_06 obj_03)
(pred_5 obj_01 obj_02))
)

(:constraints
  (sometime-before (pred_5 obj_06 obj_03) (pred_5 obj_05 obj_04))
)
)