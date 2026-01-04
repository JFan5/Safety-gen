(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_05 - type_1
obj_08 obj_03 obj_01 obj_09 - type_2
obj_10 obj_04 obj_02 obj_13 - type_3
obj_06 obj_12 obj_07 obj_14 - object)
(:init
(pred_2 obj_11 obj_02)
(pred_1 obj_11 obj_08)
(pred_1 obj_11 obj_03)
(pred_2 obj_05 obj_10)
(pred_1 obj_05 obj_01)
(pred_1 obj_05 obj_09)
(pred_4 obj_06 obj_02)
(pred_4 obj_12 obj_13)
(pred_4 obj_07 obj_04)
(pred_4 obj_14 obj_10)
)
(:goal
(and
(pred_4 obj_06 obj_04)
(pred_4 obj_12 obj_02)
(pred_4 obj_07 obj_02)
(pred_4 obj_14 obj_04)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_13)))
)
)