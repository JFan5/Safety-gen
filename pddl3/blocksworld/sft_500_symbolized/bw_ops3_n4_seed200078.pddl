(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_02 obj_01 obj_03 obj_04 )
(:init
(pred_4)
(pred_3 obj_02)
(pred_5 obj_01 obj_04)
(pred_5 obj_03 obj_01)
(pred_5 obj_04 obj_02)
(pred_1 obj_03)
)
(:goal
(and
(pred_5 obj_02 obj_04)
(pred_3 obj_01)
(pred_3 obj_03)
(pred_5 obj_04 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_01) (pred_5 obj_02 obj_04))
)
)