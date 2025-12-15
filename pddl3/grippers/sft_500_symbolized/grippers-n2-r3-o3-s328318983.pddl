(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_3
obj_05 obj_01 obj_03 obj_09 - type_2
obj_04 obj_06 obj_08 - type_1
obj_02 obj_10 obj_12 - object)
(:init
(pred_3 obj_07 obj_06)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_01)
(pred_3 obj_11 obj_06)
(pred_2 obj_11 obj_03)
(pred_2 obj_11 obj_09)
(pred_1 obj_02 obj_04)
(pred_1 obj_10 obj_04)
(pred_1 obj_12 obj_04)
)
(:goal
(and
(pred_1 obj_02 obj_06)
(pred_1 obj_10 obj_08)
(pred_1 obj_12 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_08)))
)
)