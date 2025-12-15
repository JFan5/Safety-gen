(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_2
obj_12 obj_01 obj_14 obj_10 - type_3
obj_05 obj_09 obj_11 obj_07 - type_1
obj_04 obj_13 obj_08 obj_06 - object)
(:init
(pred_3 obj_03 obj_11)
(pred_1 obj_03 obj_12)
(pred_1 obj_03 obj_01)
(pred_3 obj_02 obj_05)
(pred_1 obj_02 obj_14)
(pred_1 obj_02 obj_10)
(pred_4 obj_04 obj_09)
(pred_4 obj_13 obj_05)
(pred_4 obj_08 obj_09)
(pred_4 obj_06 obj_07)
)
(:goal
(and
(pred_4 obj_04 obj_11)
(pred_4 obj_13 obj_11)
(pred_4 obj_08 obj_07)
(pred_4 obj_06 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_07)))
)
)