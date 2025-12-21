(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_04 obj_02 obj_01 )
(:init
(pred_1)
(pred_2 obj_03)
(pred_2 obj_04)
(pred_2 obj_02)
(pred_4 obj_01 obj_02)
(pred_3 obj_03)
(pred_3 obj_04)
(pred_3 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_04)
(pred_4 obj_04 obj_01)
(pred_4 obj_01 obj_02))
)

(:constraints
  (sometime-before (pred_4 obj_04 obj_01) (pred_4 obj_03 obj_04))
)
)