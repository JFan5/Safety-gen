(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_04 obj_01 obj_03 obj_02 )
(:init
(pred_3)
(pred_2 obj_04 obj_01)
(pred_2 obj_01 obj_03)
(pred_2 obj_03 obj_02)
(pred_1 obj_02)
(pred_5 obj_04)
)
(:goal
(and
(pred_2 obj_04 obj_03)
(pred_1 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_02 obj_04))
)

(:constraints
  (sometime-before (pred_1 obj_01) (pred_2 obj_04 obj_03))
)
)