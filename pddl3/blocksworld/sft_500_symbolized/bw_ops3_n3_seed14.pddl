(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_02 obj_03 obj_01 )
(:init
(pred_2)
(pred_3 obj_02)
(pred_1 obj_03 obj_01)
(pred_3 obj_01)
(pred_4 obj_02)
(pred_4 obj_03)
)
(:goal
(and
(pred_1 obj_02 obj_03)
(pred_3 obj_03)
(pred_3 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_03) (pred_1 obj_02 obj_03))
)
)