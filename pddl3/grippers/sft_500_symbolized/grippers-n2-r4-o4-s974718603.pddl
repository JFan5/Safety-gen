(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_07 obj_14 obj_03 obj_10 - type_3
obj_08 obj_04 obj_13 obj_01 - type_2
obj_05 obj_12 obj_09 obj_11 - object)
(:init
(pred_4 obj_06 obj_04)
(pred_3 obj_06 obj_07)
(pred_3 obj_06 obj_14)
(pred_4 obj_02 obj_04)
(pred_3 obj_02 obj_03)
(pred_3 obj_02 obj_10)
(pred_2 obj_05 obj_04)
(pred_2 obj_12 obj_13)
(pred_2 obj_09 obj_01)
(pred_2 obj_11 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_08)
(pred_2 obj_12 obj_04)
(pred_2 obj_09 obj_04)
(pred_2 obj_11 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_13)))
)
)