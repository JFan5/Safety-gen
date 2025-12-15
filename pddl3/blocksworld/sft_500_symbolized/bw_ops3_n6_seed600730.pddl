(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_05 obj_03 obj_06 obj_01 obj_02 )
(:init
(pred_3)
(pred_5 obj_04)
(pred_2 obj_05 obj_06)
(pred_5 obj_03)
(pred_2 obj_06 obj_01)
(pred_2 obj_01 obj_02)
(pred_5 obj_02)
(pred_1 obj_04)
(pred_1 obj_05)
(pred_1 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_5 obj_05)
(pred_5 obj_03)
(pred_2 obj_06 obj_04)
(pred_2 obj_01 obj_06)
(pred_2 obj_02 obj_05))
)

(:constraints
  (sometime-before (pred_5 obj_05) (pred_2 obj_04 obj_02))
)
)