(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_04 obj_02 obj_03 obj_01 )
(:init
(pred_5)
(pred_1 obj_04)
(pred_2 obj_02 obj_04)
(pred_1 obj_03)
(pred_2 obj_01 obj_03)
(pred_3 obj_02)
(pred_3 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_02 obj_01)
(pred_2 obj_03 obj_04))
)

(:constraints
  (sometime-before (pred_2 obj_02 obj_01) (pred_2 obj_04 obj_02))
)
)