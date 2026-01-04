(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_14 - type_1
obj_09 obj_11 obj_05 obj_12 - type_3
obj_01 obj_04 obj_13 obj_08 - type_2
obj_02 obj_03 obj_07 obj_06 - object)
(:init
(pred_4 obj_10 obj_01)
(pred_1 obj_10 obj_09)
(pred_1 obj_10 obj_11)
(pred_4 obj_14 obj_08)
(pred_1 obj_14 obj_05)
(pred_1 obj_14 obj_12)
(pred_3 obj_02 obj_08)
(pred_3 obj_03 obj_01)
(pred_3 obj_07 obj_01)
(pred_3 obj_06 obj_08)
)
(:goal
(and
(pred_3 obj_02 obj_08)
(pred_3 obj_03 obj_13)
(pred_3 obj_07 obj_13)
(pred_3 obj_06 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_13)))
)
)