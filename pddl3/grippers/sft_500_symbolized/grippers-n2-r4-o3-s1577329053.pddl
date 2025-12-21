(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_07 obj_13 obj_04 obj_12 - type_2
obj_03 obj_02 obj_05 obj_10 - type_3
obj_11 obj_09 obj_01 - object)
(:init
(pred_1 obj_06 obj_03)
(pred_3 obj_06 obj_07)
(pred_3 obj_06 obj_13)
(pred_1 obj_08 obj_02)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_12)
(pred_2 obj_11 obj_03)
(pred_2 obj_09 obj_02)
(pred_2 obj_01 obj_05)
)
(:goal
(and
(pred_2 obj_11 obj_03)
(pred_2 obj_09 obj_02)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_05)))
)
)