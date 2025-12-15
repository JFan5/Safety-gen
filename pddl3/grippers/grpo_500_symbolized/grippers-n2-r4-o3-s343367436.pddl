(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_02 - type_1
obj_01 obj_06 obj_12 obj_07 - type_3
obj_03 obj_10 obj_09 obj_08 - type_2
obj_05 obj_04 obj_11 - object)
(:init
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_01)
(pred_4 obj_13 obj_06)
(pred_3 obj_02 obj_09)
(pred_4 obj_02 obj_12)
(pred_4 obj_02 obj_07)
(pred_2 obj_05 obj_08)
(pred_2 obj_04 obj_09)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_09)
(pred_2 obj_04 obj_10)
(pred_2 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_10)))
)
)