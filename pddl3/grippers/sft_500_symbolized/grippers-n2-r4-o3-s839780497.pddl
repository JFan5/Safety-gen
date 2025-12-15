(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_13 - type_1
obj_08 obj_01 obj_11 obj_06 - type_3
obj_10 obj_03 obj_05 obj_09 - type_2
obj_04 obj_12 obj_02 - object)
(:init
(pred_2 obj_07 obj_09)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_01)
(pred_2 obj_13 obj_09)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_06)
(pred_3 obj_04 obj_05)
(pred_3 obj_12 obj_10)
(pred_3 obj_02 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_09)
(pred_3 obj_12 obj_05)
(pred_3 obj_02 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_05)))
)
)