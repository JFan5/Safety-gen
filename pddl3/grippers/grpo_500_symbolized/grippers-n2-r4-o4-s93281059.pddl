(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_13 obj_12 obj_09 obj_14 - type_3
obj_08 obj_05 obj_01 obj_04 - type_2
obj_06 obj_10 obj_11 obj_03 - object)
(:init
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_13)
(pred_2 obj_02 obj_12)
(pred_4 obj_07 obj_05)
(pred_2 obj_07 obj_09)
(pred_2 obj_07 obj_14)
(pred_3 obj_06 obj_01)
(pred_3 obj_10 obj_08)
(pred_3 obj_11 obj_05)
(pred_3 obj_03 obj_08)
)
(:goal
(and
(pred_3 obj_06 obj_08)
(pred_3 obj_10 obj_01)
(pred_3 obj_11 obj_08)
(pred_3 obj_03 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_01)))
)
)