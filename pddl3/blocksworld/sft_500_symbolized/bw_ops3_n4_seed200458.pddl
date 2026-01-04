(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_02 obj_04 obj_01 obj_03 )
(:init
(pred_1)
(pred_2 obj_02)
(pred_2 obj_04)
(pred_3 obj_01 obj_03)
(pred_2 obj_03)
(pred_5 obj_02)
(pred_5 obj_04)
(pred_5 obj_01)
)
(:goal
(and
(pred_3 obj_02 obj_03)
(pred_3 obj_04 obj_01)
(pred_2 obj_01)
(pred_2 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_04 obj_01) (pred_3 obj_02 obj_03))
)
)