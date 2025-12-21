(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_1
obj_11 obj_03 obj_07 obj_06 - type_2
obj_10 obj_01 obj_09 obj_08 - type_3
obj_02 obj_05 obj_13 - object)
(:init
(pred_1 obj_04 obj_10)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_03)
(pred_1 obj_12 obj_01)
(pred_3 obj_12 obj_07)
(pred_3 obj_12 obj_06)
(pred_2 obj_02 obj_09)
(pred_2 obj_05 obj_01)
(pred_2 obj_13 obj_09)
)
(:goal
(and
(pred_2 obj_02 obj_08)
(pred_2 obj_05 obj_10)
(pred_2 obj_13 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_09)))
)
)