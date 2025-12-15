(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_01 obj_04 obj_02 )
(:init
(pred_1)
(pred_4 obj_03)
(pred_5 obj_01 obj_02)
(pred_5 obj_04 obj_01)
(pred_5 obj_02 obj_03)
(pred_3 obj_04)
)
(:goal
(and
(pred_5 obj_03 obj_02)
(pred_4 obj_01)
(pred_4 obj_04)
(pred_5 obj_02 obj_04))
)

(:constraints
  (sometime-before (pred_4 obj_01) (pred_5 obj_03 obj_02))
)
)