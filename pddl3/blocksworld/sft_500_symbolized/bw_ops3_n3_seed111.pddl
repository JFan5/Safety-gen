(define (problem BW-rand-3)
(:domain blocksworld)
(:objects obj_03 obj_02 obj_01 )
(:init
(pred_5)
(pred_2 obj_03)
(pred_4 obj_02 obj_03)
(pred_4 obj_01 obj_02)
(pred_1 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_2 obj_02)
(pred_4 obj_01 obj_03))
)

(:constraints
  (sometime-before (pred_2 obj_02) (pred_4 obj_03 obj_02))
)
)