(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_3
obj_05 obj_08 obj_03 obj_02 - type_1
obj_10 obj_06 obj_04 - type_2
obj_09 obj_07 obj_11 - object)
(:init
(pred_3 obj_01 obj_04)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_08)
(pred_3 obj_12 obj_04)
(pred_2 obj_12 obj_03)
(pred_2 obj_12 obj_02)
(pred_1 obj_09 obj_10)
(pred_1 obj_07 obj_04)
(pred_1 obj_11 obj_10)
)
(:goal
(and
(pred_1 obj_09 obj_10)
(pred_1 obj_07 obj_06)
(pred_1 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)