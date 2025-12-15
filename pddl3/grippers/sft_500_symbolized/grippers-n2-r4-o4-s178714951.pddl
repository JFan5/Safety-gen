(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_06 - type_2
obj_03 obj_13 obj_12 obj_04 - type_1
obj_09 obj_01 obj_05 obj_02 - type_3
obj_07 obj_10 obj_11 obj_14 - object)
(:init
(pred_2 obj_08 obj_09)
(pred_3 obj_08 obj_03)
(pred_3 obj_08 obj_13)
(pred_2 obj_06 obj_01)
(pred_3 obj_06 obj_12)
(pred_3 obj_06 obj_04)
(pred_1 obj_07 obj_09)
(pred_1 obj_10 obj_01)
(pred_1 obj_11 obj_02)
(pred_1 obj_14 obj_02)
)
(:goal
(and
(pred_1 obj_07 obj_05)
(pred_1 obj_10 obj_02)
(pred_1 obj_11 obj_05)
(pred_1 obj_14 obj_05)
)
)

(:constraints
  (always (not (pred_2 obj_08 obj_05)))
)
)