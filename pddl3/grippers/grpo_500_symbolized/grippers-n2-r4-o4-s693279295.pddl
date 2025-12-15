(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_1
obj_13 obj_09 obj_10 obj_14 - type_3
obj_02 obj_12 obj_07 obj_01 - type_2
obj_06 obj_03 obj_04 obj_05 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_4 obj_08 obj_13)
(pred_4 obj_08 obj_09)
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_10)
(pred_4 obj_11 obj_14)
(pred_2 obj_06 obj_12)
(pred_2 obj_03 obj_01)
(pred_2 obj_04 obj_07)
(pred_2 obj_05 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_03 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_07)))
)
)