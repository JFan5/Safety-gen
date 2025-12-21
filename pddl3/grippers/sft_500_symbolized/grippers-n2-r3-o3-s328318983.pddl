(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_04 obj_08 obj_07 obj_03 - type_2
obj_06 obj_01 obj_09 - type_3
obj_05 obj_10 obj_11 - object)
(:init
(pred_1 obj_02 obj_01)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_08)
(pred_1 obj_12 obj_01)
(pred_3 obj_12 obj_07)
(pred_3 obj_12 obj_03)
(pred_2 obj_05 obj_06)
(pred_2 obj_10 obj_06)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_10 obj_09)
(pred_2 obj_11 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_09)))
)
)