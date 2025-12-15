(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_07 obj_08 obj_12 obj_10 - type_3
obj_09 obj_03 obj_01 obj_06 - type_2
obj_02 obj_04 obj_11 - object)
(:init
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_07)
(pred_4 obj_13 obj_08)
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_10)
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_01)
(pred_2 obj_11 obj_01)
)
(:goal
(and
(pred_2 obj_02 obj_06)
(pred_2 obj_04 obj_06)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_01)))
)
)