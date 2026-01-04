(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_04 obj_05 obj_02 obj_01 obj_03 )
(:init
(pred_1)
(pred_5 obj_04 obj_05)
(pred_5 obj_05 obj_01)
(pred_3 obj_02)
(pred_5 obj_01 obj_03)
(pred_3 obj_03)
(pred_2 obj_04)
(pred_2 obj_02)
)
(:goal
(and
(pred_5 obj_04 obj_01)
(pred_5 obj_05 obj_02)
(pred_5 obj_02 obj_04)
(pred_5 obj_01 obj_03))
)

(:constraints
  (sometime-before (pred_5 obj_05 obj_02) (pred_5 obj_04 obj_01))
)
)