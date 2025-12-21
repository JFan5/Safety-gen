(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_13 - type_1
obj_12 obj_09 obj_04 obj_07 - type_3
obj_11 obj_01 obj_05 obj_08 - type_2
obj_03 obj_14 obj_02 obj_10 - object)
(:init
(pred_4 obj_06 obj_08)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_09)
(pred_4 obj_13 obj_08)
(pred_2 obj_13 obj_04)
(pred_2 obj_13 obj_07)
(pred_3 obj_03 obj_01)
(pred_3 obj_14 obj_11)
(pred_3 obj_02 obj_11)
(pred_3 obj_10 obj_01)
)
(:goal
(and
(pred_3 obj_03 obj_01)
(pred_3 obj_14 obj_08)
(pred_3 obj_02 obj_05)
(pred_3 obj_10 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_05)))
)
)