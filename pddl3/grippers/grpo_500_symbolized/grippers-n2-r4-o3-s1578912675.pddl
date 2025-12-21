(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_1
obj_05 obj_10 obj_13 obj_11 - type_3
obj_12 obj_07 obj_06 obj_08 - type_2
obj_09 obj_04 obj_03 - object)
(:init
(pred_4 obj_01 obj_12)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_10)
(pred_4 obj_02 obj_12)
(pred_2 obj_02 obj_13)
(pred_2 obj_02 obj_11)
(pred_3 obj_09 obj_06)
(pred_3 obj_04 obj_06)
(pred_3 obj_03 obj_08)
)
(:goal
(and
(pred_3 obj_09 obj_07)
(pred_3 obj_04 obj_08)
(pred_3 obj_03 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_06)))
)
)