(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_02 obj_03 obj_04 )
(:init
(pred_2)
(pred_3 obj_01)
(pred_4 obj_02 obj_01)
(pred_4 obj_03 obj_04)
(pred_3 obj_04)
(pred_5 obj_02)
(pred_5 obj_03)
)
(:goal
(and
(pred_4 obj_01 obj_03)
(pred_3 obj_02)
(pred_3 obj_03)
(pred_4 obj_04 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_02) (pred_4 obj_01 obj_03))
)
)