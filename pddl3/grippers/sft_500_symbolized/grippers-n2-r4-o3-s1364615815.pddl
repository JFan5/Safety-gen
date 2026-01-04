(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_3
obj_09 obj_08 obj_01 obj_11 - type_1
obj_12 obj_04 obj_06 obj_05 - type_2
obj_07 obj_03 obj_02 - object)
(:init
(pred_1 obj_13 obj_06)
(pred_3 obj_13 obj_09)
(pred_3 obj_13 obj_08)
(pred_1 obj_10 obj_04)
(pred_3 obj_10 obj_01)
(pred_3 obj_10 obj_11)
(pred_4 obj_07 obj_04)
(pred_4 obj_03 obj_04)
(pred_4 obj_02 obj_06)
)
(:goal
(and
(pred_4 obj_07 obj_05)
(pred_4 obj_03 obj_04)
(pred_4 obj_02 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_12)))
)
)