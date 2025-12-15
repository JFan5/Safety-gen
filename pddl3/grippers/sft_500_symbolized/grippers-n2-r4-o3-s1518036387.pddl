(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_2
obj_09 obj_11 obj_04 obj_07 - type_1
obj_08 obj_10 obj_06 obj_01 - type_3
obj_13 obj_05 obj_12 - object)
(:init
(pred_4 obj_03 obj_10)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_11)
(pred_4 obj_02 obj_10)
(pred_2 obj_02 obj_04)
(pred_2 obj_02 obj_07)
(pred_1 obj_13 obj_08)
(pred_1 obj_05 obj_06)
(pred_1 obj_12 obj_01)
)
(:goal
(and
(pred_1 obj_13 obj_01)
(pred_1 obj_05 obj_10)
(pred_1 obj_12 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_06)))
)
)