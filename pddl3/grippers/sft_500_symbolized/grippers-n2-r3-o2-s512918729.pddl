(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_1
obj_05 obj_10 obj_07 obj_04 - type_3
obj_09 obj_03 obj_11 - type_2
obj_08 obj_02 - object)
(:init
(pred_4 obj_06 obj_09)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_10)
(pred_4 obj_01 obj_11)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_04)
(pred_3 obj_08 obj_11)
(pred_3 obj_02 obj_09)
)
(:goal
(and
(pred_3 obj_08 obj_11)
(pred_3 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_11)))
)
)