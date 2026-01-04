(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_04 obj_01 obj_03 obj_02 )
(:init
(pred_4)
(pred_2 obj_04)
(pred_3 obj_01 obj_02)
(pred_2 obj_03)
(pred_2 obj_02)
(pred_1 obj_04)
(pred_1 obj_01)
(pred_1 obj_03)
)
(:goal
(and
(pred_3 obj_04 obj_02)
(pred_2 obj_01)
(pred_2 obj_03)
(pred_2 obj_02))
)

(:constraints
  (sometime-before (pred_2 obj_01) (pred_3 obj_04 obj_02))
)
)