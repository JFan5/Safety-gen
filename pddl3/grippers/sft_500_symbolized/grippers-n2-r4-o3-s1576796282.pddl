(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_1
obj_05 obj_10 obj_08 obj_13 - type_2
obj_09 obj_07 obj_01 obj_04 - type_3
obj_02 obj_06 obj_03 - object)
(:init
(pred_1 obj_12 obj_01)
(pred_3 obj_12 obj_05)
(pred_3 obj_12 obj_10)
(pred_1 obj_11 obj_01)
(pred_3 obj_11 obj_08)
(pred_3 obj_11 obj_13)
(pred_4 obj_02 obj_09)
(pred_4 obj_06 obj_01)
(pred_4 obj_03 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_01)
(pred_4 obj_06 obj_04)
(pred_4 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_09)))
)
)