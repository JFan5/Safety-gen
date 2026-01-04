(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_09 - type_2
obj_10 obj_08 obj_14 obj_12 - type_1
obj_01 obj_03 obj_13 obj_02 - type_3
obj_05 obj_06 obj_11 obj_07 - object)
(:init
(pred_2 obj_04 obj_02)
(pred_3 obj_04 obj_10)
(pred_3 obj_04 obj_08)
(pred_2 obj_09 obj_02)
(pred_3 obj_09 obj_14)
(pred_3 obj_09 obj_12)
(pred_1 obj_05 obj_03)
(pred_1 obj_06 obj_02)
(pred_1 obj_11 obj_01)
(pred_1 obj_07 obj_13)
)
(:goal
(and
(pred_1 obj_05 obj_13)
(pred_1 obj_06 obj_03)
(pred_1 obj_11 obj_01)
(pred_1 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_13)))
)
)