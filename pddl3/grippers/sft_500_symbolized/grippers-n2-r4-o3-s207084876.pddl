(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_1
obj_12 obj_13 obj_11 obj_10 - type_2
obj_06 obj_02 obj_09 obj_05 - type_3
obj_08 obj_01 obj_03 - object)
(:init
(pred_1 obj_07 obj_09)
(pred_3 obj_07 obj_12)
(pred_3 obj_07 obj_13)
(pred_1 obj_04 obj_09)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_10)
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_05)
(pred_2 obj_03 obj_06)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_01 obj_06)
(pred_2 obj_03 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_05)))
)
)