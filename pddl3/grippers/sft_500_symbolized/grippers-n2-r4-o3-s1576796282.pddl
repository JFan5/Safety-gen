(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_06 obj_04 obj_01 obj_02 - type_2
obj_13 obj_07 obj_12 obj_03 - type_3
obj_10 obj_05 obj_08 - object)
(:init
(pred_1 obj_11 obj_12)
(pred_3 obj_11 obj_06)
(pred_3 obj_11 obj_04)
(pred_1 obj_09 obj_12)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_02)
(pred_2 obj_10 obj_13)
(pred_2 obj_05 obj_12)
(pred_2 obj_08 obj_12)
)
(:goal
(and
(pred_2 obj_10 obj_12)
(pred_2 obj_05 obj_03)
(pred_2 obj_08 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_13)))
)
)