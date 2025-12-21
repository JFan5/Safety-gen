(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_13 obj_10 obj_08 obj_12 - type_3
obj_01 obj_03 obj_09 obj_04 - type_2
obj_02 obj_06 obj_11 - object)
(:init
(pred_4 obj_05 obj_04)
(pred_2 obj_05 obj_13)
(pred_2 obj_05 obj_10)
(pred_4 obj_07 obj_01)
(pred_2 obj_07 obj_08)
(pred_2 obj_07 obj_12)
(pred_3 obj_02 obj_01)
(pred_3 obj_06 obj_09)
(pred_3 obj_11 obj_04)
)
(:goal
(and
(pred_3 obj_02 obj_09)
(pred_3 obj_06 obj_04)
(pred_3 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_09)))
)
)