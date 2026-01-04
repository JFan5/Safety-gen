(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_01 obj_05 obj_02 obj_03 obj_04 )
(:init
(pred_1)
(pred_2 obj_01 obj_04)
(pred_2 obj_05 obj_01)
(pred_5 obj_02)
(pred_2 obj_03 obj_02)
(pred_5 obj_04)
(pred_4 obj_05)
(pred_4 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_03)
(pred_2 obj_05 obj_02)
(pred_2 obj_02 obj_04)
(pred_5 obj_03)
(pred_5 obj_04))
)

(:constraints
  (sometime-before (pred_2 obj_05 obj_02) (pred_2 obj_01 obj_03))
)
)