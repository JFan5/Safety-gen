(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_03 obj_01 obj_02 )
(:init
(pred_5)
(pred_1 obj_03)
(pred_2 obj_01 obj_03)
(pred_1 obj_02)
(pred_4 obj_01)
(pred_4 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_01)
(pred_1 obj_01)
(pred_2 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_1 obj_01) (pred_2 obj_03 obj_01))
)
)