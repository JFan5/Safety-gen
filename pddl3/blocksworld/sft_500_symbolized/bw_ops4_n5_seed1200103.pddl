(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_04 obj_02 obj_01 obj_03 obj_05 )
(:init
(pred_3)
(pred_1 obj_04)
(pred_5 obj_02 obj_04)
(pred_5 obj_01 obj_05)
(pred_5 obj_03 obj_01)
(pred_5 obj_05 obj_02)
(pred_4 obj_03)
)
(:goal
(and
(pred_5 obj_04 obj_03)
(pred_5 obj_02 obj_01)
(pred_5 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_5 obj_02 obj_01) (pred_5 obj_04 obj_03))
)
)