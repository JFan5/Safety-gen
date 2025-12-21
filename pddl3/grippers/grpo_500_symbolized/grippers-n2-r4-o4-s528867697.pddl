(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_14 - type_1
obj_08 obj_03 obj_01 obj_13 - type_3
obj_07 obj_09 obj_12 obj_10 - type_2
obj_02 obj_11 obj_05 obj_06 - object)
(:init
(pred_4 obj_04 obj_12)
(pred_2 obj_04 obj_08)
(pred_2 obj_04 obj_03)
(pred_4 obj_14 obj_09)
(pred_2 obj_14 obj_01)
(pred_2 obj_14 obj_13)
(pred_3 obj_02 obj_09)
(pred_3 obj_11 obj_12)
(pred_3 obj_05 obj_07)
(pred_3 obj_06 obj_10)
)
(:goal
(and
(pred_3 obj_02 obj_10)
(pred_3 obj_11 obj_12)
(pred_3 obj_05 obj_07)
(pred_3 obj_06 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_10)))
)
)