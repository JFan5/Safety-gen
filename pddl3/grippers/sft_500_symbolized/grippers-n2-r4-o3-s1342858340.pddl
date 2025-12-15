(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_3
obj_10 obj_12 obj_13 obj_08 - type_2
obj_07 obj_04 obj_06 obj_03 - type_1
obj_01 obj_09 obj_11 - object)
(:init
(pred_2 obj_02 obj_07)
(pred_1 obj_02 obj_10)
(pred_1 obj_02 obj_12)
(pred_2 obj_05 obj_07)
(pred_1 obj_05 obj_13)
(pred_1 obj_05 obj_08)
(pred_4 obj_01 obj_07)
(pred_4 obj_09 obj_03)
(pred_4 obj_11 obj_07)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_09 obj_06)
(pred_4 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_06)))
)
)