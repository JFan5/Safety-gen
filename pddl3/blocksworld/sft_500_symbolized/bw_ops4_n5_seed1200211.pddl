(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_05 obj_03 obj_01 obj_02 obj_04 )
(:init
(pred_3)
(pred_4 obj_05)
(pred_4 obj_03)
(pred_2 obj_01 obj_05)
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_03)
(pred_5 obj_02)
(pred_5 obj_04)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_02 obj_03)
(pred_2 obj_04 obj_05))
)

(:constraints
  (sometime-before (pred_2 obj_02 obj_03) (pred_2 obj_01 obj_02))
)
)