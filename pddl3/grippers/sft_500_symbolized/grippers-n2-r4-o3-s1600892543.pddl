(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_1
obj_04 obj_05 obj_10 obj_03 - type_3
obj_11 obj_08 obj_13 obj_06 - type_2
obj_07 obj_09 obj_02 - object)
(:init
(pred_4 obj_01 obj_08)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_05)
(pred_4 obj_12 obj_06)
(pred_3 obj_12 obj_10)
(pred_3 obj_12 obj_03)
(pred_1 obj_07 obj_13)
(pred_1 obj_09 obj_06)
(pred_1 obj_02 obj_11)
)
(:goal
(and
(pred_1 obj_07 obj_08)
(pred_1 obj_09 obj_06)
(pred_1 obj_02 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_13)))
)
)