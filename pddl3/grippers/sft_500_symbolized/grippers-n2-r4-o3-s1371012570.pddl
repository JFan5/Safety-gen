(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_06 obj_01 obj_05 obj_04 - type_2
obj_07 obj_11 obj_08 obj_13 - type_3
obj_10 obj_03 obj_02 - object)
(:init
(pred_1 obj_12 obj_13)
(pred_3 obj_12 obj_06)
(pred_3 obj_12 obj_01)
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_04)
(pred_2 obj_10 obj_07)
(pred_2 obj_03 obj_07)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_03 obj_07)
(pred_2 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_08)))
)
)