(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_04 obj_02 obj_03 )
(:init
(pred_5)
(pred_1 obj_01)
(pred_2 obj_04 obj_01)
(pred_1 obj_02)
(pred_2 obj_03 obj_04)
(pred_4 obj_02)
(pred_4 obj_03)
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