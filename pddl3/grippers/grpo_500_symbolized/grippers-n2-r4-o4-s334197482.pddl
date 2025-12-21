(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_14 obj_13 obj_05 obj_07 - type_3
obj_06 obj_11 obj_01 obj_09 - type_2
obj_10 obj_04 obj_03 obj_08 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_14)
(pred_2 obj_02 obj_13)
(pred_4 obj_12 obj_06)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_07)
(pred_3 obj_10 obj_11)
(pred_3 obj_04 obj_01)
(pred_3 obj_03 obj_01)
(pred_3 obj_08 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_11)
(pred_3 obj_04 obj_11)
(pred_3 obj_03 obj_01)
(pred_3 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_09)))
)
)