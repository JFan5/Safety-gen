(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_02 obj_05 obj_04 obj_01 obj_03 )
(:init
(pred_1)
(pred_4 obj_02)
(pred_3 obj_05 obj_03)
(pred_4 obj_04)
(pred_3 obj_01 obj_05)
(pred_4 obj_03)
(pred_5 obj_02)
(pred_5 obj_04)
(pred_5 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_04)
(pred_3 obj_04 obj_02)
(pred_3 obj_01 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_04 obj_02) (pred_3 obj_05 obj_04))
)
)