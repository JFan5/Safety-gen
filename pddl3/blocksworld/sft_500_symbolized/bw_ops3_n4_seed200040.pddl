(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_04 obj_03 obj_01 obj_02 )
(:init
(pred_2)
(pred_5 obj_04 obj_02)
(pred_5 obj_03 obj_01)
(pred_4 obj_01)
(pred_4 obj_02)
(pred_1 obj_04)
(pred_1 obj_03)
)
(:goal
(and
(pred_5 obj_04 obj_01)
(pred_5 obj_03 obj_02)
(pred_5 obj_01 obj_03)
(pred_4 obj_02))
)

(:constraints
  (sometime-before (pred_5 obj_03 obj_02) (pred_5 obj_04 obj_01))
)
)