(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_03 obj_02 obj_01 )
(:init
(pred_1)
(pred_2 obj_03 obj_01)
(pred_2 obj_02 obj_03)
(pred_3 obj_01)
(pred_5 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_02 obj_01)
(pred_3 obj_01))
)

(:constraints
  (sometime-before (pred_2 obj_02 obj_01) (pred_2 obj_03 obj_02))
)
)