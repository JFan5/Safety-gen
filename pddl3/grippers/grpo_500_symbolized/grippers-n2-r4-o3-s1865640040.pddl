(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_07 obj_06 obj_09 obj_01 - type_3
obj_03 obj_13 obj_05 obj_12 - type_2
obj_04 obj_10 obj_02 - object)
(:init
(pred_4 obj_08 obj_13)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_06)
(pred_4 obj_11 obj_13)
(pred_2 obj_11 obj_09)
(pred_2 obj_11 obj_01)
(pred_3 obj_04 obj_13)
(pred_3 obj_10 obj_12)
(pred_3 obj_02 obj_12)
)
(:goal
(and
(pred_3 obj_04 obj_05)
(pred_3 obj_10 obj_12)
(pred_3 obj_02 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_05)))
)
)