(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_1
obj_04 obj_07 obj_11 obj_08 - type_3
obj_13 obj_10 obj_01 obj_09 - type_2
obj_12 obj_14 obj_06 obj_03 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_04)
(pred_2 obj_02 obj_07)
(pred_4 obj_05 obj_01)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_08)
(pred_3 obj_12 obj_13)
(pred_3 obj_14 obj_10)
(pred_3 obj_06 obj_09)
(pred_3 obj_03 obj_09)
)
(:goal
(and
(pred_3 obj_12 obj_10)
(pred_3 obj_14 obj_10)
(pred_3 obj_06 obj_10)
(pred_3 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_09)))
)
)