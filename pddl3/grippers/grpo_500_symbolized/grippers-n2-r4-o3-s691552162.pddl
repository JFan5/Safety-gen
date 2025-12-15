(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_11 obj_13 obj_01 obj_09 - type_3
obj_05 obj_12 obj_06 obj_04 - type_2
obj_03 obj_10 obj_07 - object)
(:init
(pred_3 obj_02 obj_04)
(pred_4 obj_02 obj_11)
(pred_4 obj_02 obj_13)
(pred_3 obj_08 obj_04)
(pred_4 obj_08 obj_01)
(pred_4 obj_08 obj_09)
(pred_2 obj_03 obj_06)
(pred_2 obj_10 obj_05)
(pred_2 obj_07 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_06)
(pred_2 obj_10 obj_04)
(pred_2 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_06)))
)
)