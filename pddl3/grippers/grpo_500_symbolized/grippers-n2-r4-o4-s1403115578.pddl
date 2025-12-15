(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_1
obj_09 obj_13 obj_01 obj_04 - type_3
obj_14 obj_08 obj_03 obj_07 - type_2
obj_11 obj_05 obj_02 obj_12 - object)
(:init
(pred_3 obj_10 obj_03)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_13)
(pred_3 obj_06 obj_07)
(pred_4 obj_06 obj_01)
(pred_4 obj_06 obj_04)
(pred_2 obj_11 obj_07)
(pred_2 obj_05 obj_08)
(pred_2 obj_02 obj_03)
(pred_2 obj_12 obj_14)
)
(:goal
(and
(pred_2 obj_11 obj_14)
(pred_2 obj_05 obj_07)
(pred_2 obj_02 obj_03)
(pred_2 obj_12 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_07)))
)
)