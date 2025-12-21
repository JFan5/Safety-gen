(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_14 - type_1
obj_09 obj_05 obj_03 obj_13 - type_2
obj_04 obj_01 obj_02 obj_10 - type_3
obj_11 obj_08 obj_12 obj_06 - object)
(:init
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_05)
(pred_1 obj_14 obj_10)
(pred_3 obj_14 obj_03)
(pred_3 obj_14 obj_13)
(pred_2 obj_11 obj_02)
(pred_2 obj_08 obj_04)
(pred_2 obj_12 obj_04)
(pred_2 obj_06 obj_02)
)
(:goal
(and
(pred_2 obj_11 obj_04)
(pred_2 obj_08 obj_02)
(pred_2 obj_12 obj_10)
(pred_2 obj_06 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_02)))
)
)